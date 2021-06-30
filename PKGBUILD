# Script generated with import_catkin_packages.py.
# For more information: https://github.com/bchretien/arch-ros-stacks.
pkgdesc="ROS - Controller to publish joint state."
url='https://github.com/ros-controls/ros_controllers/wiki'

pkgname='ros-noetic-joint-state-controller'
pkgver='0.19.0'
_pkgver_patch=0
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=1
license=('BSD')

ros_makedepends=(
	ros-noetic-sensor-msgs
	ros-noetic-realtime-tools
	ros-noetic-catkin
	ros-noetic-pluginlib
	ros-noetic-roscpp
	ros-noetic-hardware-interface
	ros-noetic-controller-interface
)

makedepends=(
	'cmake'
	'ros-build-tools'
	${ros_makedepends[@]}
)

ros_depends=(
	ros-noetic-sensor-msgs
	ros-noetic-realtime-tools
	ros-noetic-pluginlib
	ros-noetic-roscpp
	ros-noetic-hardware-interface
	ros-noetic-controller-interface
)

depends=(
	${ros_depends[@]}
)

_dir="ros_controllers-${pkgver}/joint_state_controller"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-controls/ros_controllers/archive/${pkgver}.tar.gz")
sha256sums=('ce96e156344d628b655eb9d2394c19dd50b77324da12df674d220fa4afea6e68')

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
