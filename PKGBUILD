# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - effort_controllers."
url='https://github.com/ros-controls/ros_controllers/wiki'

pkgname='ros-kinetic-effort-controllers'
pkgver='0.13.0'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-kinetic-forward-command-controller
  ros-kinetic-realtime-tools
  ros-kinetic-urdf
  ros-kinetic-control-toolbox
  ros-kinetic-control-msgs
  ros-kinetic-controller-interface
  ros-kinetic-angles
  ros-kinetic-catkin)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-kinetic-forward-command-controller
  ros-kinetic-realtime-tools
  ros-kinetic-urdf
  ros-kinetic-control-toolbox
  ros-kinetic-control-msgs
  ros-kinetic-controller-interface
  ros-kinetic-angles)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/kinetic/effort_controllers/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/ros_controllers-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="ros_controllers-release-release-kinetic-effort_controllers-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/ros_controllers-release/archive/release/kinetic/effort_controllers/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('a1c68d5b80867b539da67339c555326a0818adee3198083ad9c39e94523be74a')

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/kinetic/setup.bash ] && source /opt/ros/kinetic/setup.bash

  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  # Fix Python2/Python3 conflicts
  /usr/share/ros-build-tools/fix-python-scripts.sh -v 2 ${srcdir}/${_dir}

  # Build project
  cmake ${srcdir}/${_dir} \
        -DCMAKE_BUILD_TYPE=Release \
        -DCATKIN_BUILD_BINARY_PACKAGE=ON \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/kinetic \
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
