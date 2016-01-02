# Maintainer:  Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: Mark Foxwell <fastfret79@archlinux.org.uk>
# Contributor: morwel <rt dot riedel at web dot de>
# Contributor: bct <bct at diffeq dot com>

pkgname=imapfilter
pkgver=2.6.4
pkgrel=1
pkgdesc="A mail filtering utility for processing IMAP mailboxes"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/lefcha/imapfilter"
license=('MIT')
depends=('lua' 'pcre' 'openssl')
optdepends=('openssl: SSL/TLS encryption and CRAM-MD5 authentication')
source=("https://codeload.github.com/lefcha/${pkgname}/tar.gz/v${pkgver}")
sha256sums=('ab29faab15a5b9ac616bfca65114c5067a3a26b7b32e2a70c32eb12ac1f16c1e')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # sometimes imapfilter doesn't compile with LDFLAG "--as-needed".
  # in that case, uncomment next line.
  # LDFLAGS="-Wl,--hash-style=gnu -Wl"

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
