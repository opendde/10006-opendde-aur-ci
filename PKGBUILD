# Maintainer: German Lashevich <german.lashevich@gmail.com>
# Contributor: Orestis Floros <orestisf1993@gmail.com>
# Contributor: Doron Behar <doron.behar@gmail.com>

_repo_name=xkb-switch-i3

pkgname=xkb-switch-i3-git
pkgver=1.6.0.r7.g69fe11f
pkgrel=1
pkgdesc='Program that allows to query and change the XKB layout state (with i3wm auto-switch mode)'
conflicts=('xkb-switch')
provides=('xkb-switch')
arch=('i686' 'x86_64')
url="https://github.com/zebradil/${_repo_name}"
license=('GPL3')
depends=('libx11' 'libxkbfile')
makedepends=('git' 'cmake')
source=(
    "git+https://github.com/zebradil/${_repo_name}.git#branch=master"
    "git+https://github.com/drmgc/i3ipcpp.git"
)
sha1sums=(
    'SKIP'
    'SKIP'
)

pkgver() {
    cd "${_repo_name}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${_repo_name}"
    git submodule init
    git config "submodule.i3ipc++.url" "${srcdir}/i3ipcpp"
    git submodule update

    cmake -DCMAKE_INSTALL_PREFIX=/usr .
    make
}

package() {
    cd "${srcdir}/${_repo_name}"
    make DESTDIR="$pkgdir/" install
}
