import SwiftUI

struct PopoverView: View {
    let model: PresentationModel
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Toggle(Strings.pauseWatching, isOn: Binding(get: { model.isPaused }, set: { model.setPaused($0) }))
                    .toggleStyle(.switch)
                Spacer()
                SettingsLink { Image(systemName: "gearshape").accessibilityLabel(Strings.settings) }
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
            Text(model.lastRunStatus).font(.caption).foregroundStyle(.secondary)
        }.padding(12).frame(width: 480)
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
                Text(renderedDiff).font(.system(size: 11, design: .monospaced)).textSelection(.enabled)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }.frame(maxHeight: 260)
            if let rationale = fix.rationale { Text(rationale).font(.caption).foregroundStyle(.secondary) }
            HStack {
                Button(Strings.apply) { Task { await model.applyFix() } }
                    .buttonStyle(.borderedProminent).disabled(!model.applyEnabled).keyboardShortcut(.return)
                Button(Strings.copyPatch) { model.copyPatch() }
                Button(Strings.dismiss) { model.dismissFix() }.keyboardShortcut(.cancelAction)
            }
        }
    }
    private var renderedDiff: String {
        let lines = fix.diff.text.split(separator: "\n", omittingEmptySubsequences: false)
        return lines.count <= 120 && fix.diff.files.count <= 3
            ? fix.diff.text
            : fix.diff.files.map { $0.newPath }.joined(separator: "\n") + "\n\n" + Strings.largePatch
    }
}
