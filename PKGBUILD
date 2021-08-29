# Maintainer: Klaus Alexander Seistrup <klaus@seistrup.dk>
# -*- mode: sh -*-

pkgname='libcanlock'
pkgver=3.2.2
pkgrel=1
arch=('x86_64' 'armv7h')
url='https://micha.freeshell.org/libcanlock/'
license=('custom')
provides=(
  'canlock'
  'libcanlock'
)
conflicts=(
  'canlock'
  'libcanlock'
)
source=(
  "https://micha.freeshell.org/libcanlock/src/${pkgname}-${pkgver}.tar.bz2"
)
md5sums=(
  '2f35d85e3ae2c75fafbdb2edd44c2b46'
)
sha1sums=(
  'b352f4ced760c5bd7c6ab013316bf7110e0fa62b'
)
sha256sums=(
  '94b7020af077b18832baf50ab5ca3632979d3524bcf73e60ddb84c31dbb5a6ac'
)
sha512sums=(
  '3d194a37bdbdf640bb6996383ce988c9177573b6f84c29569d759308564c7636d98d5c267988bd034b33681f814400eb7fbecf78d90f54b126edb3bf384f928f'
)
b2sums=(
  'e332c379647c7ad3fbf5f0a8051b888be65674bcb2c9be1b689f009fd35eecbb29644d9f17aaa3812c9405283708207c6f220f630e0dd1c6a5508d41b85a6070'
)

build() {
  cd "$srcdir/$pkgname-$pkgver" || exit 1

  ./configure \
    --prefix=/usr \
    --enable-legacy-api \
    --enable-pc-files

  make
  make test
}

package() {
  cd "$srcdir/$pkgname-$pkgver" || exit 1

  make DESTDIR="$pkgdir/" install

  install -Dm0644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm0644 README  "$pkgdir/usr/share/doc/$pkgname/README"
}
