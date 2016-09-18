# $Id$
# Maintainer: Chris Severance aur.severach AatT spamgourmet.com

set -u
_pyver="python2"
_pybase='s3transfer'
pkgname="${_pyver}-${_pybase}"
pkgver='0.1.4'
pkgrel='1'
pkgdesc='Amazon S3 Transfer Manager for Python for aws'
arch=('any')
url="https://github.com/boto/${_pybase}"
license=('Apache') # Apache License 2.0
_pydepends=( # See setup.py, README.rst, and requirements.txt for version dependencies
  "${_pyver}-botocore"{'>=1.3.0','<2.0.0'} # AUR
)
depends=("${_pyver}" "${_pydepends[@]}")
makedepends=("${_pyver}" "${_pyver}-distribute") # same as python-setuptools
_srcdir="${_pybase}-${pkgver}"
#_verwatch=("${url}/releases.atom" '\s\+<title>\([^<]\+\)</title>.*' 'f') # RSS
source=("${_pybase}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('c7179a04f66dd837118c9b30bfcd53ce71320f32aff741c4504d2e05ed0c13af')

build() {
  set -u
  cd "${_srcdir}"
  ${_pyver} setup.py build
  set +u
}

check() {
  set -u
  cd "${_srcdir}"
  # If pip is installed, some package tests download missing packages. We can't allow that.
  #${_pyver} setup.py test --verbose
  set +u
}

package() {
  set -u
  depends=("${_pyver}") # "${_pydepends[@]}")
  cd "${_srcdir}"
  ${_pyver} setup.py install --root="${pkgdir}" --optimize=1
  #install -Dpm644 'LICENSE' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  set +u
}
set +u

# vim:set ts=2 sw=2 et:
