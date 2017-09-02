# Maintainer: Jesus Alvarez <jeezusjr at gmail dot com>
#
# This PKGBUILD was generated by the archzfs build scripts located at
#
# http://github.com/archzfs/archzfs
#
# ! WARNING !
#
# The archzfs packages are kernel modules, so these PKGBUILDS will only work with the kernel package they target. In this
# case, the archzfs-archiso-linux packages will only work with the archiso ISO! To have a single PKGBUILD target many kernels
# would make for a cluttered PKGBUILD!
#
# If you have a custom kernel, you will need to change things in the PKGBUILDS. If you would like to have AUR or archzfs repo
# packages for your favorite kernel package built using the archzfs build tools, submit a request in the Issue tracker on the
# archzfs github page.
#
#
pkgbase="spl-archiso-linux"
pkgname=("spl-archiso-linux" "spl-archiso-linux-headers")
pkgver=0.7.1_4.12.8.2
pkgrel=1
makedepends=("linux-headers=4.12.8")
arch=("x86_64")
url="http://zfsonlinux.org/"
source=("https://github.com/zfsonlinux/zfs/releases/download/zfs-0.7.1/spl-0.7.1.tar.gz")
sha256sums=("e6a83dc50bc83a5ce6f20238da16fb941ab6090c419be8af8fc9223210f637fd")
license=("GPL")
depends=("spl-utils-common>=0.7.1" "kmod" "linux=4.12.8")

build() {
    cd "${srcdir}/spl-0.7.1"
    ./autogen.sh
    ./configure --prefix=/usr --libdir=/usr/lib --sbindir=/usr/bin \
                --with-linux=/usr/lib/modules/4.12.8-2-ARCH/build \
                --with-linux-obj=/usr/lib/modules/4.12.8-2-ARCH/build \
                --with-config=kernel
    make
}

package_spl-archiso-linux() {
    pkgdesc="Solaris Porting Layer kernel modules."
    install=spl.install
    provides=("spl")
    groups=("archzfs-archiso-linux")
    conflicts=()
    cd "${srcdir}/spl-0.7.1"
    make DESTDIR="${pkgdir}" install
    mv "${pkgdir}/lib" "${pkgdir}/usr/"
    # Remove src dir
    rm -r "${pkgdir}"/usr/src
}

package_spl-archiso-linux-headers() {
    pkgdesc="Solaris Porting Layer kernel headers."
    conflicts=( 'spl-linux-hardened-headers' 'spl-linux-hardened-git-headers' 'spl-linux-lts-headers' 'spl-linux-lts-git-headers' 'spl-linux-headers' 'spl-linux-git-headers' 'spl-linux-zen-headers' 'spl-linux-zen-git-headers' )
    cd "${srcdir}/spl-0.7.1"
    make DESTDIR="${pkgdir}" install
    rm -r "${pkgdir}/lib"
    # Remove reference to ${srcdir}
    sed -i "s+${srcdir}++" ${pkgdir}/usr/src/spl-*/4.12.8-2-ARCH/Module.symvers
}
