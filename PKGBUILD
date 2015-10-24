# Maintainer: Jesus Alvarez <jeezusjr at gmail dot com>
# Contributor: Kyle Fuller <inbox at kylefuller dot co dot uk>
#
# This PKGBUILD was generated by the archzfs build scripts located at
#
# http://github.com/demizer/archzfs
#
# The build script generates and updates the pkgver and _kernel* variables.
#
pkgname="spl-utils-lts"
pkgver=0.6.5.3_4.1.11_1
pkgrel=1
pkgdesc="Solaris Porting Layer kernel module support files."
arch=("i686" "x86_64")
url="http://zfsonlinux.org/"
source=("http://archive.zfsonlinux.org/downloads/zfsonlinux/spl/spl-0.6.5.3.tar.gz"
        "spl-utils.hostid")
groups=("archzfs-lts")
license=("GPL")
provides=("spl-utils")
conflicts=("spl-utils" "spl-utils-git")

build() {
    cd "${srcdir}/spl-0.6.5.3"
    ./autogen.sh

    _at_enable=""
    [ "${CARCH}" == "i686"  ] && _at_enable="--enable-atomic-spinlocks"

    ./configure --prefix=/usr \
                --libdir=/usr/lib \
                --sbindir=/usr/bin \
                --with-config=user \
                ${_at_enable}

    make
}

package() {
    cd "${srcdir}/spl-0.6.5.3"
    make DESTDIR="${pkgdir}" install

    install -D -m644 "${srcdir}"/spl-utils.hostid "${pkgdir}"/etc/hostid
}
sha256sums=('637c1eccd721f5d3bb1570621d2cd6646ec0488608482c0dbeb2838cf4bb310c'
            'ad95131bc0b799c0b1af477fb14fcf26a6a9f76079e48bf090acb7e8367bfd0e')
