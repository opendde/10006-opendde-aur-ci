# Maintainer: Federico Di Pierro <nierro92@gmail.com>

pkgname=clightd
_gitname=Clightd
pkgver=3.1
pkgrel=1
pkgdesc="Bus interface to change screen brightness and capture frames from webcam."
arch=('i686' 'x86_64')
url="https://github.com/FedeDP/${_gitname}"
license=('GPL')
depends=('systemd>=221' 'linux-api-headers' 'libx11' 'libxrandr' 'libxext' 'polkit' 'libxss' 'ddcutil' 'libmodule>=3.1.0')
makedepends=('git' 'cmake')
optdepends=('clight: user service to automagically change screen backlight matching ambient brightness.')
source=("${_gitname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=("8631af4ed385bd752c17462a77f43abfb9932941780d8312a15cc76d7f0e4ebe")

prepare() {
    cd "${srcdir}/${_gitname}-${pkgver}"
    mkdir -p build
}

build() {
    cd "${srcdir}/${_gitname}-${pkgver}/build"
     cmake \
        -G "Unix Makefiles" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_BUILD_TYPE="Release" \
        -DENABLE_DDC=1 -DENABLE_GAMMA=1 -DENABLE_IDLE=1 -DENABLE_DPMS=1 \
        ..
    make
}

package() {
    cd "${srcdir}/${_gitname}-${pkgver}/build"
    make DESTDIR="$pkgdir" install
}
