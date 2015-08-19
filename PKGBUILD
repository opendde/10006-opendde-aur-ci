# Maintainer: Lukas K. <lu at 0x83 dot eu>

pkgname=blockdiag
pkgver=1.5.3
pkgrel=1
pkgdesc="simple block-diagram image generator"
arch=("any")
url="http://blockdiag.com/en/blockdiag/index.html"
license=('apache')
depends=('python')
source=("https://bitbucket.org/$pkgname/$pkgname/get/$pkgver.tar.gz")
md5sums=("d38f0ff8609a3076e0d2b97cf5cf2d83")

package() {
  cd "$srcdir/$pkgname-"*
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
