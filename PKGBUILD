# Maintainer: Jan Houben <jan@nexttrex.de>
# Maintainer: Jesus Alvarez <jeezusjr at gmail dot com>
#
# This PKGBUILD was generated by the archzfs build scripts located at
#
# http://github.com/minextu/archzfs/tree/linux-hardened
#
# ! WARNING !
#
# The archzfs packages are kernel modules, so these PKGBUILDS will only work with the kernel package they target. In this
# case, the archzfs-linux-hardened packages will only work with the default linux-hardened package! To have a single PKGBUILD target
# many kernels would make for a cluttered PKGBUILD!
#
# If you have a custom kernel, you will need to change things in the PKGBUILDS. If you would like to have AUR or archzfs repo
# packages for your favorite kernel package built using the archzfs build tools, submit a request in the Issue tracker on the
# archzfs github page.
#
#
pkgname="zfs-linux-hardened"
pkgver=0.6.5.11_4.12.d.0_1
pkgrel=1
pkgdesc="Kernel modules for the Zettabyte File System."
depends=("kmod" "spl-linux-hardened" "zfs-utils-linux-hardened" "linux-hardened=4.12.d-1")
makedepends=("linux-hardened-headers=4.12.d-1")
arch=("x86_64")
url="http://zfsonlinux.org/"
source=("https://github.com/zfsonlinux/zfs/releases/download/zfs-0.6.5.11/zfs-0.6.5.11.tar.gz")
sha256sums=("136b3061737f1a43f5310919cacbf1b8a0db72b792ef8b1606417aff16dab59d")
groups=("archzfs-linux-hardened")
license=("CDDL")
install=zfs.install
provides=("zfs")
conflicts=('zfs-linux' 'zfs-linux-git' 'zfs-linux-lts' 'zfs-linux-lts-git' 'zfs-linux-hardened-git')

build() {
    cd "${srcdir}/zfs-0.6.5.11"
    ./autogen.sh
    ./configure --prefix=/usr --sysconfdir=/etc --sbindir=/usr/bin --libdir=/usr/lib \
                --datadir=/usr/share --includedir=/usr/include --with-udevdir=/lib/udev \
                --libexecdir=/usr/lib/zfs-0.6.5.11 --with-config=kernel \
                --with-linux=/usr/lib/modules/4.12.0-1-hardened/build \
                --with-linux-obj=/usr/lib/modules/4.12.0-1-hardened/build
    make
}

package() {
    cd "${srcdir}/zfs-0.6.5.11"
    make DESTDIR="${pkgdir}" install
    cp -r "${pkgdir}"/{lib,usr}
    rm -r "${pkgdir}"/lib
    # Remove reference to ${srcdir}
    sed -i "s+${srcdir}++" ${pkgdir}/usr/src/zfs-*/4.12.0-1-hardened/Module.symvers
}
