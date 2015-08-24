# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - gazebo_ros_control."
url='http://ros.org/wiki/gazebo_ros_control'

pkgname='ros-indigo-gazebo-ros-control'
pkgver='2.4.9'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-indigo-roscpp
  ros-indigo-std-msgs
  ros-indigo-hardware-interface
  ros-indigo-control-toolbox
  ros-indigo-angles
  ros-indigo-catkin
  ros-indigo-controller-manager
  ros-indigo-joint-limits-interface
  ros-indigo-transmission-interface
  ros-indigo-urdf
  ros-indigo-pluginlib)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]}
  gazebo)

ros_depends=(ros-indigo-roscpp
  ros-indigo-gazebo-ros
  ros-indigo-std-msgs
  ros-indigo-hardware-interface
  ros-indigo-control-toolbox
  ros-indigo-angles
  ros-indigo-controller-manager
  ros-indigo-joint-limits-interface
  ros-indigo-transmission-interface
  ros-indigo-urdf
  ros-indigo-pluginlib)
depends=(${ros_depends[@]}
  gazebo)

_tag=release/indigo/gazebo_ros_control/${pkgver}-${_pkgver_patch}
_dir=gazebo_ros_control
source=("${_dir}"::"git+https://github.com/ros-gbp/gazebo_ros_pkgs-release.git"#tag=${_tag})
md5sums=('SKIP')

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
