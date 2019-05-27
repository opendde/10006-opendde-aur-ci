# Maintainer: Robosky <fangyuhao0612@gmail.com>

pkgname=mcmojave-circle-icon-theme-git
_gitname=McMojave-circle
pkgver=21.47b3420
pkgrel=1
pkgdesc="MacOSX Mojave like circle icon theme for linux desktops."
arch=('any')
depends=('gtk-update-icon-cache')
makedepends=('git')
optdepends=('mojave-gtk-theme-git: Recommended GTK theme.')
license=('GPL3')
url="https://github.com/vinceliuice/${_gitname}"
source=("git+${url}")
md5sums=('SKIP')
options=('!strip')

pkgver() {
    cd "${srcdir}/${_gitname}"
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
    cd "${srcdir}/${_gitname}"
    install -dm755 "${pkgdir}/usr/share/icons"
    ./install.sh -d "${pkgdir}/usr/share/icons"
}