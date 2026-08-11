class Jumon < Formula
  desc "Incantations for your shell: say it, get the command, you run it"
  homepage "https://github.com/saru-id/jumon"
  version "1.14.1"
  url "https://github.com/saru-id/jumon/releases/download/v1.14.1/jumon-v1.14.1-aarch64-apple-darwin.tar.gz"
  sha256 "de2a120336b26236c2616b79bc916bd5bcfd8f234fc0531c3307c54de800ba83"

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
