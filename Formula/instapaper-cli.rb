# typed: false
# frozen_string_literal: true

class InstapaperCli < Formula
  desc "Dependency-free Instapaper CLI"
  homepage "https://github.com/vburojevic/instapaper-cli"
  url "https://github.com/vburojevic/instapaper-cli/archive/refs/tags/v0.2.5.tar.gz"
  sha256 "68dcd392fee08378c0a4cab2ca144e0d05c759f4ddbf767f1968d5b03e29b42a"
  license "MIT"

  depends_on "go" => :build

  def install
    ldflags = "-s -w -X github.com/vburojevic/instapaper-cli/internal/version.Version=#{version}"
    system "go", "build", *std_go_args(ldflags: ldflags), "./cmd/ip"
  end

  test do
    system "#{bin}/ip", "--version"
  end
end
