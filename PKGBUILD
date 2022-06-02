# Maintainer: Lance G. <gero3977 at gmail dot com>
# Contributor: Danct12 <danct12@disroot.org>
pkgname=osk-sdl
pkgver=0.66
pkgrel=8
pkgdesc="SDL2 On-screen Keyboard for FDE"
arch=(x86_64)
url="https://gitlab.com/postmarketOS/osk-sdl"
license=('GPL3')
depends=(device-mapper cryptsetup sdl2 sdl2_ttf mesa ttf-dejavu)
makedepends=(scdoc meson)
source=($pkgname-$pkgver.tar.gz::https://gitlab.com/postmarketOS/osk-sdl/-/archive/$pkgver/$pkgname-$pkgver.tar.gz
        osk-sdl-hooks
        osk-sdl-install
        fix-compiling-for-gcc12.patch
        fix-config-parsing-with-libstdc++.patch)

prepare() {
    cd "$pkgname-$pkgver" 
    patch -u -p0 --input="${srcdir}/fix-compiling-for-gcc12.patch"
    patch -u -p0 --input="${srcdir}/fix-config-parsing-with-libstdc++.patch"
}

build() {
  arch-meson "$pkgname-$pkgver" _build
  meson compile -C _build
}

package() {
  DESTDIR="$pkgdir" meson install --no-rebuild -C _build

  # DejaVu is on a different directory than default
  sed -i 's/\/usr\/share\/fonts\/ttf-dejavu/\/usr\/share\/fonts\/TTF/g' ${pkgdir}/etc/osk.conf

  # Install initramfs
  install -Dm644 ${srcdir}/osk-sdl-hooks ${pkgdir}/usr/lib/initcpio/hooks/osk-sdl
  install -Dm644 ${srcdir}/osk-sdl-install ${pkgdir}/usr/lib/initcpio/install/osk-sdl
}
md5sums=('fb608060dea423d221bdfff9a6101624'
         '3a4a2945ce9fa98451273833e1a615cd'
         'd517b55e26dd7c394cccc63f47c9956e'
         '8fef952dada64ff63040b5406e71ecac'
         'e6dff50a2f9a27d5de92437394e9cfda')
