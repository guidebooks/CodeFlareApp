cask "codeflare" do
  version "0.0.1"

  name "CodeFlare"
  desc "Desktop Client for Project CodeFlare"
  homepage "https://github.com/guidebooks/CodeFlareApp"

  if Hardware::CPU.intel?
    url "https://github.com/guidebooks/CodeFlareApp/releases/download/v#{version}/CodeFlare-darwin-x64.tar.bz2"
    sha256 "78902a5b2f81f9f657bf86c469fff1e218815bdd69d61c31f66fa22f4fc36a7e"
    app "CodeFlare-darwin-x64/CodeFlare.app"
  else
    url "https://github.com/guidebooks/CodeFlareApp/releases/download/v#{version}/CodeFlare-darwin-amd64.tar.bz2"
    sha256 "ba1b090e82fb9401adabd36ed3c157421fbd67d8a21086bb742c4d5bf33e46f4"
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
