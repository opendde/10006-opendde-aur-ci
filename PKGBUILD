# Maintainer: Filipe Nascimento <flipee at tuta dot io>
# Contributor: louis.seubert.ls@gmail.com <Louis Seubert>

pkgname=plasma5-runners-jetbrains-runner
pkgver=1.4.0
pkgrel=1
pkgdesc="A Krunner Plugin which allows you to open your recent projects"
arch=('x86_64')
url="https://github.com/alex1701c/JetBrainsRunner"
license=('LGPL3')
depends=('krunner')
makedepends=('cmake' 'extra-cmake-modules')
install=$pkgname.install
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/$pkgver/JetBrainsRunnerWithSubmodule.tar.gz")
noextract=("$pkgname-$pkgver.tar.gz")
sha256sums=('ec86427902fdffe12a4330d314dcb417fabe9896e88dcc43e0809fe39ff02704')

prepare() {
    mkdir -p $pkgname-$pkgver
    tar xzf $pkgname-$pkgver.tar.gz -C $pkgname-$pkgver --strip-components 1
    mkdir -p build
}

build() {
    cd build
    cmake ../$pkgname-$pkgver \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release
    make
}

package() {
    cd build
    make DESTDIR="$pkgdir" install
}
