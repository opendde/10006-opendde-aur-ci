# Maintainer: Vimsucks <dev@vimsucks.com>

pkgname=frp
pkgver=0.21.0
pkgrel=2
pkgdesc="A fast reverse proxy to help you expose a local server behind a NAT or firewall to the internet."
license=('Apache')
url="https://github.com/fatedier/frp"
arch=('x86_64' 'i686' 'arm')
source=(frps.service frpc.service frps@.service frpc@.service)
source_x86_64=("https://github.com/fatedier/frp/releases/download/v${pkgver}/frp_${pkgver}_linux_amd64.tar.gz")
source_i686=("https://github.com/fatedier/frp/releases/download/v${pkgver}/frp_${pkgver}_linux_386.tar.gz")
source_arm=("https://github.com/fatedier/frp/releases/download/v${pkgver}/frp_${pkgver}_linux_arm.tar.gz")
md5sums=('6f9c6681357f3f984983457151d7f0c5'
         'e3bfa7c428433fa6cbb5aa64515d8899'
         '346fabd46c12c039e39a26986629bc6d'
         'dd170d972b1ea8c681bde054dbebf888')
md5sums_x86_64=('396e4452e4550a74e9dff96942a8527f')
md5sums_i686=('ecba717f8c73ef6f47dfc673f92fd08b')
md5sums_arm=('0e64a76e753fb62ac08093a117c81c50')
install=$pkgname.install
backup=(etc/frp/{frpc.ini,frps.ini,frpc_full.ini,frps_full.ini})

package() {
    case $CARCH in
        x86_64)ARCH=amd64
            ;;
        i686)ARCH=386
            ;;
        arm)ARCH=arm
            ;;
    esac
    frpdir=$srcdir/frp_${pkgver}_linux_${ARCH}

    mkdir -p $pkgdir/usr/bin
    install -m755  $frpdir/frpc $pkgdir/usr/bin/frpc
    install -m755  $frpdir/frps $pkgdir/usr/bin/frps

    mkdir -p $pkgdir/etc/frp
    install -Dm644 $frpdir/frpc.ini $pkgdir/etc/frp/frpc.ini
    install -Dm644 $frpdir/frpc_full.ini $pkgdir/etc/frp/frpc_full.ini
    install -Dm644 $frpdir/frps.ini $pkgdir/etc/frp/frps.ini
    install -Dm644 $frpdir/frps_full.ini $pkgdir/etc/frp/frps_full.ini

    install -Dm644 $frpdir/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE

    install -Dm644 frps.service  $pkgdir/usr/lib/systemd/system/frps.service
    install -Dm644 frpc.service  $pkgdir/usr/lib/systemd/system/frpc.service
    install -Dm644 frps@.service  $pkgdir/usr/lib/systemd/system/frps@.service
    install -Dm644 frpc@.service  $pkgdir/usr/lib/systemd/system/frpc@.service
}
