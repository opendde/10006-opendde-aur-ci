# Maintainer : Bjoern Bidar - theodorstormgrade@gmail.com
     
pkgname=nvidia-pf
pkgver=370.28
pkgrel=9
_goodkver=4.8
_badkver=4.9
_modver=${_goodkver}-pf
_extramodules=extramodules-$_modver
_kernver="$(cat /usr/lib/modules/${_extramodules}/version)"
#_pf_headers=$(pacman -Qqo ${_SYSSRC})

pkgdesc="NVIDIA drivers for linux-pf."
arch=('i686' 'x86_64')
url="http://www.nvidia.com/"
makedepends=("linux-pf-headers>=${_goodkver}" "linux-pf-headers<${_badkver}")
depends=("linux-pf>=${_goodkver}" "linux-pf<${_badkver}" "nvidia-utils=${pkgver}")

conflicts=( 'nvidia-96xx' 'nvidia-173xx' 'nvidia-pf-core2' 'nvidia-pf-k8'
  'nvidia-pf-atom' 'nvidia-pf-psc' 'nvidia-pf-p4' 'nvidia-pf-p3'
 'nvidia-pf-pm' 'nvidia-pf-k7')
license=('custom')
install=nvidia.install
options=(!strip)
source_i686=("http://us.download.nvidia.com/XFree86/Linux-x86/${pkgver}/NVIDIA-Linux-x86-${pkgver}.run")
source_x86_64=("http://us.download.nvidia.com/XFree86/Linux-x86_64/${pkgver}/NVIDIA-Linux-x86_64-${pkgver}-no-compat32.run")
md5sums=('96a37004a3394b01385d3ea9d8e8fa86')
md5sums_i686=('7d3e1c691cd53852f422a93169268178')
md5sums_x86_64=('3bcd9a132e50a17b846869f1c57b9c75')



[[ "$CARCH" = "i686" ]] && _pkg="NVIDIA-Linux-x86-${pkgver}"
[[ "$CARCH" = "x86_64" ]] && _pkg="NVIDIA-Linux-x86_64-${pkgver}-no-compat32"
source+=('linux-4.8.patch')

prepare()
{
  cd "${srcdir}"
  [[ -d "${_pkg}" ]] && rm -rf "${_pkg}"
  sh "${_pkg}.run" --extract-only
  cd "${_pkg}"
  # patches here
  patch -Np0 -i "$srcdir"/linux-4.8.patch

}

build() {
  _kernver="$(cat /usr/lib/modules/${_extramodules}/version)"
  cd "${_pkg}"/kernel
  make SYSSRC=/usr/lib/modules/"${_kernver}/build" module
}


package() {
  install -D -m644 "${srcdir}/${_pkg}/kernel/nvidia.ko" \
          "${pkgdir}/usr/lib/modules/${_extramodules}/nvidia.ko"
  install -D -m644 "${srcdir}/${_pkg}/kernel/nvidia-modeset.ko" \
          "${pkgdir}/usr/lib/modules/${_extramodules}/nvidia-modeset.ko"
  install -D -m644 "${srcdir}/${_pkg}/kernel/nvidia-drm.ko" \
         "${pkgdir}/usr/lib/modules/${_extramodules}/nvidia-drm.ko"


  if [[ "$CARCH" = "x86_64" ]]; then
      install -D -m644 "${srcdir}/${_pkg}/kernel/nvidia-uvm.ko" \
              "${pkgdir}/usr/lib/modules/${_extramodules}/nvidia-uvm.ko"
  fi

  gzip "${pkgdir}/usr/lib/modules/${_extramodules}/"*.ko
  install -d -m755 "${pkgdir}/usr/lib/modprobe.d"
  
  sed -i -e "s/EXTRAMODULES='.*'/EXTRAMODULES='${_extramodules}'/" "${startdir}/nvidia.install"
  echo "blacklist nouveau" >> "${pkgdir}/usr/lib/modprobe.d/nvidia-pf.conf"
}

