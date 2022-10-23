# To disable Qt6, set USE_QT6 variable to OFF. For example:
# USE_QT6=OFF makepkg -si

pkgbase=qbittorrent-enhanced-ua
pkgname=(qbittorrent-enhanced-ua qbittorrent-enhanced-ua-nox)
pkgver=4.4.5.10
pkgrel=2
pkgdesc="An advanced BitTorrent client programmed in C++, based on Qt toolkit and libtorrent-rasterbar. (Enhanced Edition with original user-agent)"
arch=('x86_64')
_repo="qBittorrent-Enhanced-Edition"
url="https://github.com/c0re100/${_repo}"
license=('custom' 'GPL')
depends=('libtorrent-rasterbar')
makedepends=('cmake' 'boost')
optdepends=('python: needed for torrent search tab')

_rel="release-${pkgver}"
_snapshot="${_repo}-${_rel}"

source=(
    "${_snapshot}.tar.gz::${url}/archive/${_rel}.tar.gz"
    "revert-ua.patch"
)

sha256sums=(
    'f81c5a7d90c1f9357d95e4189f81cfa515955a38855b1ea0e949334f02b5e9bb'
    'e8f69fca45a230e6c704eb5ef1ae6bae3500879f86e2ed06931053966e11fccf'
)

USE_QT6="${USE_QT6:-ON}"

if [ "${USE_QT6}" = "ON" ]; then
    depends+=('qt6-base')
    _gdeps=('qt6-svg')
    makedepends+=('qt6-svg' 'qt6-tools')
else
    depends+=('qt5-base')
    _gdeps=('qt5-svg')
    makedepends+=('qt5-svg' 'qt5-tools')
fi

prepare() {
    cd "${srcdir}/${_snapshot}"
    patch -p0 -Z -i "${srcdir}/${source[1]}"
}

build() {
    cd "${srcdir}"

    cmake -B "build" "${_snapshot}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DQT6="${USE_QT6}"

    cmake --build "build"

    cmake -B "build-nox" "${_snapshot}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DQT6="${USE_QT6}" \
        -DGUI=OFF \
        -DSYSTEMD=ON

    cmake --build "build-nox"
}

package_qbittorrent-enhanced-ua() {
    depends+=("${_gdeps[@]}" 'hicolor-icon-theme')
    provides=('qbittorrent')
    conflicts=('qbittorrent')

    cd "${srcdir}"
    DESTDIR="${pkgdir}" cmake --install "build"

    cd "${_snapshot}"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "COPYING"
}

package_qbittorrent-enhanced-ua-nox() {
    provides=('qbittorrent-nox')
    conflicts=('qbittorrent-nox')

    cd "${srcdir}"
    DESTDIR="${pkgdir}" cmake --install "build-nox"

    cd "${_snapshot}"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "COPYING"
}
