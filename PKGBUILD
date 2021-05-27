# Maintainer: Kirill Goncharov <kdgoncharov at gmail dot com>
pkgname=upstream
_pkgname=radicle-upstream
pkgver=0.2.5
pkgrel=1
pkgdesc='Desktop client for radicle'
arch=('x86_64')
url='https://github.com/radicle-dev/radicle-upstream'
license=('GPL' 'custom')
provides=('upstream')
conflicts=('radicle' 'upstream-bin')
makedepends=('yarn' 'rustup')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/radicle-dev/radicle-upstream/archive/v${pkgver}.tar.gz")
sha256sums=('274580ce52b1f85d7b4d7da1dc43a59d85c8b96cc4486c31c643dc4321b3e3fe')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    HUSKY_SKIP_INSTALL=1 yarn install
    yarn dist
}

package() {
    `${srcdir}/${_pkgname}-${pkgver}/dist/radicle-upstream-${pkgver}.AppImage --appimage-extract &>/dev/null`
    rm -rf "${srcdir}/upstream"
    mv "${srcdir}/squashfs-root" "${srcdir}/upstream"
  
    install -d -m755 "${pkgdir}/opt/"
    cp -a "${srcdir}/upstream/." "${pkgdir}/opt/upstream/"
    find "${pkgdir}/opt/upstream/" -type d -exec chmod 755 {} +
    chmod +rx "${pkgdir}/opt/upstream/radicle-upstream"
  
    install -d "${pkgdir}/usr/bin"
    ln -s "/opt/upstream/radicle-upstream" "${pkgdir}/usr/bin/upstream"
  
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  
    install -Dm644 "${srcdir}/upstream/usr/share/icons/hicolor/0x0/apps/radicle-upstream.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/radicle-upstream.png"
    install -Dm644 "${srcdir}/upstream/radicle-upstream.desktop" "${pkgdir}/usr/share/applications/radicle-upstream.desktop"
    sed -e "s/AppRun/upstream/g" -i "${pkgdir}/usr/share/applications/radicle-upstream.desktop"
}

