# Maintainer: portaloffreedom

_pkgsrcname=adapt-parser
pkgname=python-adapt-parser
pkgver=0.3.0
pkgrel=1
pkgdesc="A text-to-intent parsing framework"
url="https://github.com/MycroftAI/adapt"
license=("LGPL3")
arch=("any")
depends=('python')
source=("https://pypi.python.org/packages/36/a4/3ef82c754a8fb079a98d0adb66be1e3dc7a42d6faafdf1f106924a48c352/adapt-parser-$pkgver.tar.gz")

sha256sums=('9445c9be4fcf3c519d1fbc605ea289349e11c2eb581db72242b61d12cc4d337f')

package() {
  cd $srcdir/${_pkgsrcname}-$pkgver
  python3 setup.py install --root $pkgdir
}


