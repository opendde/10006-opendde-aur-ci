# Maintainer: Franck STAUFFER <franck.stauffer@monaco.mc>

pkgname=zelda-alttd-git
pkgver=r3950.4e3c25a2
pkgrel=1
pkgdesc="The Legend of Zelda: A Link to the Dream - Remake of The Legend of Zelda: Link's Awakening (Git version)"
arch=('any')
url='https://www.solarus-games.org/fr/games/the-legend-of-zelda-a-link-to-the-dream'
license=('custom')
depends=('solarus>=1.6.0')
makedepends=('cmake' 'zip')
source=("$pkgname::git+https://gitlab.com/zeldaforce/zelda-alttd.git"
        "$pkgname.desktop"
        "$pkgname.png")
b2sums=('SKIP'
        '3a46c6f5b6c14a2e767116a16eb7b33c62944a844946f737fc51688056554d5b98796b1fabfa355b66f49bb44c946d37be703fd96e2f7f192223cf2e63584c7a'
        'b23c6aa20af637e4ae09519f8b770f19ea8f1f774615c8a141b521d1ce859f738c43cf56cc3a0c799a736cdb310415ac576e9afe8b21c95451c8b818226e2442')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

prepare() {
    sed -i 's/set(quest_name "zelda-alttd")/set(quest_name "zelda-alttd-git")/' "$pkgname/CMakeLists.txt"
}

build() {
  cd "$pkgname"
  cmake -DCMAKE_INSTALL_PREFIX='/usr' .
  make
}

package() {
  install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"

  cd "$pkgname"
  make DESTDIR="$pkgdir/" install
}
