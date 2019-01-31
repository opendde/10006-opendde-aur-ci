# Maintainer: insdavm <insdavm at gmail dot com>

pkgname=igg
pkgver=0.1.r0.g18d74e0
pkgrel=1
pkgdesc="A command line utility for geolocating IP addresses and host names"
arch=('any')
url="https://gitlab.com/nxl4/igg"
license=('GPL3')
depends=('python')
source=('git+http://gitlab.com/nxl4/igg.git#tag=v0.1')
md5sums=('SKIP')

pkgver() {
    cd "$pkgname"
    ( set -o pipefail
      git describe --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
	  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

package() {
    cd "$srcdir/$pkgname"
    make DESTDIR="$pkgdir/" install
}
