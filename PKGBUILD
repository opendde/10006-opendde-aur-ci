# Maintainer: redfish <redfish@galactica.pw>
# Contributor: Sebastien Leduc <sebastien@sleduc.fr>
# Contributor: ponsfoot <cabezon dot hashimoto at gmail dot com>

pkgname=python-paver
pkgver=1.3.4
pkgrel=1
pkgdesc="Build, Distribute and Deploy Python Projects"
arch=('any')
url="http://www.blueskyonmars.com/projects/paver/"
license=('BSD')
depends=('python')
source=("https://pypi.python.org/packages/source/P/Paver/Paver-${pkgver}.tar.gz")

package() {
  cd "${srcdir}/Paver-${pkgver}"

  # to silence error when .py is compiled into .pyc
  # Remove path2.py and leave path3.py only.
  rm paver/deps/path2.py

  python setup.py install --prefix="${pkgdir}/usr"
  install -D "${srcdir}/Paver-${pkgver}/LICENSE.txt" \
             "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

sha256sums=('d3e6498881485ab750efe40c5278982a9343bc627e137b11adced627719308c7')
