# Maintainer: Noah Jelen <noahtjelen@gmail.com>
# Generated by cargo on April 20, 2022 at 01:56:46
pkgname=serverman
pkgver=0.1.1
pkgrel=1
pkgdesc="Minecraft Server Management program"
arch=('i686' 'x86_64')
url="https://gitlab.com/NoahJelen/serverman"
license=('GPL')
depends=('ncurses' 'gcc-libs' 'glibc')
makedepends=('cargo' 'gzip')
source=("https://gitlab.com/NoahJelen/serverman/-/archive/$pkgver/serverman-$pkgver.zip")
md5sums=('SKIP')

build() {
    cd "serverman-$pkgver"
    cargo build --release
    cd target/release
    ln -sf servermand serverman
    ln -sf servermand servermancli
}

package() {
    cd "serverman-$pkgver"
    mkdir -p "$pkgdir/usr/share/man/man1/"
    mkdir -p "$pkgdir/usr/lib/systemd/user"
    install -Dt "$pkgdir/usr/bin" -m755 target/release/serverman
    install -Dt "$pkgdir/usr/bin" -m755 target/release/servermancli
    install -Dt "$pkgdir/usr/bin" -m755 target/release/servermand
    install -Dt "$pkgdir/usr/share/man/man1" man/servermancli.1
    install -Dt "$pkgdir/usr/share/man/man1" man/servermand.1
    install -Dt "$pkgdir/usr/share/man/man1" man/serverman.1
    install -Dt "$pkgdir/usr/lib/systemd/user" servermand.service
    gzip "$pkgdir/usr/share/man/man1/servermand.1"
    gzip "$pkgdir/usr/share/man/man1/serverman.1"
    gzip "$pkgdir/usr/share/man/man1/servermancli.1"
}