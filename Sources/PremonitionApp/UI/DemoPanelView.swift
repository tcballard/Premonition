import SwiftUI

struct DemoPanelView: View {
    let presentation: DemoPresentation

    var body: some View {
        TimelineView(.periodic(from: .now, by: 1)) { context in
            VStack(alignment: .leading, spacing: PremonitionDesign.Space.regular) {
                HStack(spacing: PremonitionDesign.Space.tight) {
                    Image(systemName: "eye")
                        .symbolRenderingMode(.hierarchical)
                    Text(Strings.seeTheFuture)
                        .font(.system(size: 13, weight: .semibold))
                    Spacer()
                    Text(elapsedText(at: context.date))
                        .font(.system(size: 12, weight: .medium, design: .monospaced))
                        .foregroundStyle(.secondary)
                        .accessibilityLabel(Strings.elapsedTime)
                }

                Text(presentation.stage.label)
                    .font(.system(size: 12, weight: .medium))
                    .contentTransition(.opacity)
                    .accessibilityLabel(Strings.currentStage)
                    .accessibilityValue(presentation.stage.label)

                HStack(spacing: PremonitionDesign.Space.tight) {
                    Text(presentation.mode.label)
                    if let detail = presentation.mode.detail {
                        Text("·")
                        Text(detail)
                    }
                }
                .font(.system(size: 11))
                .foregroundStyle(.secondary)
            }
            .padding(PremonitionDesign.Space.section)
            .frame(width: DemoPanelController.contentSize.width,
                   height: DemoPanelController.contentSize.height,
                   alignment: .topLeading)
            .background(.regularMaterial, in: RoundedRectangle(cornerRadius: 12, style: .continuous))
            .overlay {
                RoundedRectangle(cornerRadius: 12, style: .continuous)
                    .stroke(.separator.opacity(0.7), lineWidth: 1)
            }
        }
        .accessibilityElement(children: .contain)
        .accessibilityLabel(Strings.demoPanelAccessibilityLabel)
    }

    private func elapsedText(at date: Date) -> String {
        let seconds = Int(presentation.elapsed(at: date))
        return String(format: "%02d:%02d", seconds / 60, seconds % 60)
    }
}
