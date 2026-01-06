class Xcbolt < Formula
  desc "Modern Xcode CLI + TUI for build/run/test with Simulator + device workflows"
  homepage "https://github.com/vburojevic/xcbolt"
  url "https://github.com/vburojevic/xcbolt/archive/refs/tags/.tar.gz"
  sha256 "a842e421478208c626deed8ea116886a38e8b4f8806e891ea883e4c03e1cad13"
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
