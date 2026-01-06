class Xcbolt < Formula
  desc "Modern Xcode CLI + TUI for build/run/test with Simulator + device workflows"
  homepage "https://github.com/vburojevic/xcbolt"
  url "https://github.com/vburojevic/xcbolt/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "36871ebb5333929d075b1d2d1dd75569ed8fc8ba42852285bce988c8c4fc8ac1"
  license "MIT"

  depends_on "swift" => :build

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/xcbolt"

    # Shell completions (swift-argument-parser)
    bash_completion.install Utils.safe_popen_read(bin/"xcbolt", "--generate-completion-script", "bash") => "xcbolt"
    zsh_completion.install Utils.safe_popen_read(bin/"xcbolt", "--generate-completion-script", "zsh") => "_xcbolt"
    fish_completion.install Utils.safe_popen_read(bin/"xcbolt", "--generate-completion-script", "fish") => "xcbolt.fish"
  end

  test do
    system "#{bin}/xcbolt", "--version"
  end
end
