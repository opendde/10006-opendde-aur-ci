# Maintainer:  TEL.RED LLC <linux_at_tel_d0t_red>

pkgname=sky
pkgver=2.1.6821
pkgrel=201706131006
pkgdesc="Lync and Skype for Business client on Linux"

arch=(
	'x86_64'
)
if [[ $CARCH == 'x86_64' ]]; then
	_arch=64
fi

url="http://tel.red"

license=('custom: Copyright © 2015-2017 TEL.RED LLC')
options=()
install="${pkgname}.install"

depends=(
	'curl'
	'ffmpeg'
	'libxcursor'
	'libxinerama'
	'libxkbfile'
	'libxrandr'
	'libxss'
	'libxv'
	'qt5-base>=5.6'
	'qt5-base<5.10'
)
makedepends=(
	'binutils'
	'tar'
	'xz'
)

source_x86_64=("https://tel.red/linux/sky-archlinux-${pkgver}-${pkgrel}-x86_64.pkg.tar.xz")
sha256sums_x86_64=('9da98166bbb6a4a6a802db4f59ad3dfefd3c79d858ece4cd052035cd18f25935')

package() {
	local _sky_libdir="/usr/lib/sky/lib64"
	local _sky_bindir="/usr/lib/sky"
	local _sky_datadir=( "${_sky_bindir}/sounds" )

	cd "${pkgdir}"
	tar -Jxf "${srcdir}/sky-archlinux-${pkgver}-${pkgrel}-x86_64.pkg.tar.xz"
	find "${pkgdir}" -maxdepth 1 -type f -delete
}

# vim: set ts=2 sw=2 ft=sh noet:
