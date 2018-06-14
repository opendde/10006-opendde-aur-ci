# Maintainer: Jesus Alvarez <jeezusjr at gmail dot com>
#
# This PKGBUILD was generated by the archzfs build scripts located at
#
# http://github.com/archzfs/archzfs
#
# ! WARNING !
#
# The archzfs packages are kernel modules, so these PKGBUILDS will only work with the kernel package they target. In this
# case, the archzfs-linux-lts packages will only work with the default linux-lts package! To have a single PKGBUILD target
# many kernels would make for a cluttered PKGBUILD!
#
# If you have a custom kernel, you will need to change things in the PKGBUILDS. If you would like to have AUR or archzfs repo
# packages for your favorite kernel package built using the archzfs build tools, submit a request in the Issue tracker on the
# archzfs github page.
#
#
pkgbase="spl-linux-lts"
pkgname=("spl-linux-lts" "spl-linux-lts-headers")

pkgver=0.7.9.4.14.49.1
pkgrel=1
makedepends=("linux-lts-headers=4.14.49-1")
arch=("x86_64")
url="http://zfsonlinux.org/"
source=("https://github.com/zfsonlinux/zfs/releases/download/zfs-0.7.9/spl-0.7.9.tar.gz")
sha256sums=("49832e446a5abce0b55ba245c9b5f94959604d44378320fdffae0233bf1e8c00")
license=("GPL")
depends=("spl-utils-common=0.7.9" "kmod" "linux-lts=4.14.49-1")

build() {
    cd "${srcdir}/spl-0.7.9"
    ./autogen.sh
    ./configure --prefix=/usr --libdir=/usr/lib --sbindir=/usr/bin \
                --with-linux=/usr/lib/modules/4.14.49-1-lts/build \
                --with-linux-obj=/usr/lib/modules/4.14.49-1-lts/build \
                --with-config=kernel
    make
}

package_spl-linux-lts() {
    pkgdesc="Solaris Porting Layer kernel modules."
    install=spl.install
    provides=("spl")
    groups=("archzfs-linux-lts")
    conflicts=('spl-linux-lts-git')
    cd "${srcdir}/spl-0.7.9"
    make DESTDIR="${pkgdir}" install
    mv "${pkgdir}/lib" "${pkgdir}/usr/"
    # Remove src dir
    rm -r "${pkgdir}"/usr/src
}

package_spl-linux-lts-headers() {
    pkgdesc="Solaris Porting Layer kernel headers."
    conflicts=('spl-archiso-linux-headers' 'spl-archiso-linux-git-headers' 'spl-linux-hardened-headers' 'spl-linux-hardened-git-headers'  'spl-linux-lts-git-headers' 'spl-linux-headers' 'spl-linux-git-headers' 'spl-linux-vfio-headers' 'spl-linux-vfio-git-headers' 'spl-linux-zen-headers' 'spl-linux-zen-git-headers' )
    cd "${srcdir}/spl-0.7.9"
    make DESTDIR="${pkgdir}" install
    rm -r "${pkgdir}/lib"
    # Remove reference to ${srcdir}
    sed -i "s+${srcdir}++" ${pkgdir}/usr/src/spl-*/4.14.49-1-lts/Module.symvers
}
