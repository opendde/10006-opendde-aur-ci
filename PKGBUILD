# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=secp256k1-git
pkgver=20151210
pkgrel=1
pkgdesc="Elliptic Curve Library for libbitcoin"
arch=('i686' 'x86_64')
url="https://github.com/libbitcoin/secp256k1"
makedepends=('gcc' 'git' 'make' 'pkg-config')
groups=('libbitcoin')
license=('MIT')
source=(git+https://github.com/libbitcoin/secp256k1#branch=version4)
sha256sums=('SKIP')
provides=('secp256k1')
conflicts=('secp256k1')

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

build() {
  cd ${pkgname%-git}

  msg2 'Building...'
  ./autogen.sh
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --libexecdir=/usr/lib/secp256k1 \
    --sysconfdir=/etc \
    --sharedstatedir=/usr/share/secp256k1 \
    --localstatedir=/var/lib/secp256k1 \
    --enable-module-recovery \
    --enable-tests=no \
    --with-gnu-ld
  make
}

package() {
  cd ${pkgname%-git}

  msg2 'Installing license...'
  install -Dm 644 COPYING -t "$pkgdir/usr/share/licenses/secp256k1"

  msg2 'Installing...'
  make DESTDIR="$pkgdir" install

  msg2 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
