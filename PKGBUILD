# Maintainer: Thomas McGrew <tjmcgrew@gmail.com>
pkgname=dwrandomizer
pkgver=3.0
pkgrel=1
epoch=
pkgdesc="A Randomizer for Dragon Warrior for NES"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="http://dwrandomizer.com"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mcgrew/dwrandomizer/archive/$pkgver.tar.gz" "patch.diff")
sha256sums=('38667f5b6a919cc374c5dc797c432693ae9e9cde0609598907a99a65e867c7f4'
            '43e3fd5030229360217ce57bdab608c2a414ed3126b9da7082643a70dacf3275')
depends=('electron')
makedepends=('emscripten' 'ed')

prepare() {
    cd "$pkgname-$pkgver"
    mkdir build cli-build
}

build() {
#     cd "$srcdir/$pkgname-$pkgver"
#     mv CMakeLists.txt tmp
#     echo 'set (CMAKE_EXE_LINKER_FLAGS -Wl -O1 -z relro -z now)' > CMakeLists.txt
#     cat tmp >> CMakeLists.txt
    cd "$srcdir/$pkgname-$pkgver/build"
    CFLAGS="${CFLAGS} -fno-stack-protector" LDFLAGS="-Wl,-O1,-z,relro,-z,now" cmake -DRELEASE=1 -DCMAKE_TOOLCHAIN_FILE=/usr/lib/emscripten/cmake/Modules/Platform/Emscripten.cmake ..
    make
    cd "$srcdir/$pkgname-$pkgver/cli-build"
    cmake -DRELEASE=1 ..
    make
}

package() {
    mkdir -p $pkgdir/usr/share/dwrandomizer
    mkdir -p $pkgdir/usr/bin/
    cd "$srcdir/$pkgname-$pkgver"
    patch -p1 < ../patch.diff
    cd "$srcdir/$pkgname-$pkgver/electron"
    cp -Lr * $pkgdir/usr/share/dwrandomizer
    echo -e '#!/bin/sh\n\nelectron /usr/share/dwrandomizer' > $pkgdir/usr/bin/dwrandomizer
    chmod +x $pkgdir/usr/bin/dwrandomizer
    cd "$srcdir/$pkgname-$pkgver/cli-build"
    mv dwrandomizer dwrandomizer-cli
    install -D -t $pkgdir/usr/bin/ dwrandomizer-cli
    install -D -t "$pkgdir/usr/share/licenses/$pkgname/" "$srcdir/$pkgname-$pkgver/LICENSE"
    install -D -t "$pkgdir/usr/share/applications/" "$srcdir/$pkgname-$pkgver/resources/dwrandomizer.desktop"

    #install the icons
    install -D -T "$srcdir/$pkgname-$pkgver/electron/build/icons/icon_512x512.png" "$pkgdir/usr/share/icons/512x512/dwrandomizer.png"
    install -D -T "$srcdir/$pkgname-$pkgver/electron/build/icons/icon_256x256.png" "$pkgdir/usr/share/icons/256x256/dwrandomizer.png"
    install -D -T "$srcdir/$pkgname-$pkgver/electron/build/icons/icon_128x128.png" "$pkgdir/usr/share/icons/128x128/dwrandomizer.png"
    install -D -T "$srcdir/$pkgname-$pkgver/electron/build/icons/icon_64x64.png" "$pkgdir/usr/share/icons/64x64/dwrandomizer.png"
    install -D -T "$srcdir/$pkgname-$pkgver/electron/build/icons/icon_32x32.png" "$pkgdir/usr/share/icons/32x32/dwrandomizer.png"
    install -D -T "$srcdir/$pkgname-$pkgver/electron/build/icons/icon_16x16.png" "$pkgdir/usr/share/icons/16x16/dwrandomizer.png"
}
