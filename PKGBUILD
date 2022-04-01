# Maintainer: schuay <jakob.gruber@gmail.com>

pkgname=pcurses
pkgver=5
pkgrel=5
pkgdesc='A curses package management tool using libalpm'
arch=('x86_64')
url="https://github.com/schuay/$pkgname"
license=('GPL2')
depends=('ncurses' 'pacman')
makedepends=('boost' 'cmake')
source=(
 "$pkgname-$pkgver.tar.gz::https://github.com/schuay/pcurses/archive/refs/tags/${pkgname}-${pkgver}.tar.gz"
 "${pkgname}-5-ncurses_6.3.patch"
)
sha512sums=('21700041eee3edd73f5321e03a7700abf0cf78b2c22675a7e2076b49a58ba6c77cb66fa0b81297c64347549a459143b803ca82183f0be7d8192406ffc45e2393'
            'b873fdffd56edd3e506196829327826194cc20be162c266531899a017e3ec801e21a979b3f53799467761fe4ea3c65f5180751ec23582147840b28cc12a37aaa')
b2sums=('1f0d1abe65713acac4a1ef4d5fa25656b1eb93fc699720f694114f97c3a90b173948a3085d791a1cc00487354290608a1f726b2dbd94f12aa54f0d27d4747c3b'
        'b4020c24e77bd324603d5b0d5c20368a966f3158711035dc7e70914da8ad97140d3aeb6576174d9c191f4dfc3cb4efd273802a6f98750881a10d771e5d015fa7')

prepare() {
  cd "${pkgname}-${pkgname}-${pkgver}"
  patch -Np1 -i ../"${pkgname}-5-ncurses_6.3.patch"
}

build() {
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=None \
        -W no-dev \
        -B build \
        -S "${pkgname}-${pkgname}-${pkgver}"
  make VERBOSE=1 -C build
}

package() {
  make DESTDIR="$pkgdir" install -C build
}

# vim:set ts=2 sw=2 et:
