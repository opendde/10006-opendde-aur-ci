# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Interface for enforcing joint limits."
url='https://github.com/ros-controls/ros_control/wiki'

pkgname='ros-lunar-joint-limits-interface'
pkgver='0.12.0'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-lunar-urdf
  ros-lunar-catkin
  ros-lunar-roscpp
  ros-lunar-hardware-interface)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  urdfdom)

ros_depends=(ros-lunar-urdf
  ros-lunar-roscpp
  ros-lunar-hardware-interface)
depends=(${ros_depends[@]}
  urdfdom)

# Git version (e.g. for debugging)
# _tag=release/lunar/joint_limits_interface/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/ros_control-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="ros_control-release-release-lunar-joint_limits_interface-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/ros_control-release/archive/release/lunar/joint_limits_interface/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('e0b168b8e8d281021b9bfc66c6e94578e495a88bc12f92f62a45cfad15ccb7ac')

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/lunar/setup.bash ] && source /opt/ros/lunar/setup.bash

  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  # Fix Python2/Python3 conflicts
  /usr/share/ros-build-tools/fix-python-scripts.sh -v 2 ${srcdir}/${_dir}

  # Build project
  cmake ${srcdir}/${_dir} \
        -DCMAKE_BUILD_TYPE=Release \
        -DCATKIN_BUILD_BINARY_PACKAGE=ON \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/lunar \
        -DPYTHON_EXECUTABLE=/usr/bin/python2 \
        -DPYTHON_INCLUDE_DIR=/usr/include/python2.7 \
        -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so \
        -DPYTHON_BASENAME=-python2.7 \
        -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
