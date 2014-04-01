require 'formula'

class Coteline < Formula
  homepage 'http://typeunsafe.github.io/coteline/'
  url 'https://github.com/TypeUnsafe/coteline-lang/releases/download/ffff-me-iam-famous-spring-2014/coteline-ffff-me-iam-famous-spring-2014.zip'
  sha1 '6a99539e4c948eafde677640dbe9b49e4926e5e1'

  def install
    rm_f Dir["bin/*.bat"]

    man1.install Dir['doc/man/man1/*']
    doc.install Dir['doc/*']
    libexec.install Dir['*']

    # Symlink shell scripts but not args.sh
    # bin.install_symlink Dir["#{libexec}/bin/ceylon*"]
    bin.install_symlink Dir["#{libexec}/bin/coteline*"]
  end

  def caveats
    "Ceylon requires Java 7."
  end

  test do
    cd "#{libexec}/samples/helloworld" do
      system "#{bin}/ceylon", "compile", "com.acme.helloworld"
      system "#{bin}/ceylon", "doc", "--non-shared", "com.acme.helloworld"
      system "#{bin}/ceylon", "run", "com.acme.helloworld/1.0.0", "John"
    end
  end
end
