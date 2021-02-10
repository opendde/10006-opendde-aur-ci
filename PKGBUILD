pkgdesc="ROS - Integration test suite based on roslaunch that is compatible with xUnit frameworks."
url='https://github.com/ros/ros_comm'

pkgname='ros-noetic-rostest'
pkgver='1.15.9'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=1
license=('BSD')

ros_makedepends=(
	ros-noetic-catkin
	ros-noetic-rosunit
)

makedepends=(
	cmake
	ros-build-tools
	${ros_makedepends[@]}
	boost
)

ros_depends=(
	ros-noetic-rosgraph
	ros-noetic-roslaunch
	ros-noetic-rosmaster
	ros-noetic-rospy
	ros-noetic-rosunit
)

depends=(
	${ros_depends[@]}
	boost
)

_dir="ros_comm-${pkgver}/tools/rostest"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros/ros_comm/archive/${pkgver}.tar.gz")
sha256sums=('ee68c16fe6e2f3bf8fef4cf35552a30160cb3b579dfe18d667c0ba05e69ef90d')

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
