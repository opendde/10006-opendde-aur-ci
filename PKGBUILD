# Maintainer: Elijah Gregg <lovetocode999 at tilde dot team>
# Contributor: Lenny McLennington <lennymclennington@protonmail.com>
# Contributor: Sefa Eyeoglu <contact@scrumplex.net>
# Contributor: Miko <mikoxyzzz@gmail.com>
# Contributor: Cheru Berhanu <aur attt cheru doot dev>

_pkgname=polymc
pkgname=${_pkgname}-git
pkgver=1.3.1.r299.gc5625d8d
pkgrel=2
pkgdesc="Minecraft launcher with ability to manage multiple instances."
arch=('i686' 'x86_64')
url="https://github.com/PolyMC/PolyMC"
license=('GPL3')
depends=('java-runtime' 'libgl' 'qt6-base' 'qt6-5compat' 'qt6-svg' 'qt6-imageformats' 'zlib' 'hicolor-icon-theme')
provides=('polymc')
conflicts=('polymc')
makedepends=('cmake' 'extra-cmake-modules' 'git' 'java-environment' 'scdoc')
optdepends=('glfw: to use system GLFW libraries'
            'openal: to use system OpenAL libraries'
            'visualvm: Profiling support'
            'xorg-xrandr: for older minecraft versions'
)
source=("git+https://github.com/PolyMC/PolyMC"
        "git+https://github.com/PolyMC/libnbtplusplus"
        "git+https://github.com/stachenov/quazip")

sha256sums=('SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd "PolyMC"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "PolyMC"
  git submodule init
  git config submodule.libnbtplusplus.url "${srcdir}/libnbtplusplus"
  git config submodule.quazip.url "${srcdir}/quazip"
  git submodule update
}

build() {

  cmake -DCMAKE_BUILD_TYPE= \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DLauncher_APP_BINARY_NAME="${_pkgname}" \
    -DLauncher_QT_VERSION_MAJOR="6" \
    -Bbuild -SPolyMC
  cmake --build build
}

check() {
  cd "build"
  ctest .
}

package() {
  cd "build"
  DESTDIR="$pkgdir" cmake --install .
}

