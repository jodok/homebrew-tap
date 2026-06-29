# typed: false
# frozen_string_literal: true

class OpenclawOpResolver < Formula
  desc "1Password (op) secret resolver for OpenClaw's exec secret-provider protocol"
  homepage "https://github.com/jodok/openclaw-op-resolver"
  url "https://github.com/jodok/openclaw-op-resolver/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "1532856e0187a851e1acc002159635db972d34666620c3a5ff6eb80ce248dde0"
  license "MIT"

  depends_on "node"
  depends_on cask: "1password-cli"

  def install
    bin.install "bin/openclaw-op-resolver"
  end

  test do
    # With no OP_VAULT and placeholders disabled, an empty request resolves cleanly.
    output = pipe_output(
      "#{bin}/openclaw-op-resolver",
      '{"protocolVersion":1,"ids":[]}'
    )
    assert_match '"protocolVersion":1', output
  end
end
