# Maintainer: William Gathoye <william at gathoye dot be>
# Contributor: Emil Vanherp <emil dot vanherp at hotmail dot com>
# Contributor: Alad Wenter <https://wiki.archlinux.org/index.php/Special:EmailUser/Alad>
# Contributor: Xavier D. <magicrhesus at ouranos dot be>
# Contributor: Valere Monseur <valere dot monseur at ymail dot com>

pkgname=eid-mw
pkgver=4.1.21
pkgrel=2

pkgdesc="eID Middleware is the middleware for the Belgian electronic identity card"
arch=('i686' 'x86_64')
url=http://eid.belgium.be/
license=('LGPL3')

depends=('pcsclite' 'gtk2')
optdepends=(
    'firefox: extension for Belgian eid'
    'acsccid: ACS CCID smart card readers'
    'ccid: A generic USB Chip/Smart Card Interface Devices driver'
    'pcsc-tools: PC/SC smartcard tools')

# Do not try to have spaces or actually anything that is known to break parsing.
# https://goo.gl/fqwbSi
DLAGENTS=("http::/usr/bin/curl -A 'ArchLinux' -fLC - --retry 3 --retry-delay 3 -o %o %u")
source=(
    "http://eid.belgium.be/sites/default/files/downloads/$pkgname-$pkgver-v$pkgver.tar.gz"
)
sha512sums=(
    adcf6678754d366492c66e91cfefe6b950ca5aa601c55bb146998a9265aec90b3832e1514cbf905a5b13a1e3d27a28338ba36e7cab4ef62e506f1ae5e9bab9da
)

# There is no .asc signature file on the server.
# validpgpkeys=(
#     B37D9040098C3DEEE00F6D08A35743EA6773D225 # Belgian eID Automatic Signing Key (official releases)
#     # If you trust it, you can import it with
#     # gpg --recv-keys B37D9040098C3DEEE00F6D08A35743EA6773D225
# )

build() {
	cd "$pkgname-$pkgver-v$pkgver"
	./configure --prefix=/usr --libexecdir=/usr/bin
	make
}

package() {
	cd "$pkgname-$pkgver-v$pkgver"
	make install DESTDIR="$pkgdir"
}
