# Maintainer: Jesus Alvarez <jeezusjr at gmail dot com>
#
# This PKGBUILD was generated by the archzfs build scripts located at
#
# http://github.com/archzfs/archzfs
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
pkgbase="spl-linux-hardened-git"
pkgname=("spl-linux-hardened-git" "spl-linux-hardened-git-headers")
pkgver=0.7.0_rc5_r0_gae42190_4.12.1.b_1
pkgrel=1
makedepends=("linux-hardened-headers=4.12.1.b-1" "git")
arch=("x86_64")
url="http://zfsonlinux.org/"
source=("git+https://github.com/zfsonlinux/spl.git")
sha256sums=("SKIP")
license=("GPL")
depends=("spl-utils-common-git" "kmod" "linux-hardened=4.12.1.b-1")

build() {
    cd "${srcdir}/spl"
    ./autogen.sh
    ./configure --prefix=/usr --libdir=/usr/lib --sbindir=/usr/bin \
                --with-linux=/usr/lib/modules/4.12.1-1-hardened/build \
                --with-linux-obj=/usr/lib/modules/4.12.1-1-hardened/build \
                --with-config=kernel
    make
}

package_spl-linux-hardened-git() {
    pkgdesc="Solaris Porting Layer kernel modules."
    install=spl.install
    provides=("spl")
    groups=("archzfs-linux-hardened-git")
    conflicts=('spl-linux-hardened')
    cd "${srcdir}/spl"
    make DESTDIR="${pkgdir}" install
    mv "${pkgdir}/lib" "${pkgdir}/usr/"
    # Remove src dir
    rm -r "${pkgdir}"/usr/src
}

package_spl-linux-hardened-git-headers() {
    pkgdesc="Solaris Porting Layer kernel headers."
    conflicts=('spl-linux-hardened-headers' 'spl-linux-lts-headers' 'spl-linux-lts-git-headers' 'spl-linux-headers' 'spl-linux-git-headers')
    cd "${srcdir}/spl"
    make DESTDIR="${pkgdir}" install
    rm -r "${pkgdir}/lib"
    # Remove reference to ${srcdir}
    sed -i "s+${srcdir}++" ${pkgdir}/usr/src/spl-*/4.12.1-1-hardened/Module.symvers
}
