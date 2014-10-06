# Maintainer: Florian Bruhin <archlinux.org@the-compiler.org>
# Contributor: Bruno Galeotti <bgaleotti at gmail dot com>

pkgname=python2-websocket-client
pkgver=0.18.0
pkgrel=2
pkgdesc="Websocket client for Python."
url="https://github.com/liris/websocket-client"
license=('LGPL')
arch=('any')
depends=('python2>=2.7' 'python2-backports.ssl_match_hostname' 'python2-six')

makedepends=('python2-distribute')
source=(http://pypi.python.org/packages/source/w/websocket-client/websocket-client-$pkgver.tar.gz
        tests-package.patch)
sha512sums=('5524271067fd3b89ddbe3ab6cdb2491a1387a54ff569b043a1daffe8b50b0c470c9b6c2671b3d77f2b6261e4125e753410eed818f492e2669df2a84c92bf805a'
            '88f22fac7ad4a333288cd4e2159feada02500b8d3624ef1bc9256a1705d6e03023aee1d5d03330c521dbfe0b2ac4549e49bb6e65ff0b8eeab43c1e01b163e6bc')

prepare() {
  cd "$srcdir/websocket-client-$pkgver"
  patch -p0 -i "$srcdir/tests-package.patch"
}

build() {
  cd "$srcdir/websocket-client-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/websocket-client-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1

  find "$pkgdir" -name "*.py" -exec \
    sed -i '1s|env python|env python2|' {} \;
}


# vim: ts=2 sts=2 sw=2 et ft=sh
