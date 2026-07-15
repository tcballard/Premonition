import SwiftUI

struct PopoverView: View {
    let model: PresentationModel
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Toggle(Strings.pauseWatching, isOn: Binding(get: { model.isPaused }, set: { model.setPaused($0) }))
                    .toggleStyle(.switch)
                Spacer()
                Menu {
                    SettingsLink { Text(Strings.settings + "…") }
                    Button(Strings.openConfig) { model.openConfigFile() }
                        .disabled(!FileManager.default.fileExists(atPath: model.configurationURL.path))
                    Divider()
                    Button(Strings.quit) { model.quit() }
                } label: {
                    Image(systemName: "gearshape").accessibilityLabel(Strings.settings)
                }.menuStyle(.borderlessButton)
            }
            Divider()
            if let fix = model.heldFix {
                FixCard(model: model, fix: fix)
            } else if model.configuration.allowlistedRoots.isEmpty {
                VStack(spacing: 12) {
                    Image(systemName: "eye.slash").font(.system(size: 36)).foregroundStyle(.secondary)
                    Text(Strings.emptyState).multilineTextAlignment(.center)
                    Button(Strings.setUp) { model.addRoot() }.buttonStyle(.borderedProminent)
                }.frame(maxWidth: .infinity).padding(.vertical, 24)
            } else {
                Label(model.isPaused ? Strings.paused : Strings.watching, systemImage: model.isPaused ? "eye.slash" : "eye")
                    .font(.headline)
                Text(Strings.waitingForError).foregroundStyle(.secondary)
            }
            Divider()
            HStack {
                Text(model.lastRunStatus)
                Spacer()
                Text("\(model.dailyCount) / \(model.configuration.dailyCap)")
                    .monospacedDigit().accessibilityLabel(Strings.dailyCount)
            }.font(.caption).foregroundStyle(.secondary)
        }.padding(12).frame(width: 480).frame(maxHeight: 440)
    }
}

private struct FixCard: View {
    let model: PresentationModel
    let fix: PresentationModel.HeldFix
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(fix.errorLine).font(.headline).lineLimit(1).truncationMode(.middle)
            Text(fix.repositoryName).font(.caption).foregroundStyle(.secondary)
            ScrollView([.vertical, .horizontal]) {
                if isSummarised {
                    Text(renderedDiff).font(.system(size: 11, design: .monospaced)).textSelection(.enabled)
                        .frame(maxWidth: .infinity, alignment: .leading)
                } else {
                    LazyVStack(alignment: .leading, spacing: 0) {
                        ForEach(Array(renderedLines.enumerated()), id: \.offset) { _, line in
                            DiffLine(text: line)
                        }
                    }.textSelection(.enabled)
                }
            }.frame(maxHeight: 260)
                .accessibilityLabel(Strings.patchPreview)
            if let rationale = fix.rationale {
                VStack(alignment: .leading, spacing: 4) {
                    Text(Strings.solRationale).font(.caption).bold()
                    Text(rationale).font(.caption).foregroundStyle(.secondary)
                }
            }
            HStack {
                Button(Strings.apply) { Task { await model.applyFix() } }
                    .buttonStyle(.borderedProminent).disabled(!model.applyEnabled).keyboardShortcut(.return)
                Button(Strings.copyPatch) { model.copyPatch() }
                Button(Strings.dismiss) { model.dismissFix() }
            }
        }
    }
    private var renderedLines: [String] { fix.diff.text.components(separatedBy: .newlines) }
    private var isSummarised: Bool {
        renderedLines.count > model.configuration.renderBudgetLines || fix.diff.files.count > 3
    }
    private var renderedDiff: String {
        return !isSummarised
            ? fix.diff.text
            : fix.diff.files.map { file in
                let added = file.lines.filter { $0.hasPrefix("+") && !$0.hasPrefix("+++") }.count
                let removed = file.lines.filter { $0.hasPrefix("-") && !$0.hasPrefix("---") }.count
                return "\(file.newPath)  +\(added) −\(removed)"
            }.joined(separator: "\n") + "\n\n" + Strings.largePatch
    }
}

private struct DiffLine: View {
    let text: String

    private enum Kind { case added, removed, context, header }
    private var kind: Kind {
        if text.hasPrefix("+") && !text.hasPrefix("+++") { return .added }
        if text.hasPrefix("-") && !text.hasPrefix("---") { return .removed }
        if text.hasPrefix(" ") { return .context }
        return .header
    }
    private var background: Color {
        switch kind {
        case .added: Color(nsColor: .systemGreen).opacity(0.12)
        case .removed: Color(nsColor: .systemRed).opacity(0.12)
        case .context, .header: .clear
        }
    }
    private var gutter: Color {
        switch kind {
        case .added: Color(nsColor: .systemGreen)
        case .removed: Color(nsColor: .systemRed)
        case .context, .header: .clear
        }
    }

    var body: some View {
        HStack(spacing: 4) {
            Rectangle().fill(gutter).frame(width: 2)
            Text(text.isEmpty ? " " : text)
                .font(.system(size: 11, design: .monospaced))
                .foregroundStyle(kind == .context ? .secondary : .primary)
                .fixedSize(horizontal: true, vertical: false)
        }
        .padding(.vertical, 1)
        .background(background)
        .accessibilityLabel(accessibilityDescription)
    }

    private var accessibilityDescription: String {
        switch kind {
        case .added: return Strings.addedLine + ": " + text.dropFirst()
        case .removed: return Strings.removedLine + ": " + text.dropFirst()
        case .context: return Strings.contextLine + ": " + text.dropFirst()
        case .header: return text
        }
    }
}
