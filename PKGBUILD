pkgname=htmail-view
_commit=59e04aadcd568d3b6f2d80fd6afd839ecaf4c005
pkgver=20190721
pkgrel=2
pkgdesc="Web page renderer based on WebKit"
arch=(any)
url="https://github.com/liske/htmail-view"
license=('GPL2')
depends=('perl' 'perl-browser-open' 'perl-uri' 'glib-perl' 'perl-gtk3' 'perl-gtk3-webkit')
optdepends=('wmctrl')
source=("https://github.com/liske/htmail-view/archive/${_commit}.tar.gz")
sha256sums=('3d6d3e5bbb29e6f2f3ad22e05cb2f6d4750a7a338b4e2fa559a7d597e079786f')

prepare() {
  cd "$srcdir/$pkgname-${_commit}"
  sed -i 's;etc/Muttrc\.d;usr/share/doc/htmail-view;g' Makefile
}

package() {
  cd "$srcdir/$pkgname-${_commit}"
  make DESTDIR="$pkgdir/" install
  for _page in htmail-decode.1 htmail-view.1
  do
    install -m 644 -D "man/$_page" "$pkgdir/usr/share/man/man1/$_page"
  done
}
