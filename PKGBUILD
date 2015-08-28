pkgname=gnupg-pkcs11-scd
pkgver=0.7.3
pkgrel=0
pkgdesc="A smart-card daemon to enable the use of PKCS11 tokens with GnuPG."
url="http://gnupg-pkcs11.sourceforge.net"
license=("BSD")
depends=(pkcs11-helper libgpg-error libassuan libgcrypt)
arch=('arm' 'i686' 'x86_64')
md5sums=('1d85a0cce0ad383be0f07cd16fc5b208')
source=(http://downloads.sourceforge.net/sourceforge/gnupg-pkcs11/$pkgname-$pkgver.tar.bz2)

build() {
    cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
