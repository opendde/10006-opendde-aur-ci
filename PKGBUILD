# Maintainer: Syaoran Code <syaorancode@gmail.com>
pkgname=st-syaoran-git
_dir=st-syaoran
pkgver=0.8.2.r31.1e1b3e6
pkgrel=1
pkgdesc="This is my st (suckless/simple terminal) build."
arch=(x86_64 i686)
url="https://github.com/justanoobcoder/st-syaoran.git"
license=('MIT')
groups=()
depends=(libxft-bgra)
makedepends=(make ncurses libxext git)
checkdepends=()
optdepends=(dmenu picom)
provides=(st)
conflicts=(st)
replaces=()
backup=()
options=()
source=("git+$url")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
    cd "${_dir}"
    printf "%s.r%s.%s" "$(awk '/^VERSION =/ {print $3}' config.mk)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${_dir}"
    make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
    cd "${_dir}"
    mkdir -p ${pkgdir}/opt/${pkgname}
    cp -rf * ${pkgdir}/opt/${pkgname}
    make PREFIX=/usr DESTDIR="${pkgdir}" install
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_dir}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${_dir}/README.md"
}

