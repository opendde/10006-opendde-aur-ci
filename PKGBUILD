# Maintainer:  Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: Mark Foxwell <fastfret79@archlinux.org.uk>
# Contributor: morwel <rt dot riedel at web dot de>
# Contributor: bct <bct at diffeq dot com>

pkgname=imapfilter
pkgver=2.6.6
pkgrel=2
pkgdesc="A mail filtering utility for processing IMAP mailboxes"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/lefcha/imapfilter"
license=('MIT')
depends=('lua' 'pcre' 'openssl')
optdepends=('openssl: SSL/TLS encryption and CRAM-MD5 authentication')
source=("https://codeload.github.com/lefcha/${pkgname}/tar.gz/v${pkgver}")
sha256sums=('3ee921d9ca23c794291fa9815028e02c19e0549e1f8ded1133a0ee1747a6230e')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # sometimes imapfilter doesn't compile with LDFLAG "--as-needed".
  # in that case, uncomment next line.
  # LDFLAGS="-Wl,--hash-style=gnu -Wl"

  sed -i "s/MYCFLAGS =/MYCFLAGS=${CFLAGS}/" src/Makefile
  sed -i "s/MYLDFLAGS =/MYLDFLAGS=${LDFLAGS}/" src/Makefile

  make PREFIX=/usr all
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make PREFIX=/usr DESTDIR="$pkgdir/" MANDIR=/usr/share/man install

  # install sample files
  install -D -m644 samples/config.lua $pkgdir/usr/share/$pkgname/samples/config.lua
  install -D -m644 samples/extend.lua $pkgdir/usr/share/$pkgname/samples/extend.lua

  # install license
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
