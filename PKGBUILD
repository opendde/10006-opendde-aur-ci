# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=cs-paint-git
pkgver=r24.b2d3393
pkgrel=1
pkgdesc='Library for abstraction of the Vulkan API (git version)'
arch=('x86_64')
url='https://www.copperspice.com/'
license=('BSD')
depends=('gcc-libs' 'glm' 'vulkan-icd-loader')
makedepends=('git' 'cmake' 'glslang' 'vulkan-headers')
provides=('cs-paint')
conflicts=('cs-paint')
options=('!emptydirs')
source=('git+https://github.com/copperspice/cs_paint.git')
sha256sums=('SKIP')

pkgver() {
    printf 'r%s.%s' "$(git -C cs_paint rev-list --count HEAD)" "$(git -C cs_paint rev-parse --short HEAD)"
}

build() {
    cmake -B build -S cs_paint \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -Wno-dev
    make -C build
}

package() {
    make -C build DESTDIR="$pkgdir" install
    install -D -m644 cs_paint/src/*.h -t "${pkgdir}/usr/include"
    install -D -m644 cs_paint/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    rm -rf "${pkgdir}/usr"/{bin/CsPaintDemo,{include,lib/cmake}/glm,lib/pkgconfig/glm.pc}
}
