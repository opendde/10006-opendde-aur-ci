# Maintainer: Frederik Schwan <freswa at archlinux dot org>
# Contributor: Robert Knauer <robert@privatdemail.net>
# Contributor: Elena ``of Valhalla'' Grandi <elena.valhalla@gmail.com>

pkgname=pdfposter
pkgver=0.7.post1
pkgrel=2
pkgdesc='Print large posters on multiple sheets'
arch=('any')
url='https://gitlab.com/pdftools/pdfposter'
license=('GPL3')
depends=('python-pypdf2' 'python-setuptools')
makedepends=('python-pytest')
source=("https://gitlab.com/pdftools/pdfposter/-/archive/v${pkgver}/pdfposter-v${pkgver}.tar.bz2")
b2sums=('b4dc9ac56ecf76c8b8759ca2c7cba89b5479c1706315d44f4d8852b634a53be048060ecc976355276334e1d8d1114df3818bbc306ff3e3b9f636839644333b24')

build() {
  cd ${pkgname}-v${pkgver}
  python setup.py build
}

check() {
  cd ${pkgname}-v${pkgver}
  python -m pytest test/unit
}

package() {
  cd ${pkgname}-v${pkgver}
  NO_THIRD_PARTY=true python setup.py install --skip-build --root="${pkgdir}" --optimize=1
}
