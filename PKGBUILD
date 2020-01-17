# Maintainer: Haden Collins <collinshaden@gmail.com>
pkgname='wlogout'
pkgver=1.0.4
pkgrel=1
pkgdesc="Logout menu for wayland"
arch=('x86_64')
license=("MIT")
url="https://github.com/ArtsyMacaw/wlogout"
source=("$pkgname-$pkgver.tar.gz::https://github.com/ArtsyMacaw/$pkgname/releases/download/$pkgver/$pkgname.tar.gz" "$pkgname-$pkgver.tar.gz.sig::https://github.com/ArtsyMacaw/$pkgname/releases/download/$pkgver/$pkgname.tar.gz.sig")
validpgpkeys=("F4FDB18A9937358364B276E9E25D679AF73C6D2F")
makedepends=("meson" "git" "scdoc")
depends=("gtk3" "gobject-introspection")
optdepends=("swaylock: default buttons" 
            "systemd: default buttons"
)
build() {
    cd $srcdir
    meson build --prefix /usr 
    ninja -C build
}

package() {
    DESTDIR="$pkgdir" ninja -C build install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
md5sums=('0d6a8cd997d48624807b039de302c840'
         'SKIP')
