# Maintainer: Peter Mattern <pmattern at arcor dot de>
# Contributor: Ansgar Taflinski <ataflinski at uni-koblenz dot de>
# Contributor: Jordy van Wolferen <jordy at kluisip dot nl>

_pkgname=xf86-video-qxl
pkgname=$_pkgname-git
pkgver=0.1.5
pkgrel=1
pkgdesc='X Window System QXL driver including Xspice server'
arch=('i686' 'x86_64')
url='http://www.spice-space.org'
license=('MIT')
depends=('xf86dgaproto' 'xproto' 'fontsproto' 'randrproto' 'renderproto'
         'videoproto' 'resourceproto' 'scrnsaverproto' 'spice')
optdepends=('python2: Xspice server')
makedepends=('git' 'xorg-server-devel' 'X-ABI-VIDEODRV_VERSION=23' 'spice-protocol')
provides=('xf86-video-qxl')
conflicts=('xf86-video-qxl' 'X-ABI-VIDEODRV_VERSION<23' 'X-ABI-VIDEODRV_VERSION>=24')
source=('git://anongit.freedesktop.org/xorg/driver/xf86-video-qxl')
sha256sums=('SKIP')

pkgver() {
    cd $_pkgname
    git describe --always | sed 's/xf86-video-qxl.//;s/-/./g'
}

prepare() {
    cd $_pkgname
    sed -i '1c #!/usr/bin/python2' scripts/Xspice
}

build() {
    cd $_pkgname

    # Since pacman 5.0.2-2, hardened flags are now enabled in makepkg.conf
    # With them, module fail to load with undefined symbol.
    # See https://bugs.archlinux.org/task/55102 / https://bugs.archlinux.org/task/54845
    export CFLAGS=${CFLAGS/-fno-plt}
    export CXXFLAGS=${CXXFLAGS/-fno-plt}
    export LDFLAGS=${LDFLAGS/,-z,now}

    ./autogen.sh --prefix=/usr --enable-xspice=yes
    make
}

package() {
    cd $_pkgname
    make DESTDIR=$pkgdir install
    install -D -m644 $srcdir/$_pkgname/COPYING \
      $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
