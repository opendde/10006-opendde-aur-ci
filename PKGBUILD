# Maintainer: ohli <olifriedrich at gmail dot com>

pkgname=w_scan_cpp
pkgver=20210512
pkgrel=1
pkgdesc="A dtv channel scanner based on VDR. Successor of w_scan"
arch=('i686' 'x86_64' 'armv6h')
url="https://www.gen2vdr.de/wirbel/w_scan_cpp/index2.html"
replaces=('w_scan')
license=('GPL')
depends=('glibc' 'libcap' 'freetype2' 'fontconfig') 
makedepends=('sed' 'make' 'wget' 'git')
source=("https://www.gen2vdr.de/wirbel/$pkgname/$pkgname-$pkgver.tar.bz2")
sha256sums=('f64dd0adfcdf4d3ba6f44060fafaf98f385b6d67a7f42016254e53b764980fcd')

build() {
  cd "$pkgname-$pkgver"
  make -j1 download
  make
}

package() {
  cd "$pkgname-$pkgver"
  make prefix="$pkgdir/usr" install
}

