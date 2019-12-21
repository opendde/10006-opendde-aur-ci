# Maintainer : Lone_Wolf <lonewolf at xs4all dot nl>
# Contributor : Eric Engestrom <eric@engestrom.ch>
# Contributor : Jan de Groot <jgc@archlinux.org>

pkgname=libdrm-git
_realname=libdrm
pkgver=2.4.100.r42.gc70bd7b7
pkgrel=1
pkgdesc="Userspace interface to kernel DRM services, master git version"
arch=(i686 x86_64)
license=('custom')
depends=('libpciaccess')
makedepends=('libxslt' 'docbook-xsl' 'meson')
checkdepends=('cairo')
url="http://dri.freedesktop.org/"
provides=('libdrm')
conflicts=('libdrm')

source=('libdrm::git://anongit.freedesktop.org/mesa/drm#branch=master'
        COPYING)
sha512sums=('SKIP'
            'b0ca349b882a4326b19f81f22804fabdb6fb7aef31cdc7b16b0a7ae191bfbb50c7daddb2fc4e6c33f1136af06d060a273de36f6f3412ea326f16fa4309fda660')

pkgver() {
    cd $_realname
    git describe --long --abbrev=8 | sed 's/^libdrm-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    if [  -d _build ]; then
        rm -rf _build
    fi
}

build() {
    meson setup libdrm _build \
        --prefix /usr \
        --buildtype plain \
        --wrap-mode      nofallback \
        -D udev=false \
        -D valgrind=false
    meson configure _build
    ninja -C _build
}

check() {
   # '-t 10' is needed for the 'threaded' test, which uses the default meson
   # test timeout of 30 seconds. This is too short for many systems. It can be
   # removed if upstream fixes the issue.
   meson test -C _build -t 10
}

package() {
  DESTDIR="$pkgdir" ninja -C _build install
  install -Dt "$pkgdir"/usr/share/licenses/"$pkgname" -m644 COPYING
}
