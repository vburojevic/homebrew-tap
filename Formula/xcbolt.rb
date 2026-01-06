class Xcbolt < Formula
  desc "Modern Xcode CLI + TUI for build/run/test with Simulator + device workflows"
  homepage "https://github.com/vburojevic/xcbolt"
  url "https://github.com/vburojevic/xcbolt/archive/refs/tags/.tar.gz"
  sha256 "e19cbe1ee03128882af1238355c5c1093636591312415f131d71f91f6d5bcf57"
  license "MIT"

  depends_on "swift" => :build

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/xcbolt"

    # Shell completions (swift-argument-parser)
    (bash_completion/"xcbolt").write Utils.safe_popen_read(bin/"xcbolt", "--generate-completion-script", "bash")
    (zsh_completion/"_xcbolt").write Utils.safe_popen_read(bin/"xcbolt", "--generate-completion-script", "zsh")
    (fish_completion/"xcbolt.fish").write Utils.safe_popen_read(bin/"xcbolt", "--generate-completion-script", "fish")
  end

  test do
    system "#{bin}/xcbolt", "--version"
  end
end
