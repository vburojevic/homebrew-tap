class Xcbolt < Formula
  desc "Modern Xcode CLI + TUI for build/run/test with Simulator + device workflows"
  homepage "https://github.com/vburojevic/xcbolt"
  url "https://github.com/vburojevic/xcbolt/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "7a603d7eabb3fb7cc69faaa031736ab2dba72adade08563c52bfa7dc52478878"
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
