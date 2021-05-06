#Submitter: Achmad Fathoni<fathoni.id(at)gmail.com>
pkgdesc="ROS interface for the DJI onboard SDK"
url="https://github.com/dji-sdk/Onboard-SDK-ROS"

pkgname='ros-noetic-onboard-sdk-ros'
pkgver='4.1.0'
arch=('x86_64')
license=('MIT')
pkgrel=1

ros_makedepends=(ros-noetic-catkin)
makedepends=(
  cmake
  ros-build-tools
  ${ros_makedepends[@]}
)

ros_depends=(ros-noetic-nmea-comms)
depends=(
  ${ros_depends[@]}
  onboard-sdk
  ffmpeg
  libusb
  sdl2
  opencv
)

_dir="Onboard-SDK-ROS"
source=("https://github.com/dji-sdk/Onboard-SDK-ROS/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('SKIP') 

build() {
    # Use ROS environment variables
    source /usr/share/ros-build-tools/clear-ros-env.sh
    [ -f /opt/ros/noetic/setup.bash ] && source /opt/ros/noetic/setup.bash

    # Build project
    cmake -B build -S ${_dir}-${pkgver} \
            -DCMAKE_BUILD_TYPE=Release \
            -DCATKIN_ENABLE_TESTING=0 \
            -DCATKIN_BUILD_BINARY_PACKAGE=ON \
            -DCMAKE_INSTALL_PREFIX=/opt/ros/noetic \
            -DPYTHON_EXECUTABLE=/usr/bin/python3 \
            -DPYTHON_INCLUDE_DIR=/usr/include/python3.9 \
            -DPYTHON_LIBRARY=/usr/lib/libpython3.9.so \
            -DPYTHON_BASENAME=-python3.9 \
            -DSETUPTOOLS_DEB_LAYOUT=OFF
    make -C build
}

package() {
    cd build
    make DESTDIR="${pkgdir}/" install
}
