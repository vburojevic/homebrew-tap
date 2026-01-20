# typed: false
# frozen_string_literal: true

class InstapaperCli < Formula
  desc "Dependency-free Instapaper CLI"
  homepage "https://github.com/vburojevic/instapaper-cli"
  url "https://github.com/vburojevic/instapaper-cli/archive/refs/tags/v0.2.7.tar.gz"
  sha256 "5a43405fb52999cc3a3c03273503fe8b93e4f4c467006f17dae18272d0324f7e"
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
