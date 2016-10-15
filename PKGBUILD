# Maintainer: Christopher Arndt <aur at chrisarndt dot de>

_pkgname="mando"
pkgname="python-${_pkgname}"
pkgver=0.4
pkgrel=1
pkgdesc="A wrapper for the Python argparse module, which helps to write flexible CLI applications"
arch=('any')
url="https://mando.readthedocs.org/"
license=('MIT')
depends=('python-sphinx')
source=("https://pypi.python.org/packages/2b/52/684d9ab8c2ccfb611275f2e44d3ebc76a6a6c56f4afacd2e91237fa07ec3/${_pkgname}-${pkgver}.tar.gz"
  'LICENSE'
)
sha256sums=('853ff98f80266387b37850ecc4f8cac59d24cecc623fb7d2ef2bc5febbad2cae'
            '6123bc92c70372634b45af73fbae39eaa70683a66782b73b833c258c4de939eb')

package() {
  cd "$srcdir/${_pkgname}-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1

  # license
  install -Dm644 ${srcdir}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
