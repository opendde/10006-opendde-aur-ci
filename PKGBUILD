# Maintainer: Johannes Wienke <languitar@semipol.de>

pkgname='rsb-cpp'
pkgver=0.14.2.bd9c803
pkgrel=1
pkgdesc='Robotics Service Bus C++ implementation'
arch=('i686' 'x86_64')
url='https://projects.cor-lab.org/projects/rsb'
license=('LGPL3')
depends=('rsc' 'boost' 'protobuf')
makedepends=('git' 'cmake' 'rsb-proto')
checkdepends=('python2')
source=("rsb-cpp::git+https://code.cor-lab.org/git/rsb.git.cpp#branch=0.14")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/rsb-cpp"
    printf "%s" "$(git describe --long | sed 's/release-//;s/\([^-]*-\)g/\1/;s/-/./g')"
}

check() {
    cd "${srcdir}/rsb-cpp/build"
    make test
}

build() {
    cd "${srcdir}/rsb-cpp"
    mkdir -p build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=/usr ..
    make
}

package() {
    cd "${srcdir}/rsb-cpp/build"
    make DESTDIR="${pkgdir}/" install
}
