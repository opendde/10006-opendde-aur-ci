# Maintainer: Philip Goto <philip.goto@gmail.com>
pkgname=webman-git
pkgver=latest
pkgrel=2
pkgdesc="A web interface for the Arch Linux package manager (pacman)"
arch=('any')
url="https://github.com/flipflop97/WebMan"
license=('GPL-3.0')
depends=('python'
         'python-flask'
         'python-urllib3'
         'python-certifi'
         'python-beautifulsoup4'
         'python-editdistance')
provides=('webman')
source=("${pkgname}::git+https://github.com/flipflop97/WebMan.git")
sha256sums=('SKIP')

package() {
    cd "${pkgname}"
    install -dm 755 "${pkgdir}/usr/lib/webman"
    cp -dr --no-preserve=ownership . "${pkgdir}/usr/lib/webman"
    cd ../..
    install -dm 755 "${pkgdir}/usr/bin"
    install -Tm 755 run "${pkgdir}/usr/bin/webman"
    install -dm 755 "${pkgdir}/usr/share/applications"
    install -m 755 webman.desktop "${pkgdir}/usr/share/applications"
    install -dm 755 "${pkgdir}/usr/share/icons/hicolor/256x256/apps"
    install -m 755 webman.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps"
}
