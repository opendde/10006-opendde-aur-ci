# Maintainer: Constantin Schomburg <me@ xconstruct.net>

pkgname=mcpatcher
pkgver='1.1.12_02'
pkgrel=2
pkgdesc="Minecraft patcher to fix textures with higher than default resolution"
arch=('any')
license=('Public Domain')
url="https://github.com/pclewis/mcpatcher"
depends=('java-runtime')
optdepends=('minecraft: the game itself')
source=(mcpatcher
        https://github.com/downloads/pclewis/mcpatcher/mcpatcher-$pkgver.jar)
md5sums=('38358254be76dc84676509f43be44938'
         '953fd78ff5efba84127e10ef71f34399')

build() {
    cd "$srcdir"

    install -vDm755 "mcpatcher"             "$pkgdir/usr/bin/mcpatcher"
    install -vDm644 "mcpatcher-$pkgver.jar" "$pkgdir/usr/share/mcpatcher/mcpatcher.jar"
}

# vim:set ts=4 sw=4 et:
