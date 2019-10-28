# Maintainer: Jack Chen <redchenjs@live.com>

pkgname=linuxqq
pkgver=2.0.0
pkgrel=7
pkgdesc='Tencent QQ for Linux'
arch=('x86_64' 'aarch64')
url='https://im.qq.com/linuxqq/'
license=('custom')
depends=('gtk2')
optdepends=('tint2')
source_x86_64=('https://qd.myapp.com/myapp/qqteam/linuxQQ/linuxqq_'${pkgver}'-b1-1024_x86_64.pkg.tar.xz')
md5sums_x86_64=('d7d7d3666a46dc8e0cf24f8252974da1')
source_aarch64=('https://qd.myapp.com/myapp/qqteam/linuxQQ/linuxqq_'${pkgver}'-b1-1024_aarch64.rpm')
md5sums_aarch64=('f37c3d05edc3764cf7837354971f5656')

package() {
    mv ${srcdir}/usr/ ${pkgdir}/

    mkdir -p ${pkgdir}/opt
    mv ${pkgdir}/usr/share/tencent-qq/ ${pkgdir}/opt/
    sed -i 's#/usr/share#/opt#' ${pkgdir}/usr/share/applications/qq.desktop

    mkdir -p ${pkgdir}/usr/bin
    ln -s /opt/tencent-qq/qq ${pkgdir}/usr/bin/qq
}
