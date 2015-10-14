# Maintainer: benklett <b.klettbach@gmail.com>

pkgname=libjpeg9
pkgver=9b
pkgrel=1
pkgdesc="JPEG image compression"
arch=('i686' 'x86_64')
url="http://www.infai.org/jpeg/"
license=('custom')
depends=('glibc')
makedepends=('libtool')
source=(jpegsrc.v0$pkgver.tar.gz::"http://www.infai.org/jpeg/files?get=jpegsrc.v0$pkgver.tar.gz")
md5sums=('81fd9409f51bb6c2c14647a73db89715')

build() {
  cd "$srcdir"
  bsdtar -xf "jpegsrc.v0$pkgver.tar.gz"
  cd "$srcdir/jpeg-$pkgver"
  ./configure --prefix=/usr --enable-shared --enable-static
  make
}

check() {
  cd "$srcdir/jpeg-$pkgver"
  make -k check
}

package() {
  cd "$srcdir/jpeg-$pkgver"
  make prefix="$pkgdir/usr" mandir="$pkgdir/usr/share/man" install
  
  install -m644 jpegint.h "$pkgdir/usr/include"
  install -Dm644 README "$pkgdir/usr/share/licenses/libjpeg9/README"
  
  cd "$pkgdir"
  
  for fn in "$pkgdir/usr/bin"/*; do mv $fn ${fn}${pkgver}; done
  rm "$pkgdir/usr/lib/libjpeg".{a,so}
  for fn in "$pkgdir/usr/share/man/man1"/*; do mv $fn ${fn%.1}${pkgver}; done
  mkdir -p "$pkgdir/usr/include/libjpeg9"
  mv "$pkgdir/usr/include"/*.h "$pkgdir/usr/include/libjpeg9"
} 
