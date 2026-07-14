import Foundation
import Testing

@Test("Required S0 repository entrypoints exist")
func requiredEntrypointsExist() {
    let root = URL(fileURLWithPath: #filePath)
        .deletingLastPathComponent()
        .deletingLastPathComponent()
        .deletingLastPathComponent()
    let required = [
        "script/build_and_run.sh",
        "scripts/build-app.sh",
        "scripts/make-demo-repo.sh",
        ".codex/environments/environment.toml",
    ]
    for path in required {
        #expect(FileManager.default.fileExists(atPath: root.appendingPathComponent(path).path))
    }
}
