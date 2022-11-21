# Maintainer: loooph <loooph@gmx.de>
pkgname=obs-shaderfilter-git
pkgver=1.21.2
pkgrel=1
pkgdesc="enables custom shaders for OBS sources"
arch=('x86_64')
url="https://github.com/exeldro/obs-shaderfilter/"
license=('Unlicense')
depends=(obs-studio)
makedepends=(git)
_basename=${pkgname%-git}
provides=("$_basename")
conflicts=("$_basename")
source=("git+${url}")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_basename"
    git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd $_basename
    cmake -DCMAKE_INSTALL_PREFIX=/usr .
    make

}

package() {
    mkdir -p $pkgdir/usr/lib/obs-plugins/
    mkdir -p $pkgdir/usr/share/obs/obs-plugins/$_basename
    cp   $srcdir/$_basename/rundir/RelWithDebInfo/obs-plugins/64bit/obs-shaderfilter.so $pkgdir/usr/lib/obs-plugins
    cp -R  $srcdir/$_basename/rundir/RelWithDebInfo/data/obs-plugins/$_basename/data/*  $pkgdir/usr/share/obs/obs-plugins/$_basename/
}
