# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - This is a set of tools for recording from and playing back ROS message without relying on the ROS client library."
url='http://www.ros.org/'

pkgname='ros-melodic-rosbag-storage'
pkgver='1.13.6'
_pkgver_patch=2
arch=('any')
pkgrel=3
license=('BSD')

ros_makedepends=(ros-melodic-roscpp-traits
  ros-melodic-cpp-common
  ros-melodic-roscpp-serialization
  ros-melodic-catkin
  ros-melodic-roslz4
  ros-melodic-rostime)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  bzip2
  boost
  console-bridge)

ros_depends=(ros-melodic-roscpp-traits
  ros-melodic-cpp-common
  ros-melodic-roscpp-serialization
  ros-melodic-roslz4
  ros-melodic-rostime)
depends=(${ros_depends[@]}
  bzip2
  boost
  console-bridge)

# Git version (e.g. for debugging)
# _tag=release/melodic/rosbag_storage/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/ros_comm-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="ros_comm-release-release-melodic-rosbag_storage-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/ros_comm-release/archive/release/melodic/rosbag_storage/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('a987dbc57e766412c0e0db4b31597d733f53ca60ee570fb7f9489c2d1d3d7c3e')

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/melodic/setup.bash ] && source /opt/ros/melodic/setup.bash

  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  # Fix Python2/Python3 conflicts
  /usr/share/ros-build-tools/fix-python-scripts.sh -v 2 ${srcdir}/${_dir}

  # Build project
  cmake ${srcdir}/${_dir} \
        -DCMAKE_BUILD_TYPE=Release \
        -DCATKIN_BUILD_BINARY_PACKAGE=ON \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/melodic \
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
