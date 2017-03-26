# Maintainer: William Gathoye <william at gathoye dot be>
# Contributor: Emil Vanherp <emil dot vanherp at hotmail dot com>
# Contributor: Alad Wenter <https://wiki.archlinux.org/index.php/Special:EmailUser/Alad>
# Contributor: Xavier D. <magicrhesus at ouranos dot be>
# Contributor: Valere Monseur <valere dot monseur at ymail dot com>

pkgname=eid-mw
pkgver=4.2.5
pkgrel=1

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

# Have to use a custom user agent, as the Belgian eID production server is
# still experiencing this bug
# https://twitter.com/Ewokske/status/826766200990466048
# Do not try to have spaces or actually anything that is known to break
# parsing in the user agent. So please let -A ArchLinux as it.
# src.: Arch Linux Wiki: https://goo.gl/fqwbSi
DLAGENTS=("https::/usr/bin/curl -A 'ArchLinux' -fLC - --retry 3 --retry-delay 3 -o %o %u")
source=(
    "https://eid.belgium.be/sites/default/files/downloads/$pkgname-$pkgver-v$pkgver.tar.gz"
)
sha512sums=(
    bbdea1911e52aeb17efa3bd27d8b4c9bc893eb479acd188d142cad8ae5076e32ab91bb0f63790caab0bc2f4823b90b4b85fcf506fb84bdd02b89d3b8a05af8c9
)

# asc file not present yet, waiting for the bug report I filled to be solved.
#validpgpkeys=(
#    # Belgian eID Automatic Signing Key (official releases)
#    # If you trust it, you can import it with
#    # gpg --recv-keys B37D9040098C3DEEE00F6D08A35743EA6773D225
#    # src.: https://eid.belgium.be/en/using_your_eid/installing_the_eid_software/linux
#    B37D9040098C3DEEE00F6D08A35743EA6773D225
#)

build() {
    cd "$pkgname-$pkgver-v$pkgver"
    ./configure --prefix=/usr --libexecdir=/usr/bin
    make
}

package() {
    cd "$pkgname-$pkgver-v$pkgver"
    make install DESTDIR="$pkgdir"
}
