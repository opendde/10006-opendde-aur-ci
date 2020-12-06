# Maintainer: Thor77 <thor77 at thor77 dot org>
# Maintainer: Clar Charr <clar@charr.xyz>
# Contributor: somini <dev at somini dot xyz>

pkgname=miniflux
pkgver=2.0.26
pkgrel=2
pkgdesc='Minimalist Feed Reader'
arch=('x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url='https://miniflux.app'
license=('Apache')
optdepends=("postgresql: unless the database is on another machine, this machine needs it")
makedepends=('go' 'git')
conflicts=('miniflux-git')
backup=('etc/miniflux.conf')
source=(
  https://github.com/miniflux/miniflux/archive/${pkgver}.tar.gz
  miniflux.conf
  miniflux.service
  miniflux.sysusers
)
_repo="v2"
sha256sums=('c16c9386f7a7fa1f938453beaa84d5d704bb8a3e4338a09c7c56df99c776de13'
            '1247a3cfe0307f5f1bb070e616f57344d8f16201070ecf7dda243b3fa1fbd8b8'
            'b0b26d629ebb3a7b4c65d4a293dbc272f4e9695c0803989604519ccac3454402'
            'd1ce5acf1e633b04b92bf9330bd64d97c19d8f8d39c7bb4b64e11a96be4b73e2')

prepare() {
  mkdir -p "${srcdir}/src/github.com/miniflux"
  ln -sf "${srcdir}/${_repo}-${pkgver}" "${srcdir}/src/github.com/miniflux/${pkgname}"
}

case "$CARCH" in
  x86_64) _target=amd64 ;;
  i686) _target=x86 ;;
  arm) _target=armv5 ;;
  armv6h) _target=armv6 ;;
  armv7h) _target=armv7 ;;
  aarch64) _target=arm64 ;;
  *) return 1 ;;
esac

build() {
  cd "${srcdir}/${_repo}-${pkgver}"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  GOPATH="${srcdir}" PATH="${PATH}:${GOPATH}/bin/" make VERSION="${pkgver}" COMMIT="${pkgver}" linux-$_target
}

package() {
  install -Dm644 "${srcdir}/miniflux.conf" "${pkgdir}/etc/miniflux.conf"
  install -Dm644 "${srcdir}/miniflux.service" "${pkgdir}/usr/lib/systemd/system/miniflux.service"
  install -Dm644 "${srcdir}/miniflux.sysusers" "${pkgdir}/usr/lib/sysusers.d/miniflux.conf"
  install -Dm644 "${srcdir}/${_repo}-${pkgver}/miniflux.1" "${pkgdir}/usr/share/man/man1/miniflux.1"
  install -Dm755 "${srcdir}/${_repo}-${pkgver}/miniflux-linux-${_target}" "${pkgdir}/usr/bin/miniflux"
}

