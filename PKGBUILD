# Maintainer: Nemo <archlinux at captnemo dot in>

# PRs are welcome at: https://github.com/captn3m0/aur-pop-bin

pkgname=pop-bin
pkgver=8.0.8
pkgrel=1
pkgdesc="Low latency videoconferencing & screen sharing with multiplayer drawing & control. Pop is a multiplayer screen sharing app that lets you work together like you’re in the same room."
arch=('x86_64')
url="https://pop.com"
depends=('alsa-lib' 'atk' 'at-spi2-atk' 'at-spi2-core' 'cairo' 'dbus' 'desktop-file-utils' 'expat' 'gcc-libs' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'hicolor-icon-theme'  'libcups' 'libnotify' 'libutil-linux' 'libx11' 'libxcb' 'libxcomposite' 'libxcursor' 'libxdamage' 'libxext' 'libxfixes' 'libxi' 'libxrandr' 'libxrender' 'libxss' 'libxtst' 'nspr' 'nss' 'pango'  'xpra')
optdepends=('apparmor'
            'libgnome-keyring'
            'pulseaudio'
            'kde-cli-tools'
            'trash-cli'
            'xdg-utils'
            'libappindicator-gtk3')
license=('custom')
options=('!strip' '!emptydirs')
replaces=('screen-desktop-bin')
conflicts=('screen-desktop-bin')
source=("https://download.pop.com/desktop-app/linux/${pkgver}/pop_${pkgver}_amd64.deb")
sha512sums=('35b94f4eaceb08f62cd4f76c1bac90fb7f53b48e50eb0e5f40d9e42f73a6ecccdf97b3c5363baa7eace214f81790cc1aa1cdfa039b788f64b0557cdefcf59192')

package(){
    mkdir -p "${pkgdir}/opt/${pkgname}"
    tar xf data.tar.xz
    cp -r usr/lib/pop/* "${pkgdir}/opt/${pkgname}"

    install -dm755 "$pkgdir"/usr/bin
    ln -s /opt/"$pkgname"/Pop "$pkgdir/usr/bin/pop"

    install -D -m644 "usr/share/applications/pop.desktop" "${pkgdir}/usr/share/applications/pop.desktop"
    install -D -m644 "usr/share/pixmaps/pop.png" "${pkgdir}/usr/share/pixmaps/pop.png"
    install -D -m644 "usr/share/doc/pop/copyright" "${pkgdir}/usr/share/doc/${pkgname}/COPYRIGHT"
    install -D -m644 "usr/lib/pop/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/chromium.LICENSE"
}
