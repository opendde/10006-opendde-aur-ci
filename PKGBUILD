pkgname=fheroes2
pkgver=0.9.13
pkgrel=1
pkgdesc="Free Heroes of Might and Magic II (fheroes2) is a recreation of HoMM2 game engine"
arch=('i686' 'x86_64' 'armv7h')
url="https://ihhub.github.io/fheroes2/"
license=('GPL2')
depends=('sdl2' 'sdl2_image' 'sdl2_mixer')
optdepends=('curl: download demo version files'
            'wget: download demo version files'
            'unzip: unpack demo version files')
makedepends=('gettext')
conflicts=('fheroes2-git' 'fheroes2-svn')
source=(
  $pkgname-$pkgver.tar.gz::https://github.com/ihhub/$pkgname/archive/$pkgver.tar.gz
)
md5sums=(
  '1b52800bf3fd40d21959ba324fe99a1d'
)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  export CFLAGS+=' -DCONFIGURE_FHEROES2_DATA=\"/usr/share/fheroes2\"'
  export CXXFLAGS+=' -DCONFIGURE_FHEROES2_DATA=\"/usr/share/fheroes2\"'
  make FHEROES2_IMAGE_SUPPORT=1
  make -C files/lang
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 "src/dist/fheroes2"                        "$pkgdir/usr/bin/fheroes2"
  install -Dm644 "script/packaging/common/fheroes2.desktop" "$pkgdir/usr/share/applications/fheroes2.desktop"
  install -dm755                                            "$pkgdir/usr/share/fheroes2/data"
  install -Dm644 files/data/*.h2d                        -t "$pkgdir/usr/share/fheroes2/files/data"
  install -Dm644 files/lang/*.mo                         -t "$pkgdir/usr/share/fheroes2/files/lang"
  install -dm755                                            "$pkgdir/usr/share/fheroes2/maps"
  install -Dm755 "script/demo/download_demo_version.sh"     "$pkgdir/usr/share/fheroes2/download_demo_version.sh"
  install -Dm755 "script/homm2/extract_homm2_resources.sh"  "$pkgdir/usr/share/fheroes2/extract_homm2_resources.sh"
  install -Dm644 "fheroes2.key"                             "$pkgdir/usr/share/fheroes2/fheroes2.key"
  install -Dm644 src/resources/fheroes2.png                 "$pkgdir/usr/share/pixmaps/fheroes2.png"
}

# vim:set ts=2 sw=2 et:
