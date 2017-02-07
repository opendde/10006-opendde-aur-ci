# Maintainer: William Gathoye <william at gathoye dot be>
# Contributor: Emil Vanherp <emil dot vanherp at hotmail dot com>
# Contributor: Alad Wenter <https://wiki.archlinux.org/index.php/Special:EmailUser/Alad>
# Contributor: Xavier D. <magicrhesus at ouranos dot be>
# Contributor: Valere Monseur <valere dot monseur at ymail dot com>

pkgname=eid-mw
pkgver=4.2.0
pkgrel=3

pkgdesc='The middleware, viewer and Firefox extension for the Belgian electronic identity card (Belgian eID)'
arch=('i686' 'x86_64')
url='http://eid.belgium.be/'
license=('LGPL3')

depends=('pcsclite' 'gtk3' 'libproxy')
optdepends=(
    'firefox: extension for Belgian eid'
    'acsccid: ACS CCID smart card readers'
    'ccid: A generic USB Chip/Smart Card Interface Devices driver'
    'pcsc-tools: PC/SC smartcard tools')
conflicts=('eid-viewer')
replaces=('eid-viewer')

source=(
    "https://dist.eid.belgium.be/continuous/sources/$pkgname-$pkgver-v$pkgver.tar.gz"{,.asc}
)
sha512sums=(
    01aeba0450a57a82b4c51ed1fa611f92a32a06cf8cc735e0cd5f93693646e2e6e514e699c22855ab361789f9748dfed5ee51dc14deb5b8e3fc0b3ac4c8bc76c5
    52c112cfe2b81c53cf8891bd71a2cf5de8de7aea70555cba17b8da182f632eb6b6f645c587bc6796b8d09a141182f430285f0429558837a92635e32e8966692b
)

validpgpkeys=(
    D95426E309C0492990D8E8E2824A5E0010A04D46 # Belgian eID Automatic Signing Key (continuous builds)
    # If you trust it, you can import it with
    # gpg --recv-keys D95426E309C0492990D8E8E2824A5E0010A04D46
)

build() {
    cd "$pkgname-$pkgver-v$pkgver"
    ./configure --prefix=/usr --libexecdir=/usr/bin
    make
}

package() {
    cd "$pkgname-$pkgver-v$pkgver"
    make install DESTDIR="$pkgdir"
}
