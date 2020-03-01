# Maintainer: Sebastian Meyer <aur@mailhell.seb7.de> 

_pkgname=lib32-sdl2_compat12
pkgname=lib32-sdl2_compat12-git
provides=('lib32-sdl')
conflicts=('lib32-sdl')
pkgver=cb684d85
pkgrel=1
pkgdesc="Provides a binary-compatible API for programs written against SDL 1.2, but it uses SDL 2.0 behind the scenes."
url='https://github.com/SDL-mirror/sdl12-compat.git'
arch=('x86_64')
license=('ZLIB')
depends=('lib32-sdl2')
makedepends=('cmake')
source=('git+https://github.com/SDL-mirror/sdl12-compat.git' 'fix-cmakelists.patch' 'fix-srcdir-reference.patch')
sha256sums=('SKIP'
            '6b89938e36ceafbe0e5fec87aa03606c20166890ea73320e5fabf4fd2c3ff4b5'
            'e59519698276b34277a76746b84c06afe5f21037e3c4a5a8e8f913306f0bd812')

prepare() {
    cd sdl12-compat
    patch --forward --strip=1  --input="${srcdir}/fix-cmakelists.patch"
    patch --forward --strip=1  --input="${srcdir}/fix-srcdir-reference.patch"
}

pkgver() {
  cd sdl12-compat 
  git log | head -n1 | sed -e 's/^commit\s*\(........\).*/\1/'
}

build() {
  export CFLAGS+=" -m32"
  export CXXFLAGS+=" -m32"
  export LDFLAGS+=" -m32"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  cd sdl12-compat
  cmake .
  make
}

package() {
  cd "sdl12-compat"
  mkdir -p "$pkgdir/usr/lib32"
  mkdir -p "$pkgdir/usr/share/licenses/$_pkgname/"
  
  cp libSDL-1.2.so* "$pkgdir/usr/lib32"
  cp COPYING "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
