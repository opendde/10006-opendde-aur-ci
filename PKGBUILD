# Maintainer: Felix Golatofski <contact@xdfr.de>

pkgname=python-jadi
_pkgname=jadi
pkgver=1.0.3
pkgrel=1
pkgdesc="Minimalistic IoC for Python"
arch=("any")
url="https://github.com/ajenti/jadi"
license=('LGPLv3')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"
	"https://raw.githubusercontent.com/ajenti/jadi/master/LICENSE")
sha256sums=('6321ff8aea7b4de7a279d866baada9fb37daf7caf0198151747cf78b9ac96d1f'
            '97628afebc60f026f5c2b25d7491c46a5c4ee61f693e7cfa07fbd2c03605979b')

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python setup.py build
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 ../LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
