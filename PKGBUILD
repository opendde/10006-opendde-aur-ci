# Maintainer: Jan Houben <jan@nexttrex.de>
# Contributor: Jesus Alvarez <jeezusjr at gmail dot com>
#
# This PKGBUILD was generated by the archzfs build scripts located at
#
# http://github.com/archzfs/archzfs
#
# ! WARNING !
#
# The archzfs packages are kernel modules, so these PKGBUILDS will only work with the kernel package they target. In this
# case, the archzfs-linux packages will only work with the default linux package! To have a single PKGBUILD target many
# kernels would make for a cluttered PKGBUILD!
#
# If you have a custom kernel, you will need to change things in the PKGBUILDS. If you would like to have AUR or archzfs repo
# packages for your favorite kernel package built using the archzfs build tools, submit a request in the Issue tracker on the
# archzfs github page.
#
pkgbase="zfs-linux"
pkgname=("zfs-linux" "zfs-linux-headers")
_zfsver="0.8.3"
_kernelver="5.6.11.arch1-1"
_extramodules="${_kernelver/.arch/-arch}"

pkgver="${_zfsver}_$(echo ${_kernelver} | sed s/-/./g)"
pkgrel=2
makedepends=("linux-headers=${_kernelver}")
arch=("x86_64")
url="https://zfsonlinux.org/"
source=("https://github.com/zfsonlinux/zfs/releases/download/zfs-${_zfsver}/zfs-${_zfsver}.tar.gz"
        "linux-5.5-compat-blkg_tryget.patch"
        "linux-5.6-compat-struct-proc_ops.patch"
        "linux-5.6-compat-timestamp_truncate.patch"
        "linux-5.6-compat-ktime_get_raw_ts64.patch"
        "linux-5.6-compat-time_t.patch")
sha256sums=("545a4897ce30c2d2dd9010a0fdb600a0d3d45805e2387093c473efc03aa9d7fd"
            "daae58460243c45c2c7505b1d88dcb299ea7d92bcf3f41d2d30bc213000bb1da"
            "05ca889a89b1e57d55c1b7d4d3013398a3e5a69d0fad27278aad701f0bb6e802"
            "5ad4393b334a8f685212f47b44e98dc468c70214ee5dbbab24cc95c4f310ae39"
            "7c6ebee72d864160b376fc18017c81f499f177b7d9265f565de859139805a277"
            "06f7ade5adcbfe77cb234361f8b2aca6d6e78fcd136da6d3a70048b5e92c62bb")
license=("CDDL")
depends=("kmod" "zfs-utils=${_zfsver}" "linux=${_kernelver}")
prepare() {
    cd "${srcdir}/zfs-${_zfsver}"
    patch -Np1 -i ${srcdir}/linux-5.5-compat-blkg_tryget.patch
    patch -Np1 -i ${srcdir}/linux-5.6-compat-struct-proc_ops.patch
    patch -Np1 -i ${srcdir}/linux-5.6-compat-timestamp_truncate.patch
    patch -Np1 -i ${srcdir}/linux-5.6-compat-time_t.patch
    patch -Np1 -i ${srcdir}/linux-5.6-compat-ktime_get_raw_ts64.patch
}

build() {
    cd "${srcdir}/zfs-${_zfsver}"
    ./autogen.sh
    ./configure --prefix=/usr --sysconfdir=/etc --sbindir=/usr/bin --libdir=/usr/lib \
                --datadir=/usr/share --includedir=/usr/include --with-udevdir=/usr/lib/udev \
                --libexecdir=/usr/lib --with-config=kernel \
                --with-linux=/usr/lib/modules/${_extramodules}/build \
                --with-linux-obj=/usr/lib/modules/${_extramodules}/build
    make
}

package_zfs-linux() {
    pkgdesc="Kernel modules for the Zettabyte File System."
    install=zfs.install
    provides=("zfs" "spl")
    groups=("archzfs-linux")
    conflicts=("zfs-dkms" "zfs-dkms-git" "zfs-dkms-rc" "spl-dkms" "spl-dkms-git" 'zfs-linux-git' 'zfs-linux-rc' 'spl-linux')
    replaces=("spl-linux")
    cd "${srcdir}/zfs-${_zfsver}"
    make DESTDIR="${pkgdir}" INSTALL_MOD_PATH=/usr install
    # Remove src dir
    rm -r "${pkgdir}"/usr/src
}

package_zfs-linux-headers() {
    pkgdesc="Kernel headers for the Zettabyte File System."
    provides=("zfs-headers" "spl-headers")
    conflicts=("zfs-headers" "zfs-dkms" "zfs-dkms-git" "zfs-dkms-rc" "spl-dkms" "spl-dkms-git" "spl-headers")
    cd "${srcdir}/zfs-${_zfsver}"
    make DESTDIR="${pkgdir}" install
    rm -r "${pkgdir}/lib"
    # Remove reference to ${srcdir}
    sed -i "s+${srcdir}++" ${pkgdir}/usr/src/zfs-*/${_extramodules}/Module.symvers
}
