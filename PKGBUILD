# Maintainer: Sammay Sarkar <(my-name-without-vowels)@gmail.com>
pkgname="openbangla-keyboard-git"
pkgver=1.5.1.r77.ga289143
pkgrel=1
pkgdesc="An OpenSource, Unicode compliant Bengali Input Method"
arch=('x86_64')
url="http://openbangla.github.io"
license=('GPL3')
depends=('ibus' 'qt5-base')
makedepends=('cmake')
optdepends=('ttf-indic-otf: fonts for Bangla and other Indic scripts'
            'ttf-freebanglafont: miscellaneous fonts for Bangla script')
install="${pkgname%*-git}.install"
source=(
    "${pkgname%*-git}::git+https://github.com/OpenBangla/OpenBangla-Keyboard"
    "git+https://github.com/OpenBangla/riti"
)
sha256sums=('SKIP' 'SKIP')
pkgver()
{
    cd "$srcdir/${pkgname%*-git}"
    (
        set -o pipefail
        git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
    pkgrel=$(git diff --shortstat|cut -d' ' -f2)
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
