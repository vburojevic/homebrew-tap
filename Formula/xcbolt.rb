class Xcbolt < Formula
  desc "Modern Xcode CLI + TUI for build/run/test with Simulator + device workflows"
  homepage "https://github.com/vburojevic/xcbolt"
  url "https://github.com/vburojevic/xcbolt/archive/refs/tags/v0.2.6.tar.gz"
  sha256 "ee92abcddf280d186ecbfc91b02d48b68b4b143b19e8e04aa49a9ebdec756f26"
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
