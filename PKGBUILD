# Maintainer: smlb <smlb at riseup dot net>

pkgname=dockd
pkgver=1.20
pkgrel=2
pkgdesc="Lenovo ThinkPad Dock Management Daemon"
arch=('i686' 'x86_64')
url="https://github.com/libthinkpad/dockd"
license=('BSD-2')
depends=('cmake' 'systemd' 'libthinkpad' 'libsystemd' 'libxrandr')
source=("http://thinkpads.org/ftp/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('a3606e57095cd536d636edc7541af9f4')

prepare () {
    mkdir -p "$srcdir/$pkgname-$pkgver/etc"
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}" || exit 1 
    cmake . -DCMAKE_INSTALL_PREFIX=/usr
    make 
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}" || exit 1 
    install -Dm644 ./${pkgname}.desktop -t "${pkgdir}"/etc/xdg/autostart
    install -Dm755 ./dockd "$pkgdir/usr/bin/$pkgname"
    install -Dm755 -d etc "$pkgdir/etc/$pkgname"
}

