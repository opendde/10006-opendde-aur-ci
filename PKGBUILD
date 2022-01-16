# Maintainer: dreieck
# Contributor: Cirk2

_pkgname=libcpufeatures
pkgname="${_pkgname}-git"
pkgver=0.6.0.19.r218.d20210707.628c50e
pkgrel=2
pkgdesc="A cross-platform C library to retrieve CPU features (such as available instructions) at runtime. By google."
url="https://github.com/google/cpu_features"
arch=(
  'i686'
  'x86_64'
)
license=(Apache)
depends=(
  'glibc'
)
makedepends=(
  'cmake'
  'git'
)
provides=(
  "${_pkgname}=${pkgver}"
)
conflicts=(
  "${_pkgname}"
  'libvolk'
)
source=(
  "${_pkgname}::git+git://github.com/google/cpu_features.git"
)
sha256sums=(
  'SKIP'
)

pkgver() {
  cd "${srcdir}/${_pkgname}"
  _ver="$(git describe --tags | sed 's|^v||' | awk -F'-' '{print $1}')"
  _subver="$(git describe --tags | awk -F'-' '{print $2}')"
  _rev="$(git rev-list --count HEAD)"
  _hash="$(git rev-parse --short HEAD)"
  _date="$(git log -n 1 --format=tformat:%ci | awk '{print $1}' | tr -d '-')"
  if [ -z ${_ver} ]; then
    error "Error in ${FUNCNAME[0]}: Version information could not determined."
    return 1
  fi
  printf '%s' "${_ver}.${_subver}.r${_rev}.d${_date}.${_hash}"
}

prepare() {
  mkdir -p "${srcdir}/build"
  cd "${srcdir}/build"

  # cmake issued in `prepare()` since it downloads stuff.
  cmake "${srcdir}/${_pkgname}" \
    -DCMAKE_INSTALL_PREFIX=/ \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_GMOCK=ON \
    -DBUILD_PIC=ON \
    -DBUILD_SHARED_LIBS=ON \
    -DBUILD_TESTING=OFF \
    -DINSTALL_GTEST=ON
}

build() {
  cd "${srcdir}/build"

  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}" install
  install -Dm644 "${srcdir}/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
