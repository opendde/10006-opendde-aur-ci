# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: François Lebigre <francois.lebigre@gmail.com>
# Contributor: Daniel Ehlers <danielehlers@mindeye.net>

pkgname=cduce
pkgver=0.5.3
pkgrel=1
pkgdesc='XML-oriented functional language'
url='http://www.cduce.org/'
arch=('x86_64' 'i686')
license=('MIT')
depends=('ocaml>=3.10' 'ocaml-findlib>=1.0.3' 'ulex>=1.0' 'ocaml-pcre>=5.13.0' 'ocamlnet>=0.98')
source=("http://www.cduce.org/download/$pkgname-$pkgver.tar.gz")
sha256sums=('38264f53790075c3046f9ea55984b50366e0888e80512b9cbc2ed42ff36f10b2')

build() {
  cd "$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  make BINDIR="$pkgdir/usr/bin" MANDIR="$pkgdir/usr/man" DOCDIR="$pkgdir/usr/doc/cduce" CGI_DIR="$pkgdir/var/www/cgi-bin" HTML_DIR="$pkgdir/var/www/html" SESSION_DIR="$pkgdir/tmp/cduce_sessions" -C "$pkgname-$pkgver" install
  install -Dm644 "$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
