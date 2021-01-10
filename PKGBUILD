# Maintainer: acxz <akashpatel2008 at yahoo dot com>
# Contributor: Sven Schneider <archlinux.sandmann@googlemail.com>

pkgname=orocos-kdl-python-git
pkgver=r1039.79adc6f
pkgrel=1
pkgdesc="The Kinematics and Dynamics Library is a framework for modelling and computation of kinematic chains (Python binding)"
arch=('i686' 'x86_64')
url="https://www.orocos.org/kdl"
license=('GPL')
depends=(orocos-kdl python-psutil python-future pybind11)
makedepends=(cmake git)
provides=(orocos-kdl-python)
conflicts=(orocos-kdl-python)
source=(git+https://github.com/orocos/orocos_kinematics_dynamics)
sha256sums=('SKIP')

_dir=orocos_kinematics_dynamics
_pkgname=python_orocos_kdl

pkgver() {
  cd "${srcdir}/${_dir}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${_dir}"
  git submodule update --init --recursive
}

build() {
  cd "${srcdir}/${_dir}/${_pkgname}"

  mkdir -p build && cd build

  cmake -DCMAKE_INSTALL_PREFIX=/usr ..

  make
}

package() {
  cd "${srcdir}/${_dir}/${_pkgname}/build"
  make DESTDIR="${pkgdir}" install
}
