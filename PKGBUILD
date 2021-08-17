# Maintainer: Tommy Hudson <thomhuds@protonmail.com>
# Contributor: Sergey A. <murlakatamenka@disroot.org>
# based off `corectrl` PKGBUILD by Sergey Kostyuchenko <derfenix@gmail.com>

_pkgname=corectrl
pkgname=${_pkgname}-nofan-git
pkgver=1.0.3.r174.g5ab63d3
pkgrel=1
pkgdesc="Application to control your hardware with ease using application profiles"
url="https://gitlab.com/corectrl/corectrl"
license=(GPL3)
arch=(i686 x86_64)
depends=('botan>=2.2.0' 'qt5-base>=5.9' qt5-quickcontrols2 qt5-charts qt5-svg qt5-xmlpatterns kauth karchive procps-ng hwids)
makedepends=(git 'cmake>=3.3' extra-cmake-modules 'gcc>=8' qt5-tools)
optdepends=(
    'vulkan-tools: for vulkaninfo'
    'mesa-demos: for glxinfo'
    'util-linux: for lscpu'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git" "dont-mess-with-fans.patch")
md5sums=('SKIP' '990ff598ac4d837c4cd2f4213d164730')

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$srcdir/$_pkgname"
    patch --forward --strip=1 --input="${srcdir}/dont-mess-with-fans.patch"
}

build() {
  cd "$srcdir/$_pkgname"
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX="$pkgdir/usr/" -DCMAKE_BUILD_TYPE=Release -DBUILD_TESTING=OFF ..
  make ${MAKEFLAGS}
}

package() {
  cd "$srcdir/$_pkgname/build"
  sed -i -- 's/\/usr/${CMAKE_INSTALL_PREFIX}/g' src/helper/cmake_install.cmake
  make install
}
