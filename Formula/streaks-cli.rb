class StreaksCli < Formula
  desc "CLI for Streaks (Crunchy Bagel)"
  homepage "https://github.com/vburojevic/streaks-cli"
  url "https://github.com/vburojevic/streaks-cli/archive/refs/tags/v0.3.5.tar.gz"
  sha256 "4668c420e9998ee49e15a6a1700af7187eaf51442f8940e0b1d3427529afa36f"
  license "MIT"

  depends_on "go" => :build

  def install
    ldflags = "-s -w -X streaks-cli/internal/cli.version=#{version}"
    system "go", "build", "-ldflags", ldflags, "-o", bin/"st", "./cmd/streaks-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/st --version")
  end
end
