# Script generated with import_catkin_packages.py.
# For more information: https://github.com/bchretien/arch-ros-stacks.
pkgdesc="ROS - common_msgs contains messages that are widely used by other ROS packages."
url='http://wiki.ros.org/common_msgs'

pkgname='ros-melodic-common-msgs'
pkgver='1.12.7'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(
	ros-melodic-catkin
)

makedepends=(
	'cmake'
	'ros-build-tools'
	${ros_makedepends[@]}
)

ros_depends=(
	ros-melodic-diagnostic-msgs
	ros-melodic-trajectory-msgs
	ros-melodic-stereo-msgs
	ros-melodic-nav-msgs
	ros-melodic-actionlib-msgs
	ros-melodic-shape-msgs
	ros-melodic-visualization-msgs
	ros-melodic-sensor-msgs
	ros-melodic-geometry-msgs
)

depends=(
	${ros_depends[@]}
)

_dir="common_msgs-release-release-melodic-common_msgs-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/common_msgs-release/archive/release/melodic/common_msgs/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('631a7674053674e50d7fdadc741dcd4f112f0f12c62c179b438e0db457e86a36')

build() {
	# Use ROS environment variables.
	source /usr/share/ros-build-tools/clear-ros-env.sh
	[ -f /opt/ros/melodic/setup.bash ] && source /opt/ros/melodic/setup.bash

	# Create the build directory.
	[ -d ${srcdir}/build ] || mkdir ${srcdir}/build
	cd ${srcdir}/build

	# Fix Python2/Python3 conflicts.
	/usr/share/ros-build-tools/fix-python-scripts.sh -v 3 ${srcdir}/${_dir}

	# Build the project.
	cmake ${srcdir}/${_dir} \
		-DCMAKE_BUILD_TYPE=Release \
		-DCATKIN_BUILD_BINARY_PACKAGE=ON \
		-DCMAKE_INSTALL_PREFIX=/opt/ros/melodic \
		-DPYTHON_EXECUTABLE=/usr/bin/python3 \
		-DPYTHON_INCLUDE_DIR=/usr/include/python3.7m \
		-DPYTHON_LIBRARY=/usr/lib/libpython3.7m.so \
		-DPYTHON_BASENAME=.cpython-37m \
		-DSETUPTOOLS_DEB_LAYOUT=OFF
	make
}

package() {
	cd "${srcdir}/build"
	make DESTDIR="${pkgdir}/" install
}
