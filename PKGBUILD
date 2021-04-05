# Maintainer: Mohammad Mostafa Farzan <m2_farzan@yahoo.com>

pkgname=ros2-foxy
pkgver=2020.12.11
pkgrel=1
pkgdesc="A set of software libraries and tools for building robot applications"
url="https://docs.ros.org/en/foxy/"
arch=('any')
license=('Apache')
depends=('ros2-arch-deps'
         'gmock'
         'sip4')
source=("ros2::git+https://github.com/ros2/ros2#tag=release-foxy-20201211"
        "mimick_vendor.patch"
        "yaml_cpp_vendor.patch")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')
install=ros2-foxy.install

prepare() {
    # Check locale
    locale | grep LANG | grep UTF-8
    if [[ $? -ne 0 ]]; then
        printf "Locale must support UTF-8. See https://wiki.archlinux.org/index.php/locale
        or https://wiki.archlinux.org/index.php/locale ."
        exit 1
    fi

    # Create required symlinks (see https://wiki.archlinux.org/index.php/ROS)
    sudo mkdir -p /usr/share/sip
    sudo ln -sf /usr/lib/python3.9/site-packages/PyQt5 /usr/share/sip/.
    sudo ln -sf /usr/lib/python3.9/site-packages/PyQt5/bindings/* /usr/share/sip/PyQt5/.

    # Clone the repos
    mkdir -p $srcdir/ros2/src
    vcs import $srcdir/ros2/src < $srcdir/ros2/ros2.repos

    # Fix some issues in the code (TODO: Gradually move to upstream)
    ## mimick_vendor:
    pushd $srcdir/ros2/src/ros2/mimick_vendor
    git cherry-pick c4f28e4f806fc3322d310bc3e93977df734ee733 || git cherry-pick --skip
    popd
    patch --forward $srcdir/ros2/src/ros2/mimick_vendor/CMakeLists.txt mimick_vendor.patch || true
    ## yaml_cpp_vendor:
    patch --forward $srcdir/ros2/src/ros2/yaml_cpp_vendor/CMakeLists.txt yaml_cpp_vendor.patch || true
    ## rcutils
    pushd $srcdir/ros2/src/ros2/rcutils
    git cherry-pick 618a9d94565ab844b9f40e0f5828ddbab2bcdad1 || git cherry-pick --skip
    popd
}

build() {
    colcon build --merge-install
}

package() {
    mkdir -p $pkgdir/opt/ros2/foxy
    cp -r $srcdir/install/* $pkgdir/opt/ros2/foxy/
}
