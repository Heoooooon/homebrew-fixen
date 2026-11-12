cask "fixen" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.1.2"
  sha256 arm:   "3e9c1c9ef57ec2d5d423ecf0ee0e7b7d8daa771b33141a6bd3d61689276f65a5",
         intel: "128ae5c533bfcde4e971ff2ebd99f9279858202869f352735749ab2a418d4385"

  url "https://github.com/Heoooooon/fixen/releases/download/app-v#{version}/fixen_#{version}_#{arch}.dmg"
  name "fixen"
  desc "Menu bar app that fixes your English in any app"
  homepage "https://cmore.dev/fixen/"

  livecheck do
    url "https://cmore.dev/fixen/latest.json"
    strategy :json do |json|
      json["version"]
    end
  end

  auto_updates true
  depends_on :macos

  app "fixen.app"

  uninstall quit: "cli.fixen.desktop"

  zap trash: [
    "~/.config/fixen/app.json",
    "~/.config/fixen/app.pid",
    "~/.config/fixen/compose.json",
    "~/.config/fixen/gui-mode",
    "~/Library/Caches/cli.fixen.desktop",
    "~/Library/WebKit/cli.fixen.desktop",
  ]
end
