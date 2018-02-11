pkgname=gnupg-pkcs11-scd
pkgver=0.9.1
pkgrel=1
pkgdesc="A smart-card daemon to enable the use of PKCS11 tokens with GnuPG."
url="http://gnupg-pkcs11.sourceforge.net"
license=("BSD")
depends=(pkcs11-helper libgpg-error libassuan libgcrypt openssl)
arch=('arm' 'i686' 'x86_64')
md5sums=('f8657b13d14b055c58c8f3cc065421d9'
         '5fed5d73bbf3f8692fd58af12e41a088')
source=(https://github.com/alonbl/gnupg-pkcs11-scd/releases/download/$pkgname-$pkgver/$pkgname-$pkgver.tar.bz2
	openssl11.patch)

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  patch -Np1 -i "${srcdir}/openssl11.patch"
}

build() {
    cd "$srcdir/$pkgname-$pkgver"

  OPENSSL_CFLAGS="-I/usr/include/openssl-1.0" ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
