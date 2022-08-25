# Maintainer: Marie Piontek <marie@kaifa.ch>

pkgname=an-anime-game-launcher-gtk-bin
pkgver=1.0.3
pkgrel=1
pkgdesc="An GTK4 alternative to an-anime-game-launcher-bin"
url="https://gitlab.com/an-anime-team/alternatives/an-anime-game-launcher-gtk"
conflicts=("an-anime-game-launcher-bin" "an-anime-game-launcher")
provides=("an-anime-game-launcher")
arch=("x86_64")
license=("GPL3")

depends=(
    "libadwaita"
    "tar"
    "unzip"
    "xdelta3"
    "cabextract"
    "git"
    "curl"
    "iputils"
    "gtk4"
    "glibc"
)

optdepends=(
    "mangohud: FPS Hud/GUI"
    "gamemode: Game Optimizations"
    "gamescope: a tool from Valve that allows for games to run in an isolated Xwayland instance"
)

source=(
    "an-anime-game-launcher_${pkgver}::https://gitlab.com/an-anime-team/alternatives/an-anime-game-launcher-gtk/uploads/1fc10d8d200ef1bcdb6d03612fb95db4/anime-game-launcher"
    "icon.png"
    "an-anime-game-launcher.desktop"
)

md5sums=(
    '2f1c9695025dc3dd1de6271dacc12579'
    'c1a5499b80a55d3d238ef5c5d2c93c99'
    '12d89b3be2072437e7b252af97274142'
)

prepare() {
    chmod +x "${srcdir}/an-anime-game-launcher_${pkgver}"
}

package() {
    install -dm755 "${pkgdir}/usr/lib/${pkgname}"
    install -dm755 "${pkgdir}/usr/bin/"
    cp an-anime-game-launcher_${pkgver} "${pkgdir}/usr/lib/${pkgname}/"

    install -Dm644 "${srcdir}/icon.png" "${pkgdir}/usr/share/pixmaps/an-anime-game-launcher.png"
    ln -s "/usr/lib/${pkgname}/an-anime-game-launcher_${pkgver}" "${pkgdir}/usr/bin/an-anime-game-launcher"
    install -Dm644 "${srcdir}/an-anime-game-launcher.desktop" -t "${pkgdir}/usr/share/applications"
}

