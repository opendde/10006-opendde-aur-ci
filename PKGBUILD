pkgname=altserver
pkgver=0.0.2
pkgrel=1
pkgdesc='AltServer for Linux'
license=('GPL')
arch=('x86_64')
url="https://github.com/NyaMisty/AltServer-Linux"
source=(${pkgname}.service
        "AltServer-${pkgver}::https://github.com/NyaMisty/AltServer-Linux/releases/download/v${pkgver}/AltServer")

package() {
    install -Dm755 "AltServer-${pkgver}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
}
sha256sums=('3d5b1c66a9959aa42eea5db7222768236b8a52f6a9caa3bbad7a5404506ffa4e'
            '523b501904742fed3cb347dca65fcc78f8d25d079c7f2ea45ec61ff50b481653')
