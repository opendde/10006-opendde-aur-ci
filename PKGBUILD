# Contributor: Patrick Palka <patrick@parcs.ath.cx>
# Contributor: Fabio Pozzim <fabio.pozzi at anche dot no >
# Contributor: Nathan Owe <ndowens04 at gmail>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=tramp
pkgver=2.2.12
pkgrel=1
pkgdesc="emacs extension that provides transparent remote file editing"
arch=('any')
url=http://www.gnu.org/software/tramp/
license=('GPL')
makedepends=('emacs' 'texinfo')
# add texlive-core to the makedepends and comment in the last two lines
# of this PKGBUILD if you want the documentation in dvi-format
source=("ftp://ftp.gnu.org/gnu/tramp/$pkgname-$pkgver.tar.gz")
md5sums=('b78a30258734491bed78f7547db8c787')
install=tramp.install

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr --with-contrib
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  mv $pkgdir/usr/share/info/$pkgname $pkgdir/usr/share/info/$pkgname-new
#  install -Dm644 texi/$pkgname.dvi \
#    $pkgdir/usr/share/doc/$pkgname/$pkgname.dvi
}

