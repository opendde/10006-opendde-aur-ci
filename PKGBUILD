# Maintainer: Piotr Gorski <lucjan.lucjanov@gmail.com>
# Contributor: JokerBoy <jokerboy at punctweb dot ro>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor : Trevor Turner <turn3r.tr3v0r at gmail dot com>

pkgbase=virtualbox-modules-bfq
pkgname=('virtualbox-host-modules-bfq')
pkgver=6.0.12
pkgrel=4
arch=('x86_64')
url='http://virtualbox.org'
license=('GPL')
makedepends=('linux-bfq-headers' "virtualbox-host-dkms>=$pkgver" 'dkms')

_kernver="$(</usr/src/linux/version)"

build() {
	# dkms need modification to be run as user
	cp -r /var/lib/dkms .
	echo "dkms_tree='$srcdir/dkms'" > dkms.conf
	# build host modules
	msg2 'Host modules'
	dkms --dkmsframework dkms.conf build "vboxhost/${pkgver}_OSE" -k "$_kernver"
}

package_virtualbox-host-modules-bfq() {
	pkgdesc='Host kernel modules for VirtualBox running under linux-bfq.'
	provides=("VIRTUALBOX-HOST-MODULES")
	depends=('linux-bfq>=5.3' 'linux-bfq<5.4')
	
	cd "/var/lib/dkms/vboxhost/${pkgver}_OSE/$_kernver/$CARCH/module"
        install -Dt "$pkgdir/usr/lib/modules/$_kernver/extramodules" -m0644 *

        # compress each module individually
        find "$pkgdir" -name '*.ko' -exec gzip -n {} +
	
        # systemd module loading
        printf "vboxdrv\nvboxpci\nvboxnetadp\nvboxnetflt\n" |
        install -Dm644 /dev/stdin "$pkgdir/usr/lib/modules-load.d/virtualbox-host-modules-bfq.conf"
}
