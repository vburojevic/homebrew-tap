class StreaksCli < Formula
  desc "CLI for Streaks (Crunchy Bagel)"
  homepage "https://github.com/vburojevic/streaks-cli"
  url "https://github.com/vburojevic/streaks-cli/archive/refs/tags/v0.3.4.tar.gz"
  sha256 "ff6199f54e8d0c6368eec17bd81048cbbb7a0a76a7b8e75d29e42433098c77bd"
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
