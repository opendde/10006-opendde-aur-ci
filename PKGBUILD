# Maintainer: Rene Hickersberger <r@renehsz.com>
# Contributor: Robert Hamblin <hamblingreen@hotmail.com>
pkgname=mepo
pkgver=0.4.1
pkgrel=2
pkgdesc="Fast, simple, and hackable OSM map viewer for Linux"
arch=('i686' 'x86_64' 'arm' 'aarch64')
url="https://git.sr.ht/~mil/mepo"
license=('GPL3')
depends=('dmenu' 'jq' 'xdotool' 'curl' 'sdl2' 'sdl2_image' 'sdl2_ttf' 'sdl2_gfx')
makedepends=('zig>=0.9')
checkdepends=('zig>=0.9')
changelog=
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('0baf41980e9b4c85276019151e258c7588261c825e59b159af4fa00e5f821df26fbc5598382dc7f9ce3bb395986d867d5dfdf519c211e5a4c2bee0062b44becf')
sha256sums=('b6d01ce10618755ec604d7376a4fe56302860d425e6303530f0eaefcb867cb76')

prepare() {
    patch --directory="$pkgname-$pkgver" --forward --strip=1 --input="$startdir/remove_zig_version_check.patch"
}

build() {
  cd "$pkgname-$pkgver"

  zig build -Drelease-safe=true
}

check() {
  cd "$pkgname-$pkgver"

  zig build test
}

package() {
  cd "$pkgname-$pkgver"

  mkdir -p "$pkgdir/usr/bin"
  install scripts/mepo_* "$pkgdir/usr/bin/"
  install "zig-out/bin/mepo" "$pkgdir/usr/bin/"
}

