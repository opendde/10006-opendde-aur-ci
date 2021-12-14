# Maintainer: Jordan Cook <JCook83@gmail.com>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Benoit Pierre <benoit.pierre@gmail.com>
# Contributor: LinArcX <LinArcX at gmail . com>
_base=requests-cache
pkgname=python-${_base}-git
_pkgname=${pkgname%-git}
pkgdesc="Transparent persistent cache for http://python-requests.org library (git version)"
pkgver=0.9.0.r68.g71ea521
pkgrel=2
arch=('any')
url="https://github.com/reclosedev/${_base}"
license=('custom:BSD-2-clause')
depends=(python-requests python-appdirs python-cattrs python-url-normalize)
makedepends=(python-build python-install python-poetry git)
optdepends=('python-boto3: Cache backend for Amazon DynamoDB database'
  'python-botocore: Interface for Amazon Web Services'
  'python-pymongo: Cache backend for MongoDB database'
  'python-redis: Cache backend for Redis cache'
  'python-bson: for BSON codec'
  'python-itsdangerous: for pass trusted data to untrusted environments'
  'python-yaml: for bindings yaml support'
  'python-ujson: for JSON serializer for improved performance') # python-sphinx-furo python-linkify-it-py python-myst-parser
checkdepends=(python-pytest python-requests-mock python-responses python-itsdangerous python-ujson python-timeout-decorator)
source=("git+${url}")
sha512sums=('SKIP')
provides=(${_pkgname})
conflicts=(${_pkgname})

pkgver() {
  cd "${_base}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${_base}"
  # Note: set `GIT_CEILING_DIRECTORIES` to prevent poetry
  # from incorrectly using a parent git checkout info.
  # https://github.com/pypa/build/issues/384#issuecomment-947675975
  GIT_CEILING_DIRECTORIES="${PWD}/.." python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd "${_base}"
  python -m pytest --ignore=tests/integration
}

package() {
  cd "${_base}"
  export PYTHONHASHSEED=0
  python -m install --optimize=1 --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${_pkgname}"
}
