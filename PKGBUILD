# Maintainer: Razer <razer[AT]neuf[DOT]fr>

pkgname=python-adafruit-circuitpython-st7735r
_pypi_pkgname=adafruit-circuitpython-st7735r
pkgver=1.5.3
pkgrel=0
pkgdesc="displayio driver for ST7735R TFT-LCD displays"
arch=('armv6h' 'armv7h' 'aarch64')
url="https://github.com/adafruit/Adafruit_CircuitPython_ST7735R"
license=('MIT')
makedepends=('python-setuptools' 'python-pip')
depends=('python' 'python-adafruit-blinka-displayio')
optdepends=()
source=("https://pypi.io/packages/source/a/${_pypi_pkgname}/${_pypi_pkgname}-${pkgver}.tar.gz")
sha256sums=('9bef4ae527b15b107dc75e1266e5d8e44b87bd64065f0ab515b9c329153fa9ab')

build() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python setup.py build || return 1
}

package() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python setup.py install --root=${pkgdir} --optimize=1 || return 1
    install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
