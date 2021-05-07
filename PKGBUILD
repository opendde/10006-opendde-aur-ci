# Script generated with import_catkin_packages.py.
# For more information: https://github.com/bchretien/arch-ros-stacks.
pkgdesc="ROS - roswtf is a tool for diagnosing issues with a running ROS system."
url='https://wiki.ros.org/roswtf'

pkgname='ros-noetic-roswtf'
pkgver='1.15.11'
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(
	ros-noetic-catkin
	ros-noetic-rostest
)

makedepends=(
	'cmake'
	'ros-build-tools'
	${ros_makedepends[@]}
)

ros_depends=(
	ros-noetic-rosbuild
	ros-noetic-rosnode
	ros-noetic-rosgraph
	ros-noetic-roslaunch
	ros-noetic-rosservice
	ros-noetic-roslib
)

depends=(
	${ros_depends[@]}
	python-paramiko
	python-rospkg
)

_dir="ros_comm-${pkgver}/utilities/roswtf"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros/ros_comm/archive/${pkgver}.tar.gz")
sha256sums=('7187dd3ab2783e5041c2ef71079cf2b6f9ed06c88c7e3c6efd7684ca5475b5bd')

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
