# Maintainer: Doug Newgard <scimmia22 at outlook dot com>

pkgname=econnman
pkgver=1.1
pkgrel=1
pkgdesc="Enlightenment ConnMan user interface"
arch=('any')
url="http://www.enlightenment.org"
license=('LGPL3')
depends=('python-efl' 'connman')
source=("http://download.enlightenment.org/rel/apps/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('60f30748b2642b83763fe1e00f6a54ff27425c761633bb8cc0396fba15e7f714')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure \
    --prefix=/usr

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install

# install text files
  install -Dm644 AUTHORS "$pkgdir/usr/share/doc/$pkgname/AUTHORS"
  install -Dm644 ChangeLog "$pkgdir/usr/share/doc/$pkgname/ChangeLog"
  install -Dm644 NEWS "$pkgdir/usr/share/doc/$pkgname/NEWS"
  install -Dm644 README "$pkgdir/usr/share/doc/$pkgname/README"
}
