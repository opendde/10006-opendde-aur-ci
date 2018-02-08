# Maintainer: graysky <graysky AT archlnux.us>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contrubutor: Thomas Baechler <thomas@archlinux.org>

pkgname=nvidia-ck
pkgver=390.25
pkgrel=2
epoch=1
_extramodules=extramodules-4.14-ck
_pkgdesc="NVIDIA drivers for linux-ck."
pkgdesc="$_pkgdesc"
arch=('x86_64')
url="http://www.nvidia.com/"
depends=('linux-ck>=4.14' 'linux-ck<4.15' 'libgl' "nvidia-utils=${pkgver}")
makedepends=('linux-ck-headers>=4.14' 'linux-ck-headers<4.15' 'nvidia-libgl')
conflicts=('nvidia-340xx-ck')
#groups=('ck-generic')
#replaces=()
license=('custom')
options=(!strip)
source=("http://us.download.nvidia.com/XFree86/Linux-x86_64/${pkgver}/NVIDIA-Linux-x86_64-${pkgver}-no-compat32.run")
sha256sums=('02263bc81b66e68fc8224447b249f4f0ca4ae201c467e236d917be2fe187f3d6')
_pkg="NVIDIA-Linux-x86_64-${pkgver}-no-compat32"

prepare() {
    sh "${_pkg}.run" --extract-only
    cd "${_pkg}"
}

build() {
	_kernver="$(cat /usr/lib/modules/${_extramodules}/version)"
	cd "${_pkg}"/kernel
	make SYSSRC=/usr/lib/modules/"${_kernver}/build" module
}

package() {
  install -Dt "${pkgdir}/usr/lib/modules/${_extramodules}" -m644 \
    "${srcdir}/${_pkg}/kernel"/nvidia{,-modeset,-drm,-uvm}.ko

	find "${pkgdir}" -name '*.ko' -exec gzip -n {} +

  echo "blacklist nouveau" |
    install -Dm644 /dev/stdin "${pkgdir}/usr/lib/modprobe.d/nvidia-ck.conf"
}

# vim:set ts=2 sw=2 et:
