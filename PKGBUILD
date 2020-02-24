# Contributor: yochananmarqos <mark.wagie@tutanota.com>
# Maintainer:  max.bra <max dot bra at alice dot it>

pkgname=arronax
pkgver=0.7.1
pkgrel=4
pkgdesc='A program to create and modify starters/launchers (technically: .desktop files) for applications and locations (URLs).'
arch=('any')
license=('GPL3')
url="http://www.florian-diesch.de/software/arronax/"
depends=('gtk3' 'python-gobject' 'python-setuptools' 'python-xdg')
#makedepends=('python-distutils-extra')
optdepends=('python-nautilus: Arronax as Nautilus extension'
            'python-caja: Arronax as Caja extension'
            'nemo-python: Arronax as Nemo extension')

source=(http://www.florian-diesch.de/software/$pkgname/dist/$pkgname-$pkgver.tar.gz)

md5sums=('f8a61c58ff5b4a27b9f1ba0c5593e81c')

prepare() {
  # Fix icon location
  cd "$srcdir"/$pkgname-$pkgver
  sed -i 's|share/icons/hicolor/{s}x{s}|share/icons/hicolor/{s}x{s}/apps|g' setup.py
}

build() {
  cd "$srcdir"/$pkgname-$pkgver
  /usr/bin/python setup.py build
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  /usr/bin/python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

