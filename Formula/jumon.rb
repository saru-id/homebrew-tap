class Jumon < Formula
  desc "Incantations for your shell: say it, get the command, you run it"
  homepage "https://github.com/saru-id/jumon"
  version "1.28.0"
  url "https://github.com/saru-id/jumon/releases/download/v1.28.0/jumon-v1.28.0-aarch64-apple-darwin.tar.gz"
  sha256 "39854cfbeb0db3a701b2887784d64666e27c9d0ec7d01c2fe7a42dfe0313a956"

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
