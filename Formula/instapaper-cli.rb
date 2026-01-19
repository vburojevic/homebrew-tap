# typed: false
# frozen_string_literal: true

class InstapaperCli < Formula
  desc "Dependency-free Instapaper CLI"
  homepage "https://github.com/vburojevic/instapaper-cli"
  url "https://github.com/vburojevic/instapaper-cli/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "ac6ff9018260e2ea29708acb33dd4ba63e2ac6931346f60048ea4d8782a452c9"
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
