# Maintainer: Stefan Seemayer <mail@semicolonsoftware.de>
pkgname=jalview
pkgver=2.10.1
pkgrel=1
pkgdesc="Bioinformatics Multiple Alignment Editor"
arch=(any)
url="http://www.jalview.org/"
license=('GPL3')
depends=(java-runtime)
makedepends=(wget xmlstarlet)

source=( "http://www.jalview.org/webstart/jalview.jnlp"
         "logo.gif"
         "jalview"
         "jalview.desktop")

md5sums=('0ce946664997d3cfceab7cf7a639f8ba'
         'e124f66d646560813b1a06b0cff02d3a'
         '0ea5c6990bfa050c9c69f24926da3d57'
         'b3a842500e7ff3cd1324dede69822d21')

build() {

  mkdir -p "$srcdir/$pkgname-$pkgver" || exit 1
  cd "$srcdir/$pkgname-$pkgver" || exit 1

  # parse list of jar files from JNLP file, excluding MacOS jars
  jars=$(xmlstarlet sel -t -m '/jnlp/resources[not(@os)]/jar' -v '@href' -n "$srcdir/jalview.jnlp")

  for jar in $jars; do
    wget "http://www.jalview.org/webstart/$jar" -O "$jar" || exit 1
  done
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # set up directory structure
  mkdir -p $pkgdir/usr/{share/{applications,pixmaps,java/$pkgname},bin}

  install -Dm644 *.jar $pkgdir/usr/share/java/$pkgname/
  install -Dm755 ../jalview $pkgdir/usr/bin/
  install -Dm644 ../logo.gif $pkgdir/usr/share/pixmaps/jalview.gif
  install -Dm644 ../jalview.desktop $pkgdir/usr/share/applications/
}

# vim:set ts=2 sw=2 et:
