import PremonitionCore
import SwiftUI

struct FixReadyView: View {
    let model: PresentationModel
    let fix: PresentationModel.HeldFix

    private var presentation: DiffPresentation {
        DiffPresentation(diff: fix.diff, renderBudgetLines: model.configuration.renderBudgetLines)
    }

    var body: some View {
        VStack(alignment: .leading, spacing: PremonitionDesign.Space.regular) {
            diagnosis
            SemanticDiffView(presentation: presentation)
            if let rationale = fix.rationale {
                SolRationaleView(rationale: rationale)
            }
            actions
            safetyMetadata
        }
        .padding(PremonitionDesign.Space.section)
    }

    private var diagnosis: some View {
        VStack(alignment: .leading, spacing: PremonitionDesign.Space.compact) {
            Text(fix.errorLine)
                .font(.headline)
                .lineLimit(2)
                .truncationMode(.middle)
                .accessibilityLabel(Strings.diagnosis + ": " + fix.errorLine)

            HStack(spacing: PremonitionDesign.Space.compact) {
                Label(fix.repositoryName, systemImage: "shippingbox")
                if let affectedFile = presentation.primaryFile {
                    Text("/")
                        .foregroundStyle(.quaternary)
                        .accessibilityHidden(true)
                    Label(affectedFile, systemImage: "doc.text")
                        .lineLimit(1)
                        .truncationMode(.middle)
                }
            }
            .font(.caption)
            .foregroundStyle(.secondary)
        }
    }

    private var actions: some View {
        HStack(spacing: PremonitionDesign.Space.compact) {
            Button(Strings.apply) { Task { await model.applyFix() } }
                .buttonStyle(.borderedProminent)
                .tint(.accentColor)
                .disabled(!model.applyEnabled)
                .keyboardShortcut(.return)
            Button(Strings.copyPatch) { model.copyPatch() }
            Button(Strings.dismiss) { model.dismissFix() }
        }
    }

    private var safetyMetadata: some View {
        TimelineView(.periodic(from: .now, by: 30)) { context in
            HStack(spacing: PremonitionDesign.Space.regular) {
                Label(model.applyEnabled ? Strings.cleanWorktree : Strings.reviewOnly,
                      systemImage: model.applyEnabled ? "checkmark.shield" : "exclamationmark.triangle")
                Spacer()
                Label(expiryText(at: context.date), systemImage: "hourglass")
            }
            .font(.caption2)
            .foregroundStyle(.tertiary)
        }
        .accessibilityElement(children: .combine)
    }

    private func expiryText(at date: Date) -> String {
        let minutes = max(1, Int(ceil(fix.expiresAt.timeIntervalSince(date) / 60)))
        return String(format: Strings.expiresFormat, minutes)
    }
}

struct SolRationaleView: View {
    let rationale: String

    var body: some View {
        VStack(alignment: .leading, spacing: PremonitionDesign.Space.compact) {
            Label(Strings.solRationale, systemImage: "sparkles")
                .font(.caption.weight(.semibold))
            Text(rationale)
                .font(.caption)
                .foregroundStyle(.secondary)
                .fixedSize(horizontal: false, vertical: true)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(PremonitionDesign.Space.regular)
        .background(PremonitionDesign.ColorRole.rationaleSurface)
        .clipShape(RoundedRectangle(cornerRadius: PremonitionDesign.Shape.section, style: .continuous))
        .overlay {
            RoundedRectangle(cornerRadius: PremonitionDesign.Shape.section, style: .continuous)
                .stroke(PremonitionDesign.ColorRole.outline, lineWidth: 1)
        }
        .accessibilityElement(children: .combine)
    }
}
