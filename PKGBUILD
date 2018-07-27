# Maintainer: Philip Goto <philip.goto@gmail.com>
pkgname=mato-icons-git
pkgver=latest
pkgrel=1
pkgdesc="Mato is a Material Design inspired icon theme for Linux. It features simple and modern icons based on the official icons."
arch=('any')
url="https://flipflop97.github.io/Mato/"
license=('Creative Commons Attribution-ShareAlike 4.0 International Public License')
makedepends=('git')
provides=('mato-icons')
conflicts=('mato-icons')
source=("${pkgname}::git+https://github.com/flipflop97/Mato.git")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    install -dm 755 "${pkgdir}"/usr/share/icons/Mato
    cp -dr --no-preserve='ownership' "${pkgname}"/* "${pkgdir}"/usr/share/icons/Mato
}
