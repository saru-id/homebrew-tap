class Jumon < Formula
  desc "Incantations for your shell: say it, get the command, you run it"
  homepage "https://github.com/saru-id/jumon"
  version "1.30.0"
  url "https://github.com/saru-id/jumon/releases/download/v1.30.0/jumon-v1.30.0-aarch64-apple-darwin.tar.gz"
  sha256 "1b2c1e162dfffaeea3e9ae3bf2a7cd5ee9497934a25d60ac0e94a082cdb7b2cf"

  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "jumon"
    man1.install Dir["share/man/man1/*.1"]
    zsh_completion.install "share/zsh/site-functions/_jumon"
  end

  def caveats
    <<~EOS
      Finish setup (config, widget, and your .zshrc line):
        jumon init
    EOS
  end

  test do
    assert_match "jumon", shell_output("#{bin}/jumon --version")
  end
end
