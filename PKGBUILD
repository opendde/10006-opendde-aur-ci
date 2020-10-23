# Maintainer: nosada <ngsksdt@gmail.com>

pkgname=python-py-gfm
_pkgname=py-gfm
pkgver=1.0.2
pkgrel=1
pkgdesc="Github-Flavored Markdown for Python-Markdown"
url="https://github.com/Zopieux/py-gfm"
arch=(any)
license=('custom')
depends=('python' 'python-markdown')
makedepends=('python-setuptools')
source=("https://github.com/Zopieux/${_pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('17226897e792477ff57a0346c112c9f3862e48a279af54be3b302660190fdeeeb1fb3657f04229eb6ba03472578acad704afe88f1522e80f5e732aa39a3fbe33')

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python setup.py build
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python setup.py install --root=${pkgdir}
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

# vim:set ts=2 sw=2 et:
