import Testing
@testable import PremonitionCore

@Test("S0 pins the macOS deployment floor")
func minimumMacOSVersionIsPinned() {
    #expect(PremonitionCore.minimumMacOSVersion == "14.0")
}
