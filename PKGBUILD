# Maintainer: Jesus Alvarez <jeezusjr at gmail dot com>
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
pkgname="zfs-utils-linux"
pkgver=0.6.5.6_4.5.1_1
pkgrel=4
pkgdesc="Kernel module support files for the Zettabyte File System."
depends=("spl-linux"
         "linux>=4.5.1" "linux<4.6"
         "linux-headers>=4.5.1" "linux-headers<4.6")
arch=("x86_64")
url="http://zfsonlinux.org/"
source=("http://archive.zfsonlinux.org/downloads/zfsonlinux/zfs/zfs-0.6.5.6.tar.gz"
        "zfs-utils.bash-completion-r1"
        "zfs-utils.initcpio.install"
        "zfs-utils.initcpio.hook")
sha256sums=("c349d46d86b4f61cd53a0891acad916cfc3f0d6754127db7f60a0bd98185aeff"
            "b60214f70ffffb62ffe489cbfabd2e069d14ed2a391fac0e36f914238394b540"
            "1e20071fa61a33874505dae0f2d71bb560f43e7faaea735cbde770ea10c133df"
            "67a96169d36853d8f18ee5a2443ecfcd2461a20f9109f4b281bee3945d83518a")
license=("CDDL")
groups=("archzfs-linux")
provides=("zfs-utils-linux")


build() {
    cd "${srcdir}/zfs-0.6.5.6"
    ./autogen.sh
    ./configure --prefix=/usr --sysconfdir=/etc --sbindir=/usr/bin --with-mounthelperdir=/usr/bin \
                --libdir=/usr/lib --datadir=/usr/share --includedir=/usr/include \
                --with-udevdir=/lib/udev --libexecdir=/usr/lib/zfs-0.6.5.6 \
                --with-config=user
    make
}

package() {
    cd "${srcdir}/zfs-0.6.5.6"
    make DESTDIR="${pkgdir}" install

    # Remove uneeded files
    rm -r "${pkgdir}"/etc/init.d
    rm -r "${pkgdir}"/usr/lib/dracut

    # move module tree /lib -> /usr/lib
    cp -r "${pkgdir}"/{lib,usr}
    rm -r "${pkgdir}"/lib

    # Install the support files
    install -D -m644 "${srcdir}"/zfs-utils.initcpio.hook "${pkgdir}"/usr/lib/initcpio/hooks/zfs
    install -D -m644 "${srcdir}"/zfs-utils.initcpio.install "${pkgdir}"/usr/lib/initcpio/install/zfs
    install -D -m644 "${srcdir}"/zfs-utils.bash-completion-r1 "${pkgdir}"/usr/share/bash-completion/completions/zfs
}
