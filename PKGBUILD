# Maintainer: Michael Schubert <mschu.dev at gmail>
# Contributor: moostik <mooostik_at_gmail.com>
# Contributor: mick elliot <micke@sfu.ca>
pkgname=emboss
_pkgname=EMBOSS
pkgver=6.6.0
pkgrel=2
pkgdesc="A collection of molecular biology applications"
arch=('x86_64' 'i686')
url="http://emboss.sourceforge.net/"
depends=('gd' 'pcre' 'java-runtime')
optdepends=('libmariadbclient' 'postgresql-libs')
makedepends=('libmariadbclient' 'postgresql-libs' 'java-environment')
options=('!libtool')
license=('GPL2')
source=("http://debian.rub.de/ubuntu/pool/universe/e/emboss/emboss_$pkgver.orig.tar.gz")
sha256sums=('7184a763d39ad96bb598bfd531628a34aa53e474db9e7cac4416c2a40ab10c6e')

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  ./configure --prefix=/usr --enable-large --with-x

  sed -i 's|$(bindir)/embossupdate|:|' Makefile
  JAVA_CFLAGS="-I$JAVA_HOME/include -I$JAVA_HOME/include/linux" make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  make DESTDIR="$pkgdir" install

  # provided pcre headers conflict with pcre
  mv "$pkgdir"/usr/include "$pkgdir"/usr/emboss
  mkdir "$pkgdir"/usr/include
  mv "$pkgdir"/usr/emboss "$pkgdir"/usr/include/
  # showdb conflicts with sqlite
  mv "$pkgdir"/usr/bin/{,emboss_}showdb
}
