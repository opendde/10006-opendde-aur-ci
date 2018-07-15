# Maintainer: Helder Bertoldo <helder.bertoldo@gmail.com>

pkgname=newaita-icons-git
_gitname=Newaita
pkgver=latest
pkgrel=1
pkgdesc="Newaita icon theme is a Linux icon theme combining old style and color of material design. If you urgently needed any icon, please write in the comments on the page https://store.kde.org/p/1243493/ If you want support me Paypal: ghostdmn2@gmail.com"
arch=('i686' 'x86_64')
url="https://github.com/cbrnix/${_gitname}"
license=('CC BY-NC-SA 3.0')
makedepends=('git')
options=('!strip')
conflicts=(${_gitname})
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver(){
    cd ${_gitname}
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    install -d ${pkgdir}/usr/share/icons
    cp -r ${srcdir}/${_gitname}* ${pkgdir}/usr/share/icons/
    find ${pkgdir}/usr -type f -exec chmod 644 {} \;
    find ${pkgdir}/usr -type d -exec chmod 755 {} \;
}
