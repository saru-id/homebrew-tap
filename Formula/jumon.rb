class Jumon < Formula
  desc "Incantations for your shell: say it, get the command, you run it"
  homepage "https://github.com/saru-id/jumon"
  version "1.13.1"
  url "https://github.com/saru-id/jumon/releases/download/v1.13.1/jumon-v1.13.1-aarch64-apple-darwin.tar.gz"
  sha256 "b13fdff2f905e851bf0cff79f97c8e143ae8d0ff94520b08fdca303e2983cecd"

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
