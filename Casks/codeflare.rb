cask "codeflare" do
  version "0.0.2"

  name "CodeFlare"
  desc "Desktop Client for Project CodeFlare"
  homepage "https://github.com/guidebooks/CodeFlareApp"

  if Hardware::CPU.intel?
    url "https://github.com/guidebooks/CodeFlareApp/releases/download/v#{version}/CodeFlare-darwin-x64.tar.bz2"
    sha256 "6be191d82f25b79f05f2b01e1510a846ab6194b80bd64c41bee9ed3b3f6f6d7e"
    app "CodeFlare-darwin-x64/CodeFlare.app"
  else
    url "https://github.com/guidebooks/CodeFlareApp/releases/download/v#{version}/CodeFlare-darwin-amd64.tar.bz2"
    sha256 "936bd35d8197fdc552f3485c223f6dd2b01965752fbe96596f9e0861b6c00d58"
    app "CodeFlare-darwin-amd64/CodeFlare.app"
  end

  livecheck do
    url :url
    strategy :git
    regex(/^v(\d+(?:\.\d+)*)$/)
  end

  binary "#{appdir}/CodeFlare.app/Contents/Resources/codeflare"

  zap trash: "~/Library/Application\ Support/CodeFlare"
end
