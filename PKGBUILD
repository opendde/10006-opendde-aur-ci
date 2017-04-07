# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - octovis is visualization tool for the OctoMap library based on Qt and libQGLViewer."
url='http://octomap.github.io'

pkgname='ros-kinetic-octovis'
pkgver='1.8.1'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('GPLv2')

ros_makedepends=(ros-kinetic-octomap)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  qt4
  libqglviewer-qt4)

ros_depends=(ros-kinetic-octomap
  ros-kinetic-catkin)
depends=(${ros_depends[@]}
  qt4
  libqglviewer-qt4)

# Git version (e.g. for debugging)
# _tag=release/kinetic/octovis/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/octomap-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="octomap-release-release-kinetic-octovis-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/octomap-release/archive/release/kinetic/octovis/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('3c29b6a392cf48985126527130fdc378e60e0987e2cd63c65cdda6e90bbc282b')

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
