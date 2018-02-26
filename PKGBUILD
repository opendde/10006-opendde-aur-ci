# Maintainer: kikadf <kikadf.01@gmail.com>


pkgname=octopi-kde-git
_pkgver=0.8.1
pkgver=0.8.1.1349
pkgrel=1
pkgdesc="This is Octopi, a powerful Pacman frontend using Qt libs (git version for KDE)"
url="https://octopiproject.wordpress.com/"
arch=('x86_64')
license=('GPL2')
depends=('pkgfile' 'knotifications' 'alpm_octopi_utils' 'kdesu' 'qtermwidget')
optdepends=('gist: for SysInfo report'
            'yaourt: for AUR support'
            'pacmanlogviewer: to view pacman log files')
provides=('octopi' 'octopi-git' 'octopi-notifier-frameworks' 'octopi-notifier-qt5'
          'octopi-notifier-noknotify' 'octopi-repoeditor' 'octopi-cachecleaner'
          'octopi-pacmanhelper')
conflicts=('octopi' 'octopi-git' 'octopi-notifier-frameworks' 'octopi-notifier-qt5'
           'octopi-notifier-noknotify' 'octopi-repoeditor' 'octopi-cachecleaner'
           'octopi-pacmanhelper')
makedepends=('git')
source=("${pkgname}::git+https://github.com/aarnt/octopi.git"
        "icons::git+https://github.com/kikadf/octopicons.git")
md5sums=('SKIP'
         'SKIP')

pkgver() {
    cd ${pkgname}
    printf ${_pkgver}".%s" "$(git rev-list --count HEAD)"
}

prepare() {
    cd ${pkgname}

    # enable the kstatus switch to build with Plasma/knotifications support
    sed -e "s|DEFINES += ALPM_BACKEND #KSTATUS|DEFINES += ALPM_BACKEND KSTATUS|" -i notifier/octopi-notifier/octopi-notifier.pro

    # set version
    sed -e "s|0.9.0 (dev)|${_pkgver}.$(git rev-list --count HEAD)-${pkgrel} ($(git rev-parse --short HEAD))|g" -i src/strconstants.cpp

    cp resources/images/octopi_green.png resources/images/octopi.png
}

build() {
    cd ${pkgname}

    msg "Building octopi..."
    qmake-qt5 octopi.pro
    make

    cd notifier/pacmanhelper
    msg "Building pacmanhelper..."
    qmake-qt5 pacmanhelper.pro
    make

    cd ../../notifier/octopi-notifier
    msg "Building octopi-notifier..."
    qmake-qt5 octopi-notifier.pro
    make

    cd ../../repoeditor
    msg "Building octopi-repoeditor..."
    qmake-qt5 octopi-repoeditor.pro
    make

    cd ../cachecleaner
    msg "Building octopi-cachecleaner..."
    qmake-qt5 octopi-cachecleaner.pro
    make
}

package() {
    cd ${pkgname}
    make INSTALL_ROOT=${pkgdir} install

    cd notifier/pacmanhelper
    make INSTALL_ROOT=${pkgdir} install
    cd ../..

    cd notifier/octopi-notifier
    make INSTALL_ROOT=${pkgdir} install
    cd ../..

    cd repoeditor
    make INSTALL_ROOT=${pkgdir} install
    cd ..

    cd cachecleaner
    make INSTALL_ROOT=${pkgdir} install
    cd ..

    # Add some icons to customize notifier
    mkdir -p "${pkgdir}/usr/share/octopi/icons/"
    cp ../icons/*.png "${pkgdir}/usr/share/octopi/icons/"
}
