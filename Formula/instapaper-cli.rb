# typed: false
# frozen_string_literal: true

class InstapaperCli < Formula
  desc "Dependency-free Instapaper CLI"
  homepage "https://github.com/vburojevic/instapaper-cli"
  url "https://github.com/vburojevic/instapaper-cli/archive/refs/tags/v0.2.6.tar.gz"
  sha256 "6d7362ead95c68119fe6156b32db2fa50f98322d413f98dc6a402ae851d1c73a"
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
