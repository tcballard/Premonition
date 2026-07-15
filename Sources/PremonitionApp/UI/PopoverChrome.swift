import SwiftUI

struct PopoverHeader: View {
    let model: PresentationModel

    var body: some View {
        HStack(spacing: PremonitionDesign.Space.regular) {
            ZStack {
                Circle().fill(PremonitionDesign.ColorRole.identitySurface)
                Image(systemName: stateSymbol)
                    .font(.system(size: PremonitionDesign.Symbol.identity, weight: .medium))
                    .foregroundStyle(stateTint)
            }
            .frame(width: 34, height: 34)
            .accessibilityHidden(true)

            VStack(alignment: .leading, spacing: 1) {
                Text(Strings.productName)
                    .font(.caption)
                    .foregroundStyle(.secondary)
                Text(stateTitle)
                    .font(.headline)
            }

            Spacer(minLength: PremonitionDesign.Space.regular)

            Button(model.isPaused ? Strings.resumeWatching : Strings.pause) {
                model.setPaused(!model.isPaused)
            }
            .buttonStyle(.borderless)
            .controlSize(.small)
            .accessibilityValue(stateTitle)

            SettingsMenu(model: model)
        }
        .padding(.horizontal, PremonitionDesign.Space.section)
        .padding(.vertical, PremonitionDesign.Space.regular)
        .accessibilityElement(children: .contain)
    }

    private var stateTitle: String {
        switch model.status {
        case .notConfigured: Strings.needsSetup
        case .watching: Strings.watching
        case .speculating: Strings.speculating
        case .fixReady: Strings.fixReady
        case .paused: Strings.paused
        }
    }

    private var stateSymbol: String {
        switch model.status {
        case .notConfigured, .paused: "eye.slash"
        case .watching, .speculating: "eye"
        case .fixReady: "eye.fill"
        }
    }

    private var stateTint: Color {
        model.status == .fixReady ? .accentColor : .primary
    }
}

struct SettingsMenu: View {
    enum Chrome {
        case compact
        case prominent
    }

    let model: PresentationModel
    let chrome: Chrome

    init(model: PresentationModel, chrome: Chrome = .compact) {
        self.model = model
        self.chrome = chrome
    }

    var body: some View {
        switch chrome {
        case .compact:
            menu
                .menuStyle(.borderlessButton)
                .controlSize(.small)
        case .prominent:
            menu
                .menuStyle(.button)
                .controlSize(.regular)
        }
    }

    private var menu: some View {
        Menu {
            SettingsLink { Text(Strings.settings + "…") }
            Button(Strings.openConfig) { model.openConfigFile() }
                .disabled(!FileManager.default.fileExists(atPath: model.configurationURL.path))
            Divider()
            Button(Strings.quit) { model.quit() }
        } label: {
            Image(systemName: "gearshape")
                .accessibilityLabel(Strings.settings)
        }
    }
}

struct PopoverReceipt: View {
    let model: PresentationModel

    var body: some View {
        HStack(spacing: PremonitionDesign.Space.compact) {
            Image(systemName: receiptSymbol)
                .foregroundStyle(.tertiary)
                .accessibilityHidden(true)
            Text(model.lastRunStatus)
                .lineLimit(1)
            Spacer()
            Text(String(format: Strings.runsTodayFormat, model.dailyCount))
                .monospacedDigit()
                .accessibilityLabel(String(format: Strings.dailyCountFormat,
                                           model.dailyCount, model.configuration.dailyCap))
        }
        .font(.caption2)
        .foregroundStyle(.tertiary)
        .padding(.horizontal, PremonitionDesign.Space.section)
        .padding(.vertical, PremonitionDesign.Space.compact)
    }

    private var receiptSymbol: String {
        switch model.lastRunStatus {
        case Strings.applied: "checkmark.circle"
        case Strings.applyFailed: "exclamationmark.triangle"
        default: "clock"
        }
    }
}
