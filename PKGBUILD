# Maintainer: Alexander Phinikarides, <alexisph at gmail dot com>

pkgname=blockdiag
pkgver=1.5.3
pkgrel=6
pkgdesc="simple block-diagram image generator"
arch=("any")
url="http://blockdiag.com/en/blockdiag/index.html"
license=('apache')
depends=('python' 'python-webcolors'  'python-funcparserlib' 'python-pillow')
optdepends=('python-blockdiagcontrib-cisco: Cisco shape files')
source=("https://bitbucket.org/$pkgname/$pkgname/get/$pkgver.tar.gz")
md5sums=('d38f0ff8609a3076e0d2b97cf5cf2d83')

build() {
  cd "$srcdir/$pkgname-"*
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-"*
  python setup.py install --skip-build --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
