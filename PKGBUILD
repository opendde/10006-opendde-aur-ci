# Maintainer: desbma
# shellcheck disable=SC2034,SC2148,SC2154,SC2164
pkgname=pacdiff-pacman-hook-git
pkgver=r45.647f466
pkgrel=1
pkgdesc='Pacman hook to run pacdiff automatically'
arch=('x86_64')
_gitname='pacman-hooks'
url="https://github.com/desbma/${_gitname}"
license=('GPL')
depends=('git' 'pacman-contrib')
conflicts=('pacman-hooks-desbma-git')
source=("git+https://github.com/desbma/${_gitname}")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_gitname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/${_gitname}"
    install -Dm 644 -t "${pkgdir}/usr/share/libalpm/hooks" pacdiff/pacdiff.hook
    install -Dm 755 -t "${pkgdir}/usr/share/libalpm/scripts" pacdiff/pacdiff_diffprog
}
