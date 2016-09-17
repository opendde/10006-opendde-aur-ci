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
pkgname="spl-utils-linux-lts"
pkgver=0.6.5.8_4.4.21_1
pkgrel=2
pkgdesc="Solaris Porting Layer kernel module support files."
arch=("x86_64")
url="http://zfsonlinux.org/"
source=("https://github.com/zfsonlinux/zfs/releases/download/zfs-0.6.5.8/spl-0.6.5.8.tar.gz")
sha256sums=("2d22117106782222d2b7da88cc657b7b9c44d281b1cc74d60761e52d33ab1155")
groups=("archzfs-linux-lts")
license=("GPL")
provides=("spl-utils")
makedepends=("linux-lts-headers=4.4.21")
conflicts=('spl-utils-linux' 'spl-utils-linux-git')

build() {
    cd "${srcdir}/spl-0.6.5.8"
    ./autogen.sh
    ./configure --prefix=/usr --libdir=/usr/lib --sbindir=/usr/bin --with-config=user
    make
}

package() {
    cd "${srcdir}/spl-0.6.5.8"
    make DESTDIR="${pkgdir}" install
}
