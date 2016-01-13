# Maintainer: FadeMind <fademind@gmail.com>
# Contributor: Rouven Rastetter <r3ddr4gon@firaweb.de>
# Contributor: Mikael Eriksson <mikael_eriksson@miffe.org>
# Contributor: Cian Mc Govern <cianmcgovern91@gmail.com>
# Contributor: Tom Englund <tomenglund26@gmail.com>

pkgbase=nvidia-mainline
pkgname=(nvidia-mainline nvidia-mainline-dkms)
pkgver=361.18
_extramodules=extramodules-4.4-mainline
pkgrel=1
pkgdesc="NVIDIA drivers for linux-mainline"
arch=('i686' 'x86_64')
url="http://www.nvidia.com/"
makedepends=('nvidia-libgl' "nvidia-utils=${pkgver}" 'linux-mainline' 'linux-mainline-headers>=4.4rc1' 'linux-mainline-headers<4.5rc1')
license=('custom')
options=('!strip')
source_i686=("http://us.download.nvidia.com/XFree86/Linux-x86/${pkgver}/NVIDIA-Linux-x86-${pkgver}.run")
source_x86_64=("http://us.download.nvidia.com/XFree86/Linux-x86_64/${pkgver}/NVIDIA-Linux-x86_64-${pkgver}-no-compat32.run")
md5sums_i686=('ade4f7d0a5631ff492088671bc303a0a')
md5sums_x86_64=('29a88f1538d622cebf751593396053e4')

[[ "$CARCH" = "i686" ]] && _pkg="NVIDIA-Linux-x86-${pkgver}"
[[ "$CARCH" = "x86_64" ]] && _pkg="NVIDIA-Linux-x86_64-${pkgver}-no-compat32"

prepare() {
    sh "${_pkg}.run" --extract-only
    cd "${_pkg}"
    # patches here

    cp -a kernel kernel-dkms
    cd kernel-dkms
    sed -i "s/__VERSION_STRING/${pkgver}/" dkms.conf
    sed -i 's/__JOBS/`nproc`/' dkms.conf
    sed -i 's/__DKMS_MODULES//' dkms.conf
    sed -i '$iBUILT_MODULE_NAME[0]="nvidia"\
DEST_MODULE_LOCATION[0]="/kernel/drivers/video"\
BUILT_MODULE_NAME[1]="nvidia-uvm"\
DEST_MODULE_LOCATION[1]="/kernel/drivers/video"\
BUILT_MODULE_NAME[2]="nvidia-modeset"\
DEST_MODULE_LOCATION[2]="/kernel/drivers/video"' dkms.conf
}

build() {
    _kernver="$(cat /usr/lib/modules/${_extramodules}/version)"
    cd "${_pkg}"/kernel
    make SYSSRC=/usr/lib/modules/"${_kernver}/build" module
}

package_nvidia-mainline() {
    pkgdesc="NVIDIA drivers for linux-mainline"
    depends=('linux-mainline>=4.4rc1' 'linux-mainline<4.5rc1' "nvidia-utils=${pkgver}" 'libgl')
    install=nvidia.install

    install -D -m644 "${srcdir}/${_pkg}/kernel/nvidia.ko" \
        "${pkgdir}/usr/lib/modules/${_extramodules}/nvidia.ko"
    install -D -m644 "${srcdir}/${_pkg}/kernel/nvidia-modeset.ko" \
         "${pkgdir}/usr/lib/modules/${_extramodules}/nvidia-modeset.ko"

    if [[ "$CARCH" = "x86_64" ]]; then
        install -D -m644 "${srcdir}/${_pkg}/kernel/nvidia-uvm.ko" \
            "${pkgdir}/usr/lib/modules/${_extramodules}/nvidia-uvm.ko"
    fi

    gzip "${pkgdir}/usr/lib/modules/${_extramodules}/"*.ko
    sed -i -e "s/EXTRAMODULES='.*'/EXTRAMODULES='${_extramodules}'/" "${startdir}/nvidia.install"
    install -d -m755 "${pkgdir}/usr/lib/modprobe.d"

    if [ ! -f /usr/lib/modprobe.d/nvidia.conf ]; then
        echo "blacklist nouveau" > "${pkgdir}/usr/lib/modprobe.d/nvidia.conf"
    fi
}

package_nvidia-mainline-dkms() {
    pkgdesc="NVIDIA driver sources for linux-mainline"
    depends=('dkms' "nvidia-utils=$pkgver" 'libgl')
    conflicts+=('nvidia-mainline')
    install=nvidia-dkms.install

    cd ${_pkg}
    install -dm 755 "${pkgdir}"/usr/{lib/modprobe.d,src}
    cp -dr --no-preserve='ownership' kernel-dkms "${pkgdir}/usr/src/nvidia-mainline-${pkgver}"
    if [ ! -f /usr/lib/modprobe.d/nvidia.conf]; then
        echo "blacklist nouveau" > "${pkgdir}/usr/lib/modprobe.d/nvidia.conf"
    fi
}
