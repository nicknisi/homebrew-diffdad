class Dad < Formula
  desc "GitHub PRs as narrated stories — AI-powered semantic diff review"
  homepage "https://github.com/nicknisi/diffdad"
  version "0.8.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nicknisi/diffdad/releases/download/v#{version}/dad-darwin-arm64.tar.gz"
      sha256 "cd375e3d962b84b902afab315dff2df695aa067cde02c3a082e07368fb6759f2"
    else
      url "https://github.com/nicknisi/diffdad/releases/download/v#{version}/dad-darwin-x86_64.tar.gz"
      sha256 "87f50e30a8f40edfbc12967bb25872baaa90a7f4392db058619908513c865287"
    end
  end

  on_linux do
    url "https://github.com/nicknisi/diffdad/releases/download/v#{version}/dad-linux-x86_64.tar.gz"
    sha256 "79d5a69f1ff1831868824e471e08d652d5f68b42ea89328bae4ca3a31997d42a"
  end

  def install
    bin.install "dad"
    (share/"diffdad").install "share/diffdad/web"
  end

  test do
    assert_match "dad - GitHub PRs", shell_output("#{bin}/dad --help")
  end
end
