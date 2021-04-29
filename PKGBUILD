# Script generated with import_catkin_packages.py.
# For more information: https://github.com/bchretien/arch-ros-stacks.
pkgdesc="ROS - ROS communications-related packages, including core client libraries (roscpp, rospy) and graph introspection tools (rostopic, rosnode, rosservice, rosparam)."
url='https://wiki.ros.org/ros_comm'

pkgname='ros-melodic-ros-comm'
pkgver='1.14.11'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
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
	ros-melodic-std-srvs
	ros-melodic-rosbag
	ros-melodic-rosmsg
	ros-melodic-rosout
	ros-melodic-rosparam
	ros-melodic-topic-tools
	ros-melodic-rosgraph
	ros-melodic-message-filters
	ros-melodic-rospy
	ros-melodic-ros
	ros-melodic-roslisp
	ros-melodic-roswtf
	ros-melodic-rosmaster
	ros-melodic-rostopic
	ros-melodic-rosconsole
	ros-melodic-roscpp
	ros-melodic-xmlrpcpp
	ros-melodic-rostest
	ros-melodic-rosnode
	ros-melodic-rosgraph-msgs
	ros-melodic-roslaunch
	ros-melodic-rosservice
)

depends=(
	${ros_depends[@]}
)

_dir="ros_comm-${pkgver}/ros_comm"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros/ros_comm/archive/${pkgver}.tar.gz"
        https://patch-diff.githubusercontent.com/raw/ros/ros_comm/pull/2092.patch)
sha256sums=('a7f3cf19059c189d3326d3e35f5795d707fa405fb55e7250353d71e0698410f5'
            'ad42681c4249a89f4a0188f8202e73286c4090bbc919a470543af7e8f1b198f4')

prepare() {
    cd ${srcdir}/ros_comm-${pkgver}
    patch -p1 < ${srcdir}/2092.patch
}

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
