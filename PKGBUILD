pkgname=gnupg-pkcs11-scd
pkgver=0.7.6
pkgrel=0
pkgdesc="A smart-card daemon to enable the use of PKCS11 tokens with GnuPG."
url="http://gnupg-pkcs11.sourceforge.net"
license=("BSD")
depends=(pkcs11-helper libgpg-error libassuan libgcrypt)
arch=('arm' 'i686' 'x86_64')
md5sums=('138ee91c96d0e4054d16c7530cdd794d')
source=(https://github.com/alonbl/gnupg-pkcs11-scd/releases/download/$pkgname-$pkgver/$pkgname-$pkgver.tar.bz2)

build() {
    cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
