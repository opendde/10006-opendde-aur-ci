# Maintainer: Martin Kostolný <clearmartin at zoho dot com>
# Contributor: Zdravko Yanakiev <zdravko.yanakiev at gmail dot com>

pkgname=plasma5-applets-redshift-control-git
_pkgname=plasma5-applets-redshift-control
_gitpkgname=plasma-redshift-control
pkgver=r23.28481b6
pkgrel=1
epoch=1
pkgdesc="Plasmoid for Plasma 5 for controlling redshift."
arch=('any')
url="git://anongit.kde.org/plasma-redshift-control"
license=('GPL')
depends=('plasma-workspace' 'qt5-graphicaleffects' 'redshift')
makedepends=('git' 'extra-cmake-modules')
conflicts=("${_pkgname-*}")
provides=("${_pkgname-*}")
source=("git+git://anongit.kde.org/${_gitpkgname}")
md5sums=('SKIP')

pkgver() {
    cd "${_gitpkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${_gitpkgname}"

    mkdir -p build
    cd build
    rm -rf *

    cmake .. \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DKDE_INSTALL_LIBDIR=lib \
        -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
}

package() {
    cd "${_gitpkgname}"/build
    make install DESTDIR="${pkgdir}"
}
