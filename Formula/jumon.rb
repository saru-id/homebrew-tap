class Jumon < Formula
  desc "Incantations for your shell: say it, get the command, you run it"
  homepage "https://github.com/saru-id/jumon"
  version "1.5.0"
  url "https://github.com/saru-id/jumon/releases/download/v1.5.0/jumon-v1.5.0-aarch64-apple-darwin.tar.gz"
  sha256 "e0fdcafcfae6a0d7153e4f1e17eafee29d78c72741d977a1bedcc9522ef48e0a"

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
