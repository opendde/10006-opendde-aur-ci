# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - A simple viewer for ROS image topics."
url='http://www.ros.org/wiki/image_view'

pkgname='ros-jade-image-view'
pkgver='1.12.16'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-jade-nodelet
  ros-jade-cv-bridge
  ros-jade-sensor-msgs
  ros-jade-message-generation
  ros-jade-roscpp
  ros-jade-catkin
  ros-jade-image-transport
  ros-jade-message-filters
  ros-jade-std-srvs
  ros-jade-stereo-msgs
  ros-jade-rosconsole
  ros-jade-camera-calibration-parsers
  ros-jade-dynamic-reconfigure)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  gtk2)

ros_depends=(ros-jade-cv-bridge
  ros-jade-nodelet
  ros-jade-roscpp
  ros-jade-image-transport
  ros-jade-message-filters
  ros-jade-std-srvs
  ros-jade-rosconsole
  ros-jade-camera-calibration-parsers
  ros-jade-dynamic-reconfigure)
depends=(${ros_depends[@]}
  opencv
  python2-numpy
  gtk2)

# Git version (e.g. for debugging)
# _tag=release/jade/image_view/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/image_pipeline-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="image_pipeline-release-release-jade-image_view-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/image_pipeline-release/archive/release/jade/image_view/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('328af7b592b57139bd8b097ed1f5b74aeb8807637ae871e5d2775d59e317afa8')

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/jade/setup.bash ] && source /opt/ros/jade/setup.bash

  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  # Fix Python2/Python3 conflicts
  /usr/share/ros-build-tools/fix-python-scripts.sh -v 2 ${srcdir}/${_dir}

  # Build project
  cmake ${srcdir}/${_dir} \
        -DCMAKE_BUILD_TYPE=Release \
        -DCATKIN_BUILD_BINARY_PACKAGE=ON \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/jade \
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
