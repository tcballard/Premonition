import SwiftUI

struct MonitoringView: View {
    let model: PresentationModel

    var body: some View {
        let presentation = MonitoringPresentation(status: model.status)
        VStack(spacing: 0) {
            HStack(spacing: PremonitionDesign.Space.compact) {
                Spacer()
                Button {
                    model.setPaused(!model.isPaused)
                } label: {
                    Label(model.isPaused ? Strings.resumeWatching : Strings.pause,
                          systemImage: model.isPaused ? "play.fill" : "pause.fill")
                }
                .buttonStyle(.bordered)
                .controlSize(.regular)
                .accessibilityValue(presentation.stateTitle)

                SettingsMenu(model: model, chrome: .prominent)
            }
            .padding(.horizontal, PremonitionDesign.Space.section)
            .padding(.top, PremonitionDesign.Space.section)

            Spacer(minLength: PremonitionDesign.Space.compact)

            WatchDial(presentation: presentation)

            VStack(spacing: PremonitionDesign.Space.compact) {
                Text(presentation.stateTitle)
                    .font(.title2.weight(.semibold))
                Text(presentation.instruction)
                    .font(.callout)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)
            }
            .padding(.top, PremonitionDesign.Space.regular)
            .padding(.horizontal, PremonitionDesign.Space.expanded)

            Spacer(minLength: PremonitionDesign.Space.section)
            Divider()
            MonitoringReceipt(model: model)
        }
        .accessibilityElement(children: .contain)
    }
}

private struct WatchDial: View {
    let presentation: MonitoringPresentation
    @Environment(\.accessibilityReduceMotion) private var reduceMotion

    private let tickCount = 48

    var body: some View {
        TimelineView(.animation(minimumInterval: 1.0 / 15.0,
                                paused: reduceMotion || presentation.status == .paused)) { context in
            ZStack {
                ForEach(0..<tickCount, id: \.self) { index in
                    Capsule(style: .continuous)
                        .fill(tickColor(index: index, at: context.date))
                        .frame(width: 3, height: 11)
                        .offset(y: -PremonitionDesign.monitoringDialSize / 2 + 7)
                        .rotationEffect(.degrees(Double(index) * 360 / Double(tickCount)))
                }

                Circle()
                    .fill(PremonitionDesign.ColorRole.dialFace)
                    .overlay {
                        Circle().stroke(PremonitionDesign.ColorRole.outline, lineWidth: 1)
                    }
                    .frame(width: 86, height: 86)

                Image(systemName: symbol)
                    .font(.system(size: 34, weight: .medium))
                    .symbolRenderingMode(.monochrome)
            }
        }
        .frame(width: PremonitionDesign.monitoringDialSize,
               height: PremonitionDesign.monitoringDialSize)
        .accessibilityElement(children: .ignore)
        .accessibilityLabel(presentation.stateTitle)
    }

    private var symbol: String {
        presentation.watchSymbol
    }

    private func tickColor(index: Int, at date: Date) -> Color {
        guard presentation.status != .paused else { return PremonitionDesign.ColorRole.dialTrack }
        if reduceMotion {
            return index == tickCount - 1 ? .primary : PremonitionDesign.ColorRole.dialTrack
        }
        let speed = presentation.status == .speculating ? 10.0 : 5.0
        let active = Int(date.timeIntervalSinceReferenceDate * speed) % tickCount
        let distance = (active - index + tickCount) % tickCount
        switch distance {
        case 0: return .primary
        case 1: return Color.primary.opacity(0.55)
        case 2: return Color.primary.opacity(0.32)
        default: return PremonitionDesign.ColorRole.dialTrack
        }
    }
}

private struct MonitoringReceipt: View {
    let model: PresentationModel

    var body: some View {
        let presentation = MonitoringReceiptPresentation(
            lastRunStatus: model.lastRunStatus,
            lastRunAt: model.lastRunAt,
            dailyCount: model.dailyCount,
            dailyCap: model.configuration.dailyCap
        )
        HStack(spacing: PremonitionDesign.Space.regular) {
            ZStack {
                RoundedRectangle(cornerRadius: PremonitionDesign.Shape.receiptIcon, style: .continuous)
                    .fill(Color.primary.opacity(0.035))
                RoundedRectangle(cornerRadius: PremonitionDesign.Shape.receiptIcon, style: .continuous)
                    .stroke(PremonitionDesign.ColorRole.outline, lineWidth: 1)
                Image(systemName: presentation.receiptSymbol)
                    .font(.system(size: 14, weight: .medium))
            }
            .frame(width: 34, height: 34)
            .accessibilityHidden(true)

            VStack(alignment: .leading, spacing: 2) {
                Text(model.lastRunStatus)
                    .font(.callout.weight(.medium))
                    .lineLimit(1)
                Text(presentation.activityTime)
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }

            Spacer(minLength: PremonitionDesign.Space.regular)

            VStack(alignment: .trailing, spacing: 2) {
                Text(presentation.dailyCountText)
                    .font(.callout.monospacedDigit())
                Text(Strings.today)
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            .accessibilityElement(children: .combine)
            .accessibilityLabel(presentation.dailyAccessibilityLabel)
        }
        .padding(.horizontal, PremonitionDesign.Space.section)
        .padding(.vertical, PremonitionDesign.Space.regular)
    }
}

struct MonitoringPresentation: Equatable {
    let status: PresentationModel.Status

    var stateTitle: String {
        switch status {
        case .paused: Strings.paused
        case .speculating: Strings.speculating
        default: Strings.watching
        }
    }

    var instruction: String {
        switch status {
        case .paused: Strings.pausedInstruction
        case .speculating: Strings.draftingInstruction
        default: Strings.waitingForError
        }
    }

    var watchSymbol: String {
        switch status {
        case .paused: "eye.slash"
        case .speculating: "eye.fill"
        default: "eye"
        }
    }
}

struct MonitoringReceiptPresentation: Equatable {
    let lastRunStatus: String
    let lastRunAt: Date?
    let dailyCount: Int
    let dailyCap: Int

    var activityTime: String {
        guard let lastRunAt else { return Strings.noRecentActivity }
        return lastRunAt.formatted(date: .omitted, time: .shortened)
    }

    var dailyCountText: String {
        "\(dailyCount) / \(dailyCap)"
    }

    var dailyAccessibilityLabel: String {
        String(format: Strings.dailyCountFormat, dailyCount, dailyCap)
    }

    var receiptSymbol: String {
        switch lastRunStatus {
        case Strings.applied: "checkmark.circle"
        case Strings.applyFailed: "exclamationmark.triangle"
        default: "list.clipboard"
        }
    }
}
