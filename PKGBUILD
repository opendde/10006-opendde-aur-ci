# Maintainer: Proton Technologies AG <opensource at proton dot me>
# Maintainer: Alexandru Cheltutior <acrandom at pm dot me>
pkgname=protonvpn-gui
_gitpkgname=linux-app
pkgver=1.5.1
pkgrel=1
pkgdesc="Official ProtonVPN Graphical User Interface, maintained by the ProtonVPN team."
arch=("any")
url="https://github.com/ProtonVPN/"
license=("GPL3")
groups=("ProtonVPN")
depends=("python-protonvpn-nm-lib" "python-gobject" "python-psutil" "gtk3" "python-cairo" "webkit2gtk")
optdepends=("libappindicator-gtk3")
makedepends=("python-setuptools")
source=("https://github.com/ProtonVPN/linux-app/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('ee32bfbd19b2f42d1f82a2140c69a163976e73a5b8aea5c1d9a9607c437af4e9')
validpgpkeys=("A884 41BD 4864 F95B EE08  E63A 71EB 4740 1994 0E11")

build() {
    cd "$_gitpkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$_gitpkgname-$pkgver"
    install -d -m755 "${pkgdir}/usr/share/applications"
    install -d -m755 "${pkgdir}/usr/share/icons/hicolor/scalable/apps/"

    cp protonvpn.desktop "${pkgdir}/usr/share/applications/protonvpn.desktop"
    cp ./protonvpn_gui/assets/icons/protonvpn-logo.png "${pkgdir}/usr/share/icons/hicolor/scalable/apps/"
    
    python setup.py install --root="$pkgdir" --optimize=1
}
