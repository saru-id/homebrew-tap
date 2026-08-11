class Jumon < Formula
  desc "Incantations for your shell: say it, get the command, you run it"
  homepage "https://github.com/saru-id/jumon"
  version "1.18.1"
  url "https://github.com/saru-id/jumon/releases/download/v1.18.1/jumon-v1.18.1-aarch64-apple-darwin.tar.gz"
  sha256 "4da4b650a6f086b4869eb2dc6f5d8e3043aae2838288b4e1bee9282f586f3993"

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
