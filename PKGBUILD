# Maintainer  : Chris Billington <chrisjbillington@gmail.com>
pkgname=python-numpy-mkl-bin
_pkgname=numpy-base
_pkgver=1.21.5
_build=py310h9585f30_2
pkgver="${_pkgver}.anaconda${_build##*_}"
pkgrel=1
pkgdesc="Scientific tools for Python - with Intel MKL - prebuilt binaries from Anaconda"
arch=('x86_64')
url="https://www.numpy.org/"
license=('custom')
provides=('python-numpy' 'python-numpy-mkl')
conflicts=('python-numpy')
depends=('python-mkl-service')
makedepends=('jq')
source=("https://repo.anaconda.com/pkgs/main/linux-64/${_pkgname}-${_pkgver}-${_build}.tar.bz2")
sha256sums=('ee20583430e3bfc7e7c963c4e13d3a5577db08a0f954ced81b09cf461bb3b717')

prepare() {
  # Prefix replacement
  for row in $(jq -c '.paths[] | select(has("prefix_placeholder"))' "info/paths.json"); do
    path=$(echo $row | jq -r '._path')
    prefix=$(echo $row | jq -r '.prefix_placeholder')
    sed -i "s:${prefix}:/usr:g" "${path}"
  done
}

package() {
  mkdir "${pkgdir}/usr"
  cp -drp --no-preserve=ownership "${srcdir}/bin" "${pkgdir}/usr/bin"
  cp -drp --no-preserve=ownership "${srcdir}/lib" "${pkgdir}/usr/lib"
  install -D -m 644 "${srcdir}/info/licenses/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
