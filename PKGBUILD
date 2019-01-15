# Maintainer: Caleb Bassi <calebjbassi@gmail.com>

pkgname=swaylock-blur-git
_pkgname=${pkgname%-git}
pkgver=r3.cb1df3d
pkgrel=2
pkgdesc="A script that runs swaylock and sets the image to a blurred screenshot of the desktop"
arch=("any")
url="https://github.com/cjbassi/swaylock-blur"
license=("MIT")
depends=("swaylock" "imagemagick" "grim" "jq")
makedepends=("git")
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("git+${url}")
md5sums=("SKIP")

pkgver() {
  cd "${_pkgname}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
    mkdir -p ${pkgdir}/usr/bin/
    install ${srcdir}/${_pkgname}/${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
}
