# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Maintainer: Jordan Cook <JCook83@gmail.com>
# Contributor: Benoit Pierre <benoit.pierre@gmail.com>
# Contributor: Marc Plano-Lesay <kernald@enoent.fr>
_base=url-normalize
pkgname=python-${_base}
pkgdesc="URL normalization for Python"
pkgver=1.4.3
pkgrel=14
arch=('any')
url="https://github.com/niksite/${_base}"
license=(MIT)
depends=(python-six)
makedepends=(python-build python-install python-poetry)
checkdepends=(python-pytest-cov python-pytest-flakes python-pytest-socket)
source=(${url}/archive/${pkgver}.tar.gz)
sha512sums=('46eaa1753b37e89d56cb19818144a7cf5b38653811720eb506732c35bb3732ef0c556420b22a9ee2c08e70e5b408aab7f44cea5e15d1ebe3d717c0c77706bfb8')

build() {
  cd "${_base}-${pkgver}"
  # Note: set `GIT_CEILING_DIRECTORIES` to prevent poetry
  # from incorrectly using a parent git checkout info.
  # https://github.com/pypa/build/issues/384#issuecomment-947675975
  GIT_CEILING_DIRECTORIES="${PWD}/.." python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd "${_base}-${pkgver}"
  pytest tests
}

package() {
  cd "${_base}-${pkgver}"
  export PYTHONHASHSEED=0
  python -m install --optimize=1 --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
