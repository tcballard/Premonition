import SwiftUI

struct PopoverView: View {
    let model: PresentationModel

    var body: some View {
        VStack(spacing: 0) {
            PopoverHeader(model: model)
            Divider()
            content
            Divider()
            PopoverReceipt(model: model)
        }
        .frame(width: PremonitionDesign.popoverWidth)
        .frame(maxHeight: PremonitionDesign.popoverMaximumHeight)
    }

    @ViewBuilder
    private var content: some View {
        if let fix = model.heldFix {
            FixReadyView(model: model, fix: fix)
        } else if model.configuration.allowlistedRoots.isEmpty {
            EmptyPopoverView(model: model)
        } else {
            MonitoringView(model: model)
        }
    }
}

private struct MonitoringView: View {
    let model: PresentationModel

    var body: some View {
        VStack(alignment: .leading, spacing: PremonitionDesign.Space.compact) {
            Text(model.isPaused ? Strings.pausedInstruction : Strings.waitingForError)
                .font(.body)
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(PremonitionDesign.Space.section)
    }
}

private struct EmptyPopoverView: View {
    let model: PresentationModel

    var body: some View {
        VStack(spacing: PremonitionDesign.Space.regular) {
            Image(systemName: "eye.slash")
                .font(.system(size: 32, weight: .medium))
                .foregroundStyle(.secondary)
                .accessibilityHidden(true)
            Text(Strings.emptyState)
                .multilineTextAlignment(.center)
                .foregroundStyle(.secondary)
            Button(Strings.setUp) { model.addRoot() }
                .buttonStyle(.borderedProminent)
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, PremonitionDesign.Space.section)
        .padding(.vertical, PremonitionDesign.Space.expanded)
    }
}
