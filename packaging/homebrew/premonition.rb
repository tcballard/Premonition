# typed: strict
# frozen_string_literal: true

# Prepared from the verified, stapled v0.1.0 archive. The URL remains
# unavailable until the owner separately authorises a GitHub release.
cask "premonition" do
  version "0.1.0"
  sha256 "3d48e5b06342ce8bd11dddf0fa7f8b318e7273dd3e453177b6a2b47ef8d03178"

  url "https://github.com/tcballard/Premonition/releases/download/v#{version}/Premonition-#{version}.zip"
  name "Premonition"
  desc "Review a validated Codex patch after copying an error"
  homepage "https://github.com/tcballard/Premonition"

  depends_on macos: ">= :sonoma"

  app "Premonition.app"

  uninstall quit: "co.armytage.Premonition"

  zap trash: "~/Library/Application Support/Premonition"
end
