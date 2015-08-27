# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - A hub acts as a shared key-value store for multiple ros systems (primarily used by gateways)."
url='http://ros.org/wiki/rocon_gateway'

pkgname='ros-indigo-rocon-gateway'
pkgver='0.7.10'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-indigo-roslint
  ros-indigo-catkin)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-indigo-rocon-gateway-utils
  ros-indigo-rosservice
  ros-indigo-rosgraph
  ros-indigo-rocon-hub-client
  ros-indigo-gateway-msgs
  ros-indigo-std-srvs
  ros-indigo-zeroconf-avahi
  ros-indigo-rospy
  ros-indigo-rocon-python-utils
  ros-indigo-rostopic
  ros-indigo-rocon-console
  ros-indigo-zeroconf-msgs
  ros-indigo-roslib
  ros-indigo-rocon-python-redis
  ros-indigo-rocon-python-wifi
  ros-indigo-rocon-python-comms)
depends=(${ros_depends[@]}
  python2-crypto)

_tag=release/indigo/rocon_gateway/${pkgver}-${_pkgver_patch}
_dir=rocon_gateway
source=("${_dir}"::"git+https://github.com/yujinrobot-release/rocon_multimaster-release.git"#tag=${_tag})
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
