# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Service pair libraries for pub/sub non-blocking services."
url='http://ros.org/wiki/rocon_python_comms'

pkgname='ros-indigo-rocon-python-comms'
pkgver='0.1.23'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-indigo-rostest
  ros-indigo-catkin)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]}
  python2-catkin-pkg)

ros_depends=(ros-indigo-rosservice
  ros-indigo-unique-id
  ros-indigo-genpy
  ros-indigo-uuid-msgs
  ros-indigo-rocon-console
  ros-indigo-rospy
  ros-indigo-rostopic
  ros-indigo-rosgraph
  ros-indigo-roslib
  ros-indigo-rosnode
  ros-indigo-rocon-service-pair-msgs)
depends=(${ros_depends[@]}
  python2-yaml)

_tag=release/indigo/rocon_python_comms/${pkgver}-${_pkgver_patch}
_dir=rocon_python_comms
source=("${_dir}"::"git+https://github.com/yujinrobot-release/rocon_tools-release.git"#tag=${_tag})
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
