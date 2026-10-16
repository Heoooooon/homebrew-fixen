cask "fixen" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.1.1"
  sha256 arm:   "9180e27f31ffb5575decfb58bdc6d484e89dd4e754023193abc346396657184d",
         intel: "033f04085c42168075a6b5583f17645607614dfbc2ff81fa7d9a44356318050a"

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
