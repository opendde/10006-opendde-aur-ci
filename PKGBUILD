# Maintainer: Lukasz Pozarlik <lpozarlik@gmail.com>

pkgname=nvidia-think
pkgver=361.28
_extramodules=extramodules-4.4-think
pkgrel=3
pkgdesc="NVIDIA drivers for linux-think kernel"
arch=('i686' 'x86_64')
url="http://www.nvidia.com/"
depends=('linux-think>=4.4' 
	 'linux-think<4.5'
   	 'nvidia-utils=361.28' 
	 'libgl')
makedepends=('linux-think-headers>=4.4')
license=('custom')
install=nvidia.install
options=(!strip)
source=("ftp://download.nvidia.com/XFree86/Linux-x86/${pkgver}/NVIDIA-Linux-x86-${pkgver}.run"
        "ftp://download.nvidia.com/XFree86/Linux-x86_64/${pkgver}/NVIDIA-Linux-x86_64-${pkgver}-no-compat32.run")

md5sums=('d4fc7fcf1204a46f15733d7cc2711ad2'
         '8799b9a29ea1ef72feb739f1d8290728')

[[ "$CARCH" = "i686" ]] && _pkg="NVIDIA-Linux-x86-${pkgver}"
[[ "$CARCH" = "x86_64" ]] && _pkg="NVIDIA-Linux-x86_64-${pkgver}-no-compat32"

prepare() {
    sh "${_pkg}.run" --extract-only
    # patches here
}

build() {
    _kernver="$(cat /usr/lib/modules/${_extramodules}/version)"
    cd "${_pkg}"/kernel
    make SYSSRC=/usr/lib/modules/"${_kernver}/build" module
    #if [[ "$CARCH" = "x86_64" ]]; then
    #    cd uvm
    #    make SYSSRC=/usr/lib/modules/"${_kernver}/build" module
    #fi	
}

package() {
    install -D -m644 "${srcdir}/${_pkg}/kernel/nvidia.ko" \
        "${pkgdir}/usr/lib/modules/${_extramodules}/nvidia.ko"

    install -D -m644 "${srcdir}/${_pkg}/kernel/nvidia-modeset.ko" \
	"${pkgdir}/usr/lib/modules/${_extramodules}/nvidia-modeset.ko"
    
    if [[ "$CARCH" = "x86_64" ]]; then
        install -D -m644 "${srcdir}/${_pkg}/kernel/nvidia-uvm.ko" \
            "${pkgdir}/usr/lib/modules/${_extramodules}/nvidia-uvm.ko"
    fi

    gzip "${pkgdir}/usr/lib/modules/${_extramodules}/"*.ko
    install -d -m755 "${pkgdir}/usr/lib/modprobe.d"
    #echo "blacklist nouveau" >> "${pkgdir}/usr/lib/modprobe.d/nvidia.conf"
}
