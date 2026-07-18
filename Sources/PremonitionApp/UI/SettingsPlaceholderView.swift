import SwiftUI

struct SettingsPlaceholderView: View {
    let model: PresentationModel
    var body: some View {
        Form {
            Section(Strings.privacy) { Text(Strings.privacyConstitution).font(.callout) }
            Section(Strings.roots) {
                ForEach(model.configuration.allowlistedRoots, id: \.self) { root in
                    HStack { Text(root).lineLimit(1).truncationMode(.middle); Spacer(); Button(Strings.remove) { model.removeRoot(root) } }
                }
                Button(Strings.addRoot) { model.addRoot() }
            }
            Section(Strings.runtime) {
                LabeledContent(Strings.model, value: "GPT-5.6 Sol")
                LabeledContent(Strings.codex, value: model.codexStatus)
                LabeledContent(Strings.dailyCount, value: "\(model.dailyCount) / \(model.configuration.dailyCap)")
                Toggle(Strings.showDemoPanel, isOn: Binding(
                    get: { model.configuration.surfaceMode == "demo" },
                    set: { model.configuration.surfaceMode = $0 ? "demo" : "quiet"; model.save() }
                ))
                Toggle(Strings.soundOnReady, isOn: Binding(get: { model.configuration.soundOnReady }, set: { model.configuration.soundOnReady = $0; model.save() }))
                Button(Strings.replayFixture) {
                    Task { await model.replayConfiguredFixture() }
                }
                .disabled(!model.fixtureReplayAvailable || model.configuration.allowlistedRoots.isEmpty)
            }
            if let warning = model.configurationWarning { Text(warning).foregroundStyle(.orange) }
        }.formStyle(.grouped).padding().frame(width: 520, height: 430)
            .task { await model.refreshCodexStatus() }
    }
}
