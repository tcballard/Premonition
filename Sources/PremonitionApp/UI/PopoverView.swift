import SwiftUI

struct PopoverView: View {
    let model: PresentationModel
    let openSettings: () -> Void

    var body: some View {
        Group {
            if let fix = model.heldFix {
                VStack(spacing: 0) {
                    PopoverHeader(model: model, openSettings: openSettings)
                    Divider()
                    FixReadyView(model: model, fix: fix)
                    Divider()
                    PopoverReceipt(model: model)
                }
            } else if model.configuration.allowlistedRoots.isEmpty {
                VStack(spacing: 0) {
                    PopoverHeader(model: model, openSettings: openSettings)
                    Divider()
                    EmptyPopoverView(model: model)
                    Divider()
                    PopoverReceipt(model: model)
                }
            } else {
                MonitoringView(model: model, openSettings: openSettings)
            }
        }
        .frame(width: PremonitionDesign.popoverWidth)
        .frame(maxHeight: PremonitionDesign.popoverMaximumHeight)
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
