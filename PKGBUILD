# Maintainer: Kartik Mohta <kartikmohta@gmail.com>

pkgname=('python-rosdep')
pkgver='0.20.0'
pkgrel=1
pkgdesc='rosdep package manager abstraction tool for ROS'
arch=('any')
url='https://github.com/ros-infrastructure/rosdep'
license=('BSD')
depends=('python' 'python-catkin_pkg' 'python-rosdistro' 'python-rospkg' 'python-yaml')
makedepends=('python-setuptools')

conflicts=('python2-rosdep')
source=("https://github.com/ros-infrastructure/rosdep/archive/${pkgver}.tar.gz")
sha256sums=('ea46ec9019ed9f9dc78849f0896b8cbacedaee545e4dd092b2794b4fb4e15bc3')

_module='rosdep'

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
