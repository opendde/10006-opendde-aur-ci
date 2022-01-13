# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=coredns-bin
pkgver=1.8.6
pkgrel=1
pkgdesc="A DNS server that chains plugins (official binary version)"
arch=('x86_64' 'aarch64')
conflicts=('coredns')
url="https://github.com/coredns/coredns"
license=('Apache')
provides=('coredns')
source=(coredns.service
        coredns-sysusers.conf)
source_x86_64=(coredns_${pkgver}.tar.gz::https://github.com/coredns/coredns/releases/download/v${pkgver}/coredns_${pkgver}_linux_amd64.tgz)
source_aarch64=(coredns_${pkgver}.tar.gz::https://github.com/coredns/coredns/releases/download/v${pkgver}/coredns_${pkgver}_linux_arm64.tgz)
sha256sums=('030cd8e938c293c11a9acdb09b138f98b37874772072336792ec4bf0d9eff9b1'
            '536d03f8b20b0d2d6e8f96edd7e4e4dd7f6fef39ab0e952522d8725f3cc186b7')
sha256sums_x86_64=('b97ce1a3ca01a0f5687dbc825ed4d8fd3ec14ed71b3abe0bc8b9bcc4cc4d337b')
sha256sums_aarch64=('e6e4667c237e3355c3a611c1dc59e3fc83a49c23d1034a8c1bb14a0aebf8410e')

package() {
    install -Dm755 "$srcdir/coredns" "$pkgdir/usr/bin/coredns"
    install -Dm644 "$srcdir/coredns.service" "$pkgdir/usr/lib/systemd/system/coredns.service"
    install -Dm644 "$srcdir/coredns-sysusers.conf" "$pkgdir/usr/lib/sysusers.d/coredns.conf"
    install -d "${pkgdir}/etc/coredns"
}
