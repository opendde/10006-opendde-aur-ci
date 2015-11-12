# Maintainer: graysky <graysky AT archlinux DOT org>
# Maintainer: Armin K. <krejzi at email dot com>
# Contributor: Austin ( doorknob60 [at] gmail [dot] com )
# Contributor: Gaetan Bisson <bisson@archlinux.org>

pkgname=broadcom-wl-ck
pkgver=6.30.223.271
pkgrel=2
_pkgdesc='Broadcom 802.11abgn hybrid Linux networking device driver for linux-ck.'
_extramodules="extramodules-4.3-ck"
_kernver="$(cat /usr/lib/modules/${_extramodules}/version)"
pkgdesc="${_pkgdesc}"
arch=('i686' 'x86_64')
url='http://www.broadcom.com/support/802.11/linux_sta.php'
license=('custom')
depends=('linux-ck>=4.3' 'linux-ck<4.4')
makedepends=('linux-ck-headers>=4.3' 'linux-ck-headers<4.4')
conflicts=('broadcom-wl-ck-atom' 'broadcom-wl-ck-barcelona' 'broadcom-wl-ck-bulldozer' 'broadcom-wl-ck-corex' 'broadcom-wl-ck-core2' 'broadcom-wl-ck-haswell' 'broadcom-wl-ck-broadwell' 'broadcom-wl-ck-ivybridge' 'broadcom-wl-ck-kx' 'broadcom-wl-ck-k10' 'broadcom-wl-ck-nehalem' 'broadcom-wl-ck-p4' 'broadcom-wl-ck-piledriver' 'broadcom-wl-ck-pentm' 'broadcom-wl-ck-sandybridge' 'broadcom-wl-ck-silvermont')
#replaces=()
#groups=('ck-generic')
source=('modprobe.d'
'wl_linux.c.patch'
'license.patch')
source_i686+=("http://www.broadcom.com/docs/linux_sta/hybrid-v35-nodebug-pcoem-${pkgver//./_}.tar.gz")
source_x86_64+=("http://www.broadcom.com/docs/linux_sta/hybrid-v35_64-nodebug-pcoem-${pkgver//./_}.tar.gz")
sha256sums=('b4aca51ac5ed20cb79057437be7baf3650563b7a9d5efc515f0b9b34fbb9dc32'
            '583335a6edb2ed1094977c401643d3e60471c6bc5c3ea81f45910a9cccb06032'
            '2f70be509aac743bec2cc3a19377be311a60a1c0e4a70ddd63ea89fae5df08ac')
sha256sums_i686=('4f8b70b293ac8cc5c70e571ad5d1878d0f29d133a46fe7869868d9c19b5058cd')
sha256sums_x86_64=('5f79774d5beec8f7636b59c0fb07a03108eef1e3fd3245638b20858c714144be')

install=broadcom-wl-ck.install

prepare() {
  patch -p1 -i license.patch
  patch -p1 -i wl_linux.c.patch
	sed -e "/BRCM_WLAN_IFNAME/s:eth:wlan:" -i src/wl/sys/wl_linux.c
}


build() {
	make -C /usr/lib/modules/"${_kernver}"/build M=`pwd`
}

package() {
	install -Dm644 wl.ko "${pkgdir}/usr/lib/modules/${_extramodules}/wl.ko"

	# makepkg does not do this automatically for this pkg so do it here
	gzip -9 "${pkgdir}/usr/lib/modules/${_extramodules}/wl.ko"
	install -Dm644 lib/LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 modprobe.d "${pkgdir}/usr/lib/modprobe.d/broadcom-wl_ck.conf"
}
