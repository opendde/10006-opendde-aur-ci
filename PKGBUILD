# Contributor: Alonso Rodriguez <alonsorodi20 (at) gmail (dot) com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: loqs
# Contributor: Dede Dindin Qudsy <xtrymind+gmail+com>
# Contributor: Ike Devolder <ike.devolder+gmail+com>

pkgbase=nvidia-390xx
pkgname=(nvidia-390xx nvidia-390xx-dkms)
pkgver=390.138
pkgrel=9
pkgdesc="NVIDIA drivers for linux, 390xx legacy branch"
arch=('x86_64')
url="https://www.nvidia.com/"
makedepends=("nvidia-390xx-utils=${pkgver}" 'libglvnd' 'linux-headers')
conflicts=('nvidia')
license=('custom')
options=('!strip')
_pkg="NVIDIA-Linux-x86_64-${pkgver}-no-compat32"
source=("https://us.download.nvidia.com/XFree86/Linux-x86_64/${pkgver}/${_pkg}.run"
        'kernel-4.16.patch'
        'kernel-5.8.patch'
        'kernel-5.9.patch'
        'https://gitlab.com/herecura/packages/nvidia-390xx-dkms/-/raw/db83ed8ac2e0e0097d535a82e2fd4ee0f31873e3/kernel-5.10.patch'
        'https://salsa.debian.org/nvidia-team/nvidia-graphics-drivers/-/raw/4ba8f0d0b7fc3e7c2cce19c23930b279c15280e5/debian/module/debian/patches/disable-module-nvidia-uvm.patch')
b2sums=('bf56cef38d76accdf547b96cd444b0bd4288f604d44a1d274f3246c13310d6a59050b36f384280edb83938db81fa0544f7a2dc84ff6f440ff90b76ee62749fc1'
        '1d21307640a3844752c92e8344518daf6ad62d846689bebe6eed4dcadbf7b2e742862f5c17c0faee7256662cb75e62e124d59e5a5617e87324e1f0658f2b748d'
        'dd3ce18cddc1984deffb94c999b4f086da2fac784fc09dc092efd2fb78b65200fadf90d13f6352226ebbf4aa99b4258aae722403b90ddd64eee1c942ef94114b'
        '7358919041a3d5df1cac50f6519b282abe7a344f07b59d52ab95a022ce0af12e743a1c194fd838b5733f3900e68c7f0756a528ac32255775f2ba830a2f052dec'
        '8d7c054ff08ed6212aa81f3db6597c1e016609bdddfb19161274e5e75b0ae8b5c5501740ca6a75367d152b16f8350319bd2577561aa796cfe49840c4bd2c2d5d'
        '435120fd87d901f36f4b3ed4d7d2a6a745185feb66506981b231071aec255b2bc91c536685e5c943ce17f07f4c52ca8086c08fa5c6367dddebc4b3c2493c32ae')

prepare() {
    sh "${_pkg}.run" --extract-only
    cd "${_pkg}"

    # Restore phys_to_dma support (still needed for 396.18) (and still needed for 390.138)
    # https://bugs.archlinux.org/task/58074
    patch -Np1 -i ../kernel-4.16.patch

    # 5.8 Patch
    patch -Np1 -i ../kernel-5.8.patch

    # 5.9 Patch, from loqs
    patch -Np1 -i ../kernel-5.9.patch

    # 5.10 Patch, from xtrymind and BlackIkeEagle
    patch -Np1 -i ../kernel-5.10.patch

    cp -a kernel kernel-dkms

    # 5.10 disable UVM, from Debian
    pushd kernel
    patch -Np1 -i ../../disable-module-nvidia-uvm.patch
    popd

    cp -a kernel kernel-dkms-noUVM

    cd kernel-dkms
    sed -i "s/__VERSION_STRING/${pkgver}/" dkms.conf
    sed -i 's/__JOBS/`nproc`/' dkms.conf
    sed -i 's/__DKMS_MODULES//' dkms.conf
    sed -i '$iBUILT_MODULE_NAME[0]="nvidia"\
DEST_MODULE_LOCATION[0]="/kernel/drivers/video"\
BUILT_MODULE_NAME[1]="nvidia-uvm"\
DEST_MODULE_LOCATION[1]="/kernel/drivers/video"\
BUILT_MODULE_NAME[2]="nvidia-modeset"\
DEST_MODULE_LOCATION[2]="/kernel/drivers/video"\
BUILT_MODULE_NAME[3]="nvidia-drm"\
DEST_MODULE_LOCATION[3]="/kernel/drivers/video"\
BUILD_EXCLUSIVE_KERNEL="^(4\\..*|5\\.[0-9]\\.."' dkms.conf

    # Gift for linux-rt guys
    sed -i 's/NV_EXCLUDE_BUILD_MODULES/IGNORE_PREEMPT_RT_PRESENCE=1 NV_EXCLUDE_BUILD_MODULES/' dkms.conf

    cd ../kernel-dkms-noUVM
    sed -i "s/__VERSION_STRING/${pkgver}/" dkms.conf
    sed -i 's/__JOBS/`nproc`/' dkms.conf
    sed -i 's/__DKMS_MODULES//' dkms.conf
    sed -i '$iBUILT_MODULE_NAME[0]="nvidia"\
DEST_MODULE_LOCATION[0]="/kernel/drivers/video"\
BUILT_MODULE_NAME[1]="nvidia-modeset"\
DEST_MODULE_LOCATION[1]="/kernel/drivers/video"\
BUILT_MODULE_NAME[2]="nvidia-drm"\
DEST_MODULE_LOCATION[2]="/kernel/drivers/video"\
BUILD_EXCLUSIVE_KERNEL="^5\\.10\\..*"' dkms.conf

    # Gift for linux-rt guys
    sed -i 's/NV_EXCLUDE_BUILD_MODULES/IGNORE_PREEMPT_RT_PRESENCE=1 NV_EXCLUDE_BUILD_MODULES/' dkms.conf
}

build() {
    cd "${_pkg}"/kernel
    make SYSSRC=/usr/src/linux module
}

package_nvidia-390xx() {
    pkgdesc="NVIDIA drivers for linux, 390xx legacy branch"
    depends=('linux' "nvidia-390xx-utils=${pkgver}" 'libglvnd')

    _extradir="/usr/lib/modules/$(</usr/src/linux/version)/extramodules"
    install -Dt "${pkgdir}${_extradir}" -m644 \
      "${srcdir}/${_pkg}/kernel"/nvidia{,-modeset,-drm}.ko

    find "${pkgdir}" -name '*.ko' -exec gzip -n {} +

    echo "blacklist nouveau" |
        install -Dm644 /dev/stdin "${pkgdir}/usr/lib/modprobe.d/${pkgname}.conf"

    install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 "${srcdir}/${_pkg}/LICENSE"
}

package_nvidia-390xx-dkms() {
    pkgdesc="NVIDIA driver sources for linux, 390xx legacy branch"
    depends=('dkms' "nvidia-390xx-utils=$pkgver" 'libglvnd')
    provides=("nvidia-390xx=$pkgver")
    conflicts+=('nvidia-390xx')

    cd ${_pkg}

    install -dm 755 "${pkgdir}"/usr/src
    cp -dr --no-preserve='ownership' kernel-dkms "${pkgdir}/usr/src/nvidia-${pkgver}"
    cp -dr --no-preserve='ownership' kernel-dkms-noUVM "${pkgdir}/usr/src/nvidia-noUVM-${pkgver}"

    echo "blacklist nouveau" |
        install -Dm644 /dev/stdin "${pkgdir}/usr/lib/modprobe.d/${pkgname}.conf"

    install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 "${srcdir}/${_pkg}/LICENSE"
}
