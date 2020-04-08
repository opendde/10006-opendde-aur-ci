# Maintainer: Diab Neiroukh <officiallazerl0rd@gmail.com>

pkgname=krayan-gtk-theme-git
_reponame='Krayan'
pkgver=0.0.0.cf5e1e6
pkgrel=2
pkgdesc='A darker and more modern twist on the Layan GTK Theme.'
arch=("any")
provides=("krayan-gtk-theme")
conflicts=("krayan-gtk-theme")
url="https://github.com/lazerl0rd/${_reponame}"
license=("GPL2")
optdepends=(
        "gtk-engine-murrine"
        "gtk-engines"
)
makedepends=("git")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver(){
    cd "${srcdir}/${_reponame}"
    if [ $(git tag|wc -l) == 0 ]; then
        echo "0.0.0.$(git log -1 --format='%h')"
    else
        git describe --tags | sed 's/-/.r/; s/-g/./'
    fi
}

package() {
    dst="${pkgdir}/usr/share/themes"
    mkdir -p "${dst}"
    cd "${srcdir}/${_reponame}"
    ./install.sh -d "${dst}"
}
