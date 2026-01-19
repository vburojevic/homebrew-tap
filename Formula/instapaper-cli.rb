# typed: false
# frozen_string_literal: true

class InstapaperCli < Formula
  desc "Dependency-free Instapaper CLI"
  homepage "https://github.com/vburojevic/instapaper-cli"
  url "https://github.com/vburojevic/instapaper-cli/archive/refs/tags/v0.2.3.tar.gz"
  sha256 "4a124f3bdeb4db19ab0fc50ac2ffe3598def084f1b5c0654091d7024da7377f1"
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
