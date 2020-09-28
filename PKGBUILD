# Maintainer: Ahmad Hasan Mubashshir <ahmubashshir@gmail.com>
# pkg: git
pkgname="openbangla-keyboard-git"
pkgver=1.5.1.r102.g360208e
pkgrel=2
pkgdesc="An OpenSource, Unicode compliant Bengali Input Method"
arch=('x86_64')
url="https://openbangla.github.io"
license=('GPL3')
provides=( 'openbangla-keyboard' )
conflicts=( 'openbangla-keyboard' )
depends=('ibus' 'qt5-base')
makedepends=('cmake')
optdepends=('ttf-indic-otf: fonts for Bangla and other Indic scripts'
            'ttf-freebanglafont: miscellaneous fonts for Bangla script')
install="${pkgname%*-git}.install"
source=(
    "${pkgname%*-git}::git+https://github.com/OpenBangla/OpenBangla-Keyboard"
    "git+https://github.com/OpenBangla/riti"
)
sha256sums=('SKIP'
            'SKIP')
pkgver()
{
    cd "$srcdir/${pkgname%*-git}"
    (
        set -o pipefail
        git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

prepare() {
    cd "$srcdir/${pkgname%*-git}"
    git submodule init
    git config submodule."src/engine/riti".url $srcdir/riti
    git submodule update
}

build() {
    cd "$srcdir/${pkgname%*-git}"
    if [[ -d build ]]; then rm -rf build; fi
    mkdir build && cd build
    cmake ..
    make
}
package() {
    cd "$srcdir/${pkgname%*-git}"
    make -C build DESTDIR="$pkgdir" install
}
