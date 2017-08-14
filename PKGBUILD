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
pkgbase="spl-linux-zen"
pkgname=("spl-linux-zen" "spl-linux-zen-headers")
pkgver=0.7.1.4.12.5.1
pkgrel=2
makedepends=("linux-zen-headers=4.12.5-1")
arch=("x86_64")
url="http://zfsonlinux.org/"
source=("https://github.com/zfsonlinux/zfs/releases/download/zfs-0.7.1/spl-0.7.1.tar.gz")
sha256sums=("e6a83dc50bc83a5ce6f20238da16fb941ab6090c419be8af8fc9223210f637fd")
license=("GPL")
depends=("spl-utils-common" "kmod" "linux-zen=4.12.5-1")

build() {
    cd "${srcdir}/spl-0.7.1"
    ./autogen.sh
    ./configure --prefix=/usr --libdir=/usr/lib --sbindir=/usr/bin \
                --with-linux=/usr/lib/modules/4.12.5-1-zen/build \
                --with-linux-obj=/usr/lib/modules/4.12.5-1-zen/build \
                --with-config=kernel
    make
}

package_spl-linux-zen() {
    pkgdesc="Solaris Porting Layer kernel modules."
    install=spl.install
    provides=("spl")
    groups=("archzfs-linux-zen")
    conflicts=('spl-linux-zen-git')
    cd "${srcdir}/spl-0.7.1"
    make DESTDIR="${pkgdir}" install
    mv "${pkgdir}/lib" "${pkgdir}/usr/"
    # Remove src dir
    rm -r "${pkgdir}"/usr/src
}

package_spl-linux-zen-headers() {
    pkgdesc="Solaris Porting Layer kernel headers."
    conflicts=('spl-archiso-linux-headers' 'spl-linux-hardened-headers' 'spl-linux-hardened-git-headers' 'spl-linux-lts-headers' 'spl-linux-lts-git-headers' 'spl-linux-headers' 'spl-linux-git-headers'  'spl-linux-zen-git-headers' )
    cd "${srcdir}/spl-0.7.1"
    make DESTDIR="${pkgdir}" install
    rm -r "${pkgdir}/lib"
    # Remove reference to ${srcdir}
    sed -i "s+${srcdir}++" ${pkgdir}/usr/src/spl-*/4.12.5-1-zen/Module.symvers
}
