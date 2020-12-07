# Script generated with import_catkin_packages.py.
# For more information: https://github.com/bchretien/arch-ros-stacks.
pkgdesc="ROS - diagnostic_aggregator."
url='https://wiki.ros.org/diagnostic_aggregator'

pkgname='ros-noetic-diagnostic-aggregator'
pkgver='1.10.2'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=1
license=('BSD')

ros_makedepends=(
	ros-noetic-bondcpp
	ros-noetic-xmlrpcpp
	ros-noetic-rostest
	ros-noetic-diagnostic-msgs
	ros-noetic-bondpy
	ros-noetic-catkin
	ros-noetic-roscpp
	ros-noetic-rospy
	ros-noetic-pluginlib
)

makedepends=(
	'cmake'
	'ros-build-tools'
	${ros_makedepends[@]}
)

ros_depends=(
	ros-noetic-bondcpp
	ros-noetic-xmlrpcpp
	ros-noetic-diagnostic-msgs
	ros-noetic-bondpy
	ros-noetic-roscpp
	ros-noetic-rospy
	ros-noetic-pluginlib
)

depends=(
	${ros_depends[@]}
)

_dir="diagnostics-${pkgver}/diagnostic_aggregator"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros/diagnostics/archive/${pkgver}.tar.gz")
sha256sums=('b0f966c978642938dea3db726752c5339c2819a5b22cc76b3851257d30eaca8d')

build() {
	# Use ROS environment variables.
	source /usr/share/ros-build-tools/clear-ros-env.sh
	[ -f /opt/ros/noetic/setup.bash ] && source /opt/ros/noetic/setup.bash

	# Create the build directory.
	[ -d ${srcdir}/build ] || mkdir ${srcdir}/build
	cd ${srcdir}/build

	# Build the project.
	cmake ${srcdir}/${_dir} \
		-DCATKIN_BUILD_BINARY_PACKAGE=ON \
		-DCMAKE_INSTALL_PREFIX=/opt/ros/noetic \
		-DPYTHON_EXECUTABLE=/usr/bin/python \
		-DSETUPTOOLS_DEB_LAYOUT=OFF
	make
}

package() {
	cd "${srcdir}/build"
	make DESTDIR="${pkgdir}/" install
}
