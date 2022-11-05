# Maintainer: Konsonanz <maximilian.lehmann@protonmail.com>
pkgname=bitburner
pkgver=2.1.0
pkgrel=2
pkgdesc="Bitburner is a programming-based incremental game"
arch=('x86_64')
url="https://github.com/danielyxie/bitburner"
license=('Apache')
depends=('electron')
makedepends=('git' 'npm')
optdepends=('steam: achievement support'
            'steam-native-runtime: achievement support')
_commit='b49cea10fa4a08fcc794fc328bb50a32c92ede1a'  # latest master
source=("git+$url#commit=$_commit"
        "bitburner.desktop")
sha256sums=('SKIP'
            '385174cee5da60bf403cfff6d44929df2639fb4097a159c9ba7eded690cdd288')

build() {
    cd "$pkgname"

    npm install
    npm install -C electron

    # TODO: remove this once webpack supports new node crypto behaviour
    # https://github.com/webpack/webpack/issues/14532
    NODE_OPTIONS=--openssl-legacy-provider npm run build

    sh ./tools/package-electron.sh linux
}

package() {
    install -dm 755 "$pkgdir"/{opt,usr/bin}
    cp -dr --no-preserve='ownership' "$pkgname/.build/$pkgname-linux-x64" "$pkgdir/opt/$pkgname"
    ln -s "/opt/$pkgname/resources/app/steam_appid.txt" "$pkgdir/opt/$pkgname/steam_appid.txt"
    ln -s "/opt/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"

    install -Dm644 "$pkgname"/assets/Steam/logo.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
    install -Dm644 bitburner.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
}
