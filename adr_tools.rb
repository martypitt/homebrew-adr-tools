class AdrTools < Formula
  desc "A command-line tool for working with Architecture Decision Records (ADRs)."
  homepage "https://github.com/npryce/adr-tools" 
  url "https://codeload.github.com/npryce/adr-tools/tar.gz/1.2.0"
  version "1.2.0"
  sha256 "3f45646c099ae996b97c855a9a27ed540e076580eba59c2e8613453b7a67e412"
  
  def install
    inreplace 'src/adr-init', '$(dirname $0)', prefix
    inreplace 'src/adr-new', 'ADR_TEMPLATE:-$(dirname $0)/template.md', "ADR_TEMPLATE:-#{prefix}/template.md"

    prefix.install Dir["src/*.md"]
    bin.install Dir["src/*"] - Dir["src/*.md"]
  end

  test do
    system "true"
  end
end
