class StreaksCli < Formula
  desc "CLI for Streaks (Crunchy Bagel)"
  homepage "https://github.com/vburojevic/streaks-cli"
  url "https://github.com/vburojevic/streaks-cli/archive/refs/tags/v0.3.2.tar.gz"
  sha256 "685e5722110722994952d4c38db4bdb9c17d6addea8a8665cd94d38fc27f8367"
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
