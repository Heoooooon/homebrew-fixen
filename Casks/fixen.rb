cask "fixen" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.1.0"
  sha256 arm:   "48c976ed6d41a8e3d858fc4aa669eb519bf366d28cce16f2b4e62d5c623a5ac1",
         intel: "47610df4d4316ba0a73a49a5ef4853180fe6f02eb4da55665ca057ca807ad485"

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
  depends_on macos: :big_sur

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
