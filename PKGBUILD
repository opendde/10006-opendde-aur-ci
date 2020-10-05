# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname=jackett-runit
pkgver=0.16.1583
pkgrel=1
pkgdesc='Use many torrent trackers with software that supports torznab/potato feeds.'
arch=('x86_64' 'aarch64' 'armv7h')
license=('GPL')
url='https://github.com/Jackett/Jackett'
conficts=('systemd' 'openrc' 's6' 'jackett' 'jackett-mono')
conficts=('systemd' 'openrc' 's6')
options=('!strip' 'staticlibs')

source=("run"
        "jackett.sysusers"
        "jackett.tmpfiles")

source_x86_64=("Jackett.Binaries.LinuxAMDx64-${pkgver}.tar.gz::https://github.com/Jackett/Jackett/releases/download/v${pkgver}/Jackett.Binaries.LinuxAMDx64.tar.gz")
source_aarch64=("Jackett.Binaries.LinuxARM64-${pkgver}.tar.gz::https://github.com/Jackett/Jackett/releases/download/v${pkgver}/Jackett.Binaries.LinuxARM64.tar.gz")
source_armv7h=("Jackett.Binaries.LinuxARM32-${pkgver}.tar.gz::https://github.com/Jackett/Jackett/releases/download/v${pkgver}/Jackett.Binaries.LinuxARM32.tar.gz")

sha256sums=('059bc873d8203983335b9fbe3e275e25b340b83c4ce9e54d6fabbc8a6c17f15b'
            'd005fcd009ec5404e1ec88246c31e664167f5551d6cabc35f68eb41750bfe590'
            '64022e15565a609f449090f02d53ee90ef95cffec52ae14f99e4e2132b6cffe1')
sha256sums_x86_64=('b1b6c54f4e81f522279f7ded42df4bc9ed651ae32df55d0ceae7a6ea37ded9d6')
sha256sums_aarch64=('99f4b894cd705da4570ff8ce86ca6c955e0cae8a7b7fd46d06a40c5c9190b8d1')
sha256sums_armv7h=('21468497995ee981061b984427217d335c1e93923dc63b006e13fbe008eeb62b')



package() {
    cd "$srcdir"

    install -d -m 755 "${pkgdir}/usr/lib/jackett/"
    cp -r "${srcdir}/Jackett/"* "${pkgdir}/usr/lib/jackett/"

    #install -D -m 644 "${srcdir}/jackett.service" "${pkgdir}/usr/lib/systemd/system/jackett.service"
    install -D -m 644 "${srcdir}/jackett.sysusers" "${pkgdir}/usr/lib/sysusers.d/jackett.conf"
    install -D -m 644 "${srcdir}/jackett.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/jackett.conf"
    install -D -m 644 "${srcdir}/run" "${pkgdir}/etc/runit/sv/jackett/run"
    chmod +x "${pkgdir}/etc/runit/sv/jackett/run"
}
