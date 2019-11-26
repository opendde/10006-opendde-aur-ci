# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_name=jinja2-time
pkgname=python-jinja-time
pkgver=0.2.0
pkgrel=2
pkgdesc="Python Jinja2 library extension for dates and times"
arch=(any)
url="https://github.com/hackebrot/${_name}"
license=('MIT')
depends=('python-jinja' 'python-arrow')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('d14eaa4d315e7688daa4969f616f226614350c48730bfa1692d2caebd8c90d40')


build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="$pkgdir" --skip-build --optimize=1

  # license
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
