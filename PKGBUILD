# Maintainer: Plague-doctor <plague <at>> privacyrequired <<dot>> com >

pkgname=vscodium
pkgver=1.28.2
pkgrel=1
pkgdesc="Binary releases of VS Code without MS branding/telemetry/licensing."
arch=('x86_64')
url="https://github.com/VSCodium/vscodium"
license=('MIT')
depends=(
        fontconfig libxtst gtk3 python cairo alsa-lib nss gcc-libs libnotify libxss gconf
        'glibc>=2.28-4'
        )
optdepends=(
        'gvfs: For move to trash functionality'
        'libdbusmenu-glib: For KDE global menu'
)
provides=('code')
conflicts=('visual-studio-code-bin')
source=(
        vscodium.desktop
        ${pkgname}-${pkgver}-${pkgrel}.tar.gz::${url}/releases/download/${pkgver}/VSCode-linux-x64-${pkgver}.tar.gz
       )
noextract=("${pkgname}-${pkgver}-${pkgrel}.tar.gz")

sha256sums=('e4f3503d6c6eb9d967f9d35e58f5f801da98c4ccf7bd31dc752d1cef05781717'
            '454180f01e606380d604b31ad25b659355aa3856238b64fe178f44ec746938df')

prepare() {
    mkdir -p ${srcdir}/vscodium
    tar -xf ${srcdir}/${pkgname}-${pkgver}-${pkgrel}.tar.gz -C ${srcdir}/vscodium
}

package() {
    install -d -m755 ${pkgdir}/usr/bin
    install -d -m755 ${pkgdir}/usr/share/{vscodium,applications,pixmaps}
    cp -r ${srcdir}/${pkgname} ${pkgdir}/usr/share
    ln -s ${pkgdir}/usr/share/${pkgname}/bin/vscodium ${pkgdir}/usr/bin/${pkgname}
    install -D -m644 vscodium.desktop ${pkgdir}/usr/share/applications/vscodium.desktop
    install -D -m644 ${srcdir}/${pkgname}/resources/app/resources/linux/code.png \
            ${pkgdir}/usr/share/pixmaps/vscodium.png
}
