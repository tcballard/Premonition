# typed: strict
# frozen_string_literal: true

# Release gate: replace both placeholders from the verified, stapled archive
# before running brew audit or publishing to a tap.
cask "premonition" do
  version "0.1.0"
  sha256 "PREMONITION_RELEASE_SHA256"

  url "PREMONITION_RELEASE_URL"
  name "Premonition"
  desc "Review a validated Codex patch after copying an error"
  homepage "https://github.com/tcballard/Premonition"

  depends_on macos: ">= :sonoma"

  app "Premonition.app"

  uninstall quit: "co.armytage.Premonition"

  zap trash: "~/Library/Application Support/Premonition"
end
