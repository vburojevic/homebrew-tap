class Xcbolt < Formula
  desc "Modern Xcode CLI + TUI for build/run/test with Simulator + device workflows"
  homepage "https://github.com/vburojevic/xcbolt"
  url "https://github.com/vburojevic/xcbolt/archive/refs/tags/v0.2.8.tar.gz"
  sha256 "13f64b36f57cd2ad5bddafe2bc9a5c197b0260102a8a1ac9e6cd22f13547aaba"
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
