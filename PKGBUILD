# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Provides teleoperation using joysticks or keyboard."
url='http://ros.org/wiki/turtlebot_teleop'

pkgname='ros-indigo-turtlebot-teleop'
pkgver='2.3.13'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-indigo-joy
  ros-indigo-catkin
  ros-indigo-roscpp
  ros-indigo-geometry-msgs)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-indigo-roscpp
  ros-indigo-geometry-msgs
  ros-indigo-yocs-velocity-smoother
  ros-indigo-kobuki-safety-controller
  ros-indigo-turtlebot-bringup
  ros-indigo-joy)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/indigo/turtlebot_teleop/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/turtlebot-release/turtlebot-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="turtlebot-release-release-indigo-turtlebot_teleop-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/turtlebot-release/turtlebot-release/archive/release/indigo/turtlebot_teleop/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('efcfbb9cf2ecd36d6cba7bd88ca77918958814d0e5035fbcc798fafa35fa5eda')

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/indigo/setup.bash ] && source /opt/ros/indigo/setup.bash

  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  # Fix Python2/Python3 conflicts
  /usr/share/ros-build-tools/fix-python-scripts.sh -v 2 ${srcdir}/${_dir}

  # Build project
  cmake ${srcdir}/${_dir} \
        -DCMAKE_BUILD_TYPE=Release \
        -DCATKIN_BUILD_BINARY_PACKAGE=ON \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/indigo \
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
