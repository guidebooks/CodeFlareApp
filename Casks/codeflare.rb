cask "codeflare" do
  version "0.0.1"

  name "CodeFlare"
  desc "Desktop Client for Project CodeFlare"
  homepage "https://github.com/guidebooks/CodeFlareApp"

  if Hardware::CPU.intel?
    url "https://github.com/guidebooks/CodeFlareApp/releases/download/v#{version}/CodeFlare-darwin-x64.tar.bz2"
    sha256 "c82ef5514d2bfb0c1d436207240aab04adeb15024b4e9fbb688925447ecc3deb"
    app "CodeFlare-darwin-x64/CodeFlare.app"
  else
    url "https://github.com/guidebooks/CodeFlareApp/releases/download/v#{version}/CodeFlare-darwin-amd64.tar.bz2"
    sha256 "c9f91f118a981154b10d421bcd59e22f47bc96dddaa4377a0e5b69e16df7be85"
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
