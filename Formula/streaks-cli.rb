class StreaksCli < Formula
  desc "CLI for Streaks (Crunchy Bagel)"
  homepage "https://github.com/vburojevic/streaks-cli"
  url "https://github.com/vburojevic/streaks-cli/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "1783aa1d7040b9b12fceb2d91a08241f559f695e8cafebcdaf1fe9b1403be506"
  license "MIT"

  depends_on "go" => :build

  def install
    ldflags = "-s -w -X streaks-cli/internal/cli.version=#{version}"
    system "go", "build", "-ldflags", ldflags, "-o", bin/"streaks-cli", "./cmd/streaks-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/streaks-cli --version")
  end
end
