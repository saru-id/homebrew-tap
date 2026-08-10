class Jumon < Formula
  desc "Incantations for your shell: say it, get the command, you run it"
  homepage "https://github.com/saru-id/jumon"
  version "1.3.0"
  url "https://github.com/saru-id/jumon/releases/download/v1.3.0/jumon-v1.3.0-aarch64-apple-darwin.tar.gz"
  sha256 "c0e53f62259758194d9dd60423a2b7a60b5cd52e5894f991a3e3cc8ea7a64de1"

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
