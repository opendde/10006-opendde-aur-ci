# Maintainer: Emeric Grange <emeric.grange@gmail.com>
# Created: 27/02/2020

# The upstream software is not package friendly yet, so instead of rewriting its
# entire build system, we just built it (and its dependencies) as is and copy The
# results into /opt/shadered.
# If you want to help improve or maintain this package please let me know!

pkgname=shadered
pkgver=1.4.3
pkgrel=1
pkgdesc="SHADERed is a lightweight tool for creating and testing HLSL and GLSL shaders."
arch=("x86_64")
url="https://github.com/dfranx/SHADERed"
license=("MIT")
depends=(gtk3 sdl2 sfml assimp glew glm spirv-headers)
makedepends=(git cmake python)

source=("git+https://github.com/dfranx/SHADERed.git#commit=cd1b6f2"
        "SHADERed.sh")
sha256sums=('SKIP'
            'e501a371996c373988bd74733f288c8caa6b44d88439c5d52b18e14b4766420c')

build() {
  cd SHADERed/
  git submodule update --init --recursive
  cmake .
  make
}

package() {
  cd "$srcdir/SHADERed"
  install -Dm644 "$srcdir/SHADERed/bin/icon_256x256.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm644 "$srcdir/SHADERed/Misc/Linux/org.shadered.SHADERed.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm755 "$srcdir/SHADERed.sh" "$pkgdir/usr/bin/$pkgname"
  mkdir -p "$pkgdir/opt/$pkgname"
  mv $srcdir/SHADERed/bin/* "$pkgdir/opt/$pkgname"
}
