# $Id: PKGBUILD 150197 2012-02-14 11:22:48Z ibiru $
# Maintainer : Claire Farron

pkgname=nvidia-lts310-ck
pkgver=355.11
_extramodules=extramodules-3.10-lts310-ck
pkgrel=5
pkgdesc="NVIDIA drivers for linux-lts310-ck"
arch=('i686' 'x86_64')
url="http://www.nvidia.com/"
depends=('linux-lts310-ck' "nvidia-utils=$pkgver" 'nvidia-libgl')
makedepends=('linux-lts310-ck-headers')
provides=('nvidia')
license=('custom')
install=nvidia-lts310-ck.install
options=(!strip)

source_i686+=("ftp://download.nvidia.com/XFree86/Linux-x86/${pkgver}/NVIDIA-Linux-x86-${pkgver}.run")
source_x86_64+=("ftp://download.nvidia.com/XFree86/Linux-x86_64/${pkgver}/NVIDIA-Linux-x86_64-${pkgver}-no-compat32.run")
sha256sums_i686=('94ce6b879581b931b84d83a9111040b9a5aa9306b012b4380cd93f6ffede3066')
sha256sums_x86_64=('0fcc6a62a05fc11344aff375faaca56b358ee1252f6b2c98c00d628ea3d0f842')
[[ "$CARCH" = "i686" ]] && _pkg="NVIDIA-Linux-x86-${pkgver}"
[[ "$CARCH" = "x86_64" ]] && _pkg="NVIDIA-Linux-x86_64-${pkgver}-no-compat32"

prepare() {
    sh "${_pkg}.run" --extract-only
}

build() {
  _kernver="$(cat /usr/lib/modules/${_extramodules}/version)"
  cd "${_pkg}/kernel"
  make SYSSRC=/usr/lib/modules/${_kernver}/build module
}

package() {
  install -D -m644 "${srcdir}/${_pkg}/kernel/nvidia.ko" \
    "${pkgdir}/usr/lib/modules/${_extramodules}/kernel/drivers/video/nvidia.ko"
  if [[ $CARCH = x86_64 ]]; then
    install -D -m644 "${srcdir}/${_pkg}/kernel/nvidia-uvm.ko" \
      "${pkgdir}/usr/lib/modules/${_extramodules}/kernel/drivers/video/nvidia-uvm.ko"
  fi
  gzip "${pkgdir}/usr/lib/modules/${_extramodules}/kernel/drivers/video/"*.ko
  install -d -m755 "${pkgdir}/usr/lib/modprobe.d"
  echo "blacklist nouveau" >> "${pkgdir}/usr/lib/modprobe.d/nvidia-lts310-ck.conf"
  echo "blacklist nvidiafb" >> "${pkgdir}/usr/lib/modprobe.d/nvidia-lts310-ck.conf"
  install -D -m644 "${srcdir}/${_pkg}/LICENSE" "${pkgdir}/usr/share/licenses/nvidia-lts310-ck/LICENSE"
}
