# Maintainer: Jack Chen <redchenjs@live.com>

pkgname=linuxqq
pkgver=2.0.0_b1_1024
pkgrel=8
pkgdesc='Tencent QQ for Linux'
arch=('x86_64' 'aarch64')
url='https://im.qq.com/linuxqq/'
license=('custom')
depends=(
    'gtk2'
)
source_x86_64=(
    'https://qd.myapp.com/myapp/qqteam/linuxQQ/linuxqq_2.0.0-b1-1024_x86_64.pkg.tar.xz'
)
sha512sums_x86_64=(
    'b430ee22c7d32f61982482e24ed47ad249c95ec5ba750b8d7537f880e3780a8513b101061511949245139fe122a582bdce87b784301de85e14593a8b4ad58866'
)
source_aarch64=(
    'https://qd.myapp.com/myapp/qqteam/linuxQQ/linuxqq_2.0.0-b1-1024_aarch64.rpm'
)
sha512sums_aarch64=(
    '4a979ca1e2ca29bb27e9b3bc01377dde28a25d370a5d792c9cd02d2d213d6e19cec334e627d288006d3168c37240c95228d5f9636378f99fcabe8d95710bc610'
)

package() {
    mv ${srcdir}/usr/ ${pkgdir}/

    mkdir -p ${pkgdir}/opt
    mv ${pkgdir}/usr/share/tencent-qq/ ${pkgdir}/opt/

    mkdir -p ${pkgdir}/usr/bin
    ln -s /opt/tencent-qq/qq ${pkgdir}/usr/bin/qq

    sed -i 's#/usr/share#/opt#' ${pkgdir}/usr/share/applications/qq.desktop
}
