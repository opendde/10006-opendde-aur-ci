# Maintainer: Johannes Pfrang <johannespfrang+arch @ gmail.com>
# Co-Maintainer: Emanuele 'Lele aka eldios' Calo' <xeldiosx@gmail.com>
# Co-Maintainer: Ariel AxionL <arielaxionl@gmail.com | axionl@aosc.io>

pkgname=teleport-bin
pkgver=6.0.1
pkgrel=1
pkgdesc="Modern SSH server for teams managing distributed infrastructure"
arch=('x86_64' 'armv7')
url="https://github.com/gravitational/teleport"
license=('Apache')
depends=('bash' 'python')
provides=('teleport' 'tctl' 'tsh')
install=teleport.install

source=("teleport.service"
        "teleport@.service"
        "teleport.install")

source_x86_64=("teleport-bin-${pkgver}-${CARCH}.tar.gz::https://get.gravitational.com/teleport-v${pkgver}-linux-amd64-bin.tar.gz")

source_armv7=("teleport-bin-${pkgver}-${CARCH}.tar.gz::https://get.gravitational.com/teleport-v${pkgver}-linux-arm-bin.tar.gz")

sha256sums=('22fd1ee136e9422458740811c9946de447105f26e87dbbc8daa35d17bd1f3894'
            '21ca4e56c9c5e1ce11570894e85ded853e26e91cc2e16ed9114b3d6a2c5c22ef'
            'cff4e3c69677210bdde9a781146df06fba3a62cef72ed6854cd1923a05444435')
sha256sums_x86_64=('d8463472ba2cfe34c77357bf16c02c0f7a381a7610ede81224ee8d064f908177')
sha256sums_armv7=('d8463472ba2cfe34c77357bf16c02c0f7a381a7610ede81224ee8d064f908177')

options=(!strip)

package() {
    install -Dm644 ${srcdir}/teleport.service "${pkgdir}/usr/lib/systemd/system/teleport.service"
    install -Dm644 ${srcdir}/teleport.service "${pkgdir}/usr/lib/systemd/system/teleport@.service"
    install -dm755 "${pkgdir}/etc/teleport"

    cd "${srcdir}/teleport"
    install -Dm755 teleport "${pkgdir}/usr/bin/teleport"
    install -Dm755 tctl "${pkgdir}/usr/bin/tctl"
    install -Dm755 tsh "${pkgdir}/usr/bin/tsh"

    cp -r examples "${pkgdir}/etc/teleport/"
}
