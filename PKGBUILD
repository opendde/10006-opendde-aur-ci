pkgdesc="ROS - This stack provides Python bindings for Qt."
url='https://wiki.ros.org/python_qt_binding'

pkgname='ros-noetic-python-qt-binding'
pkgver='0.4.3'
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(
    ros-noetic-catkin
    ros-noetic-rosbuild
)

makedepends=(
    cmake
    ros-build-tools
    ${ros_makedepends[@]}
    qt5-base
)

ros_depends=(
)

depends=(
    ${ros_depends[@]}
    python-pyqt5
)

_dir="python_qt_binding-${pkgver}"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-visualization/python_qt_binding/archive/${pkgver}.tar.gz"
        "sip_path.patch")
sha256sums=('e76de1c4a05c59094ccbb37a7bb0e252a6e33e5cc0fed83b41ccf84bc47c39c6'
            'd60d8edfc7dec99700fd66076d6fd01963a26e7623562c1ef289abc041e8d2ef')

prepare() {
    cd ${srcdir}/${_dir}
    patch --strip=1 --input="${srcdir}/sip_path.patch"
}

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
