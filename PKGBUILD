# Script generated with import_catkin_packages.py.
# For more information: https://github.com/bchretien/arch-ros-stacks.
pkgdesc="ROS - An rqt-based tool that assists monitoring tasks for MoveIt! motion planner developers and users."
url='https://wiki.ros.org/rqt_moveit'

pkgname='ros-melodic-rqt-moveit'
pkgver='0.5.7'
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
	ros-melodic-rqt-py-common
	ros-melodic-rqt-gui-py
	ros-melodic-rqt-topic
	ros-melodic-rosnode
	ros-melodic-rostopic
	ros-melodic-python-qt-binding
	ros-melodic-rqt-gui
	ros-melodic-sensor-msgs
	ros-melodic-rospy
)

depends=(
	${ros_depends[@]}
)

_dir="rqt_moveit-release-release-melodic-rqt_moveit-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/rqt_moveit-release/archive/release/melodic/rqt_moveit/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('979c1ec400699c3597ee3bc9044aeab021f3cbb79bdf2edfe7572c0ee7a96f96')

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
