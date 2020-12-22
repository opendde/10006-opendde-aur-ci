# Maintainer: Ivan Krivosheev <py.krivosheev@gmail.com>

pkgname=batify2
pkgver=1.4.0
pkgrel=1
pkgdesc="Lightweight battery notification"
arch=(x86_64)
url="https://github.com/ikrivosheev/batify2"
license=(MIT)
depends=(libnotify)
makedepends=(cmake)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
md5sums=('1ab8e06f2798eefd6322a2769c5a880a')

build() {
    export CFLAGS+=" ${CPPFLAGS}"
    export CXXFLAGS+=" ${CPPFLAGS}"

    source_dir="${pkgname}-${pkgver}"
    build_dir="${source_dir}/build"
    cmake -B "${build_dir}" -S "${source_dir}" \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
    cmake --build "${build_dir}" 
}

package() {
    make -C "${pkgname}-${pkgver}/build" DESTDIR="$pkgdir" install
}
