# Generated by debtap
# Maintainer: e-search
# Contributor: e-search
pkgname=e-search
pkgver=1.3.2
pkgrel=1
pkgdesc="识屏 · 搜索"
arch=('x86_64')
url="https://xushengfeng.github.io/eSearch-website/"
license=('GPL3')
groups=('')
depends=('at-spi2-core' 'clion' 'desktop-file-utils' 'glib2' 'gtk3' 'hicolor-icon-theme' 'kde-cli-tools' 'libdrm' 'libnotify' 'libxcb' 'libxtst' 'mesa' 'metasploit' 'trash-cli' 'xdg-utils')
optdepends=('alsa-lib'
            'apparmor'
            'gir1.2-gnomekeyring-1.0'
            'libgnome-keyring'
            'pulseaudio')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source=("https://download.fastgit.org/xushengfeng/eSearch/releases/download/${pkgver}/e-search_${pkgver}_amd64.deb")
sha512sums=('a71d774440bcfd431bb2c7162c6ea5a4cfc123c4b4f92b981a3e1509c3278a775fe3c4c6aeefb10365d38d6c1cb0014ae55920c9d0e8ba9b91be22c6a0af04a0')

package(){

	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"

	install -D -m644 "${pkgdir}/usr/lib/${pkgname}/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
