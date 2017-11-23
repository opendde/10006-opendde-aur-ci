# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - navfn provides a fast interpolated navigation function that can be used to create plans for a mobile base."
url='http://wiki.ros.org/navfn'

pkgname='ros-kinetic-navfn'
pkgver='1.14.2'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-kinetic-nav-core
  ros-kinetic-pcl-ros
  ros-kinetic-roscpp
  ros-kinetic-geometry-msgs
  ros-kinetic-costmap-2d
  ros-kinetic-rosconsole
  ros-kinetic-pcl-conversions
  ros-kinetic-visualization-msgs
  ros-kinetic-catkin
  ros-kinetic-cmake-modules
  ros-kinetic-tf
  ros-kinetic-nav-msgs
  ros-kinetic-pluginlib)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  netpbm)

ros_depends=(ros-kinetic-nav-core
  ros-kinetic-pcl-ros
  ros-kinetic-roscpp
  ros-kinetic-geometry-msgs
  ros-kinetic-costmap-2d
  ros-kinetic-rosconsole
  ros-kinetic-pcl-conversions
  ros-kinetic-visualization-msgs
  ros-kinetic-tf
  ros-kinetic-nav-msgs
  ros-kinetic-pluginlib)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/kinetic/navfn/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/navigation-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="navigation-release-release-kinetic-navfn-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/navigation-release/archive/release/kinetic/navfn/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('6969f151019893d7f1fcdbb91a0f393bd80d1f33af5013f2639a18c41d7a4a5d')

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
