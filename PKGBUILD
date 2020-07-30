pkgdesc="ROS - Components of MoveIt that offer interaction via interactive markers."
url='https://moveit.ros.org'

pkgname='ros-noetic-moveit-ros-robot-interaction'
pkgver='1.0.5'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=1
license=('BSD')

ros_makedepends=(
    ros-noetic-tf
    ros-noetic-pluginlib
    ros-noetic-interactive-markers
    ros-noetic-roscpp
    ros-noetic-moveit-ros-planning
    ros-noetic-eigen-conversions
    ros-noetic-catkin
)
makedepends=(
    cmake
    ros-build-tools
    ${ros_makedepends[@]}
)

ros_depends=(
    ros-noetic-tf
    ros-noetic-pluginlib
    ros-noetic-interactive-markers
    ros-noetic-roscpp
    ros-noetic-moveit-ros-planning
    ros-noetic-eigen-conversions
)
depends=(
    ${ros_depends[@]}
)

_dir="moveit-${pkgver}/moveit_ros/robot_interaction"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-planning/moveit/archive/${pkgver}.tar.gz")
sha256sums=('78f874c64156d761c77e0988ae1a4d9e492023b33664dcf1299ec6154f2bd45a')

build() {
    # Use ROS environment variables
    source /usr/share/ros-build-tools/clear-ros-env.sh
    [ -f /opt/ros/noetic/setup.bash ] && source /opt/ros/noetic/setup.bash

    # Create build directory
    [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
    cd ${srcdir}/build

    # Build project
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
