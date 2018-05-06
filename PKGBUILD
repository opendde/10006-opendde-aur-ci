# Maintainer: Jesus Alvarez <jeezusjr at gmail dot com>
#
# This PKGBUILD was generated by the archzfs build scripts located at
#
# http://github.com/archzfs/archzfs
#
# ! WARNING !
#
# The archzfs packages are kernel modules, so these PKGBUILDS will only work with the kernel package they target. In this
# case, the archzfs-linux-zen packages will only work with the default linux-zen package! To have a single PKGBUILD target many
# kernels would make for a cluttered PKGBUILD!
#
# If you have a custom kernel, you will need to change things in the PKGBUILDS. If you would like to have AUR or archzfs repo
# packages for your favorite kernel package built using the archzfs build tools, submit a request in the Issue tracker on the
# archzfs github page.
#
pkgbase="zfs-linux-zen-git"
pkgname=("zfs-linux-zen-git" "zfs-linux-zen-git-headers")

pkgver=2018.05.04.r3462.64c1dcefe.4.16.6.1
pkgrel=1
makedepends=("linux-zen-headers=4.16.6-1" "git" "spl-linux-zen-git-headers")
arch=("x86_64")
url="http://zfsonlinux.org/"
source=("git+https://github.com/zfsonlinux/zfs.git#commit=64c1dcefe38a62d304177475a2ef77111cec612a")
sha256sums=("SKIP")
license=("CDDL")
depends=("kmod" "spl-linux-zen-git" "zfs-utils-common-git=2018.05.04.r3462.64c1dcefe" "linux-zen=4.16.6-1")

build() {
    cd "${srcdir}/zfs"
    ./autogen.sh
    ./configure --prefix=/usr --sysconfdir=/etc --sbindir=/usr/bin --libdir=/usr/lib \
                --datadir=/usr/share --includedir=/usr/include --with-udevdir=/lib/udev \
                --libexecdir=/usr/lib/zfs-0.7.8 --with-config=kernel \
                --with-linux=/usr/lib/modules/4.16.6-1-zen/build \
                --with-linux-obj=/usr/lib/modules/4.16.6-1-zen/build
    make
}

package_zfs-linux-zen-git() {
    pkgdesc="Kernel modules for the Zettabyte File System."
    install=zfs.install
    provides=("zfs")
    groups=("archzfs-linux-zen-git")
    conflicts=('zfs-linux-zen')
    replaces=("zfs-git")
    cd "${srcdir}/zfs"
    make DESTDIR="${pkgdir}" install
    cp -r "${pkgdir}"/{lib,usr}
    rm -r "${pkgdir}"/lib
    # Remove src dir
    rm -r "${pkgdir}"/usr/src
}

package_zfs-linux-zen-git-headers() {
    pkgdesc="Kernel headers for the Zettabyte File System."
    conflicts=('zfs-archiso-linux-headers' 'zfs-archiso-linux-git-headers' 'zfs-linux-hardened-headers' 'zfs-linux-hardened-git-headers' 'zfs-linux-lts-headers' 'zfs-linux-lts-git-headers' 'zfs-linux-headers' 'zfs-linux-git-headers' 'zfs-linux-vfio-headers' 'zfs-linux-vfio-git-headers' 'zfs-linux-zen-headers'  )
    cd "${srcdir}/zfs"
    make DESTDIR="${pkgdir}" install
    rm -r "${pkgdir}/lib"
    # Remove reference to ${srcdir}
    sed -i "s+${srcdir}++" ${pkgdir}/usr/src/zfs-*/4.16.6-1-zen/Module.symvers
}
