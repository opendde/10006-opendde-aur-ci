# Maintainer : Daniel Bermond <dbermond@archlinux.org>
# Contributor: Det

pkgname=egl-wayland-git
pkgver=1.1.6.r0.g1b0f2b8
pkgrel=1
pkgdesc='EGLStream-based Wayland external platform (git version)'
arch=('x86_64')
url='https://github.com/NVIDIA/egl-wayland/'
license=('MIT')
depends=('wayland')
makedepends=('git' 'meson' 'eglexternalplatform' 'libegl')
provides=('egl-wayland')
conflicts=('egl-wayland')
source=('git+https://github.com/NVIDIA/egl-wayland.git'
        '10_nvidia_wayland.json')
sha256sums=('SKIP'
            '5cccf1905a266e8e34d5ad4aad4be85390e60b1a0850a29dd9d64adc641de412')

pkgver() {
    git -C egl-wayland describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    arch-meson build egl-wayland
    ninja -C build
}

check() {
    ninja -C build test
}

package() {
    DESTDIR="$pkgdir" ninja install -C build
    install -D -m644 egl-wayland/include/*.h -t "${pkgdir}/usr/include"
    install -D -m644 10_nvidia_wayland.json -t "${pkgdir}/usr/share/egl/egl_external_platform.d"
    install -D -m644 egl-wayland/COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
} 
