cask "typedock" do
  version "1.0.1"
  sha256 "c6692757fba8e15f933aae51814fd37a811d4dab00500ecc7b04acc14a5f63e6"

  url "https://typedock.app/downloads/TypeDock-#{version}.dmg"
  name "TypeDock"
  desc "Snippet expansion and clipboard manager in one library"
  homepage "https://typedock.app/"

  depends_on macos: :tahoe

  app "TypeDock.app"

  zap trash: [
    "~/Library/Group Containers/group.com.caffeinatedcode.TypeDock",
    "~/Library/Preferences/com.caffeinatedcode.TypeDock.plist",
  ]
end
