# Script generated with import_catkin_packages.py.
# For more information: https://github.com/bchretien/arch-ros-stacks.
pkgdesc="ROS - Controller to publish joint state."
url='https://github.com/ros-controls/ros_controllers/wiki'

pkgname='ros-melodic-joint-state-controller'
pkgver='0.17.2'
_pkgver_patch=0
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=2
license=('BSD')

ros_makedepends=(
	ros-melodic-sensor-msgs
	ros-melodic-realtime-tools
	ros-melodic-catkin
	ros-melodic-pluginlib
	ros-melodic-roscpp
	ros-melodic-hardware-interface
	ros-melodic-controller-interface
)

makedepends=(
	'cmake'
	'ros-build-tools'
	${ros_makedepends[@]}
)

ros_depends=(
	ros-melodic-sensor-msgs
	ros-melodic-realtime-tools
	ros-melodic-pluginlib
	ros-melodic-roscpp
	ros-melodic-hardware-interface
	ros-melodic-controller-interface
)

depends=(
	${ros_depends[@]}
)

_dir="ros_controllers-${pkgver}/joint_state_controller"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-controls/ros_controllers/archive/${pkgver}.tar.gz")
sha256sums=('fdd93a3aea7d140b1c04849790e81195f76fb421c7dfa51c86dcf22698f32b3e')

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
		-DSETUPTOOLS_DEB_LAYOUT=OFF
	make
}

package() {
	cd "${srcdir}/build"
	make DESTDIR="${pkgdir}/" install
}
