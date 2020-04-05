# Maintainer: Wang Ruochen <wangkevin920@163.com>
pkgname=interception-caps2esc-nocaps-git
_pkgname=interception-caps2esc
pkgver=0.1.3.r3.g4560a82
pkgrel=1
pkgdesc='A fork of interception-caps2esc which does not emit Caps Lock when ESC is pressed'
arch=('x86_64')
license=('MIT')
url="https://github.com/weirane/caps2esc"
depends=(interception-tools)
conflicts=(caps2esc interception-caps2esc)
replaces=(interception-caps2esc)
source=("$pkgname::git+$url"
        "udevmon.yaml")
md5sums=(SKIP 936dbdac1bdba4a68bcaf948f5f5326f)

pkgver() {
    cd "$pkgname"
    git describe --long --tags | sed -e 's/^v//' -e 's/\([^-]*-g\)/r\1/' -e 's/-/./g'
}

build() {
    cd "$srcdir/$pkgname"
    cmake -Bbuild -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
    cmake --build build
}

package() {
    cd "$srcdir/$pkgname/build"
    make DESTDIR="$pkgdir/" install
    install -D -m0644 "$srcdir/udevmon.yaml" "$pkgdir/usr/share/doc/$_pkgname/udevmon.example.yaml"
}
