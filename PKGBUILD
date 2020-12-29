# Maintainer: Michał Walenciak <kicer86@gmail.com>
pkgname=photobroom-git
pkgver=v1.4.0.r220.g74cba5405
pkgrel=1
pkgdesc="Photos managing tool"
arch=('i686' 'x86_64')
url="https://github.com/Kicer86/photobroom"
license=('GPL3')
groups=()
depends=('openlibrary' 'qt5-base')
makedepends=('cmake' 'exiv2' 'openlibrary' 'qt5-tools' 'dlib')
optdepends=()
provides=('photobroom')
conflicts=('photobroom')
replaces=()
backup=()
options=()
install=
changelog=
source=(git+https://github.com/Kicer86/photobroom.git#branch=master
        cmake_modules::git+https://github.com/Kicer86/cmake_modules.git#commit=74a2986c6cd1f46b1ec1a2a3c7740e53a299bbef
        kwidgetsaddons::git+https://invent.kde.org/frameworks/kwidgetsaddons.git#commit=a2adad286075e4033bbba14ce0a3798a256622ac
        face_recognition_models::git+https://github.com/ageitgey/face_recognition_models.git#commit=e67de717267507d1e9246de95692eb8be736ab61
        github_api::git+https://github.com/Kicer86/github_api.git#commit=61267f15d558819bab7218c353a03d0d449774f9
)
noextract=()
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
)

pkgver() {
  cd "$pkgname"
  git describe --tags --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare()
{
    rm -d $pkgname/cmake_modules
    rm -d $pkgname/external/kwidgetsaddons
    rm -d $pkgname/src/face_recognition/dlib_wrapper/face_recognition_models
    rm -d $pkgname/src/updater/github_api
    ln -s ../cmake_modules $pkgname/cmake_modules
    ln -s ../../kwidgetsaddons $pkgname/external/kwidgetsaddons
    ln -s ../../../github_api $pkgname/src/updater/github_api
    ln -s ../../../../face_recognition_models $pkgname/src/face_recognition/dlib_wrapper/face_recognition_models
}

build()
{
    cd "$pkgname"
    mkdir -p build
    cd build
    cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_TESTING=OFF -DBUILD_UPDATER=OFF
    make
}

package()
{
    cd "$pkgname"
    cd build
    make DESTDIR="$pkgdir/" install
}
