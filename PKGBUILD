# Maintainer: Andrew O'Neill <andrew at meanjollies dot com>

pkgname=oci-cli
pkgver=3.4.4
pkgrel=1
pkgdesc='Command line interface for Oracle Cloud Infrastructure'
arch=('x86_64')
url="https://github.com/oracle/${pkgname}"
license=('Apache')
depends=('python' 'python-oci' 'python-arrow' 'python-certifi' 'python-click' 'python-dateutil' 'python-cryptography' 'python-pyopenssl' 'python-jmespath' 'python-terminaltables' 'python-idna' 'python-pytz' 'python-six' 'python-retrying' 'python-yaml')
makedepends=('python-setuptools')
optdepends=('python-cx_oracle: Used by the database service')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('95002c6cb3b06b15d1b0b57434e5ba46b00e75dc44ba81be0245d1f8da9297cc')

prepare() {
  cd "${pkgname}-${pkgver}"

  sed -i 's/profile == Sentinel(DEFAULT_PROFILE)/profile == str(Sentinel(DEFAULT_PROFILE))/' src/oci_cli/cli_root.py
  sed -i -r "s/(==|>|<).*'/'/g" setup.py
  sed -i '/configparser/d' setup.py
}

build() {
  cd "${pkgname}-${pkgver}"

  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"

  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
