# Maintainer: Yufan You <ouuansteve at gmail>
# Contributor: Emilien Devos (unixfox) <contact@emiliendevos.be>

_npmname=wildduck
pkgname=nodejs-wildduck
pkgver=1.35.4
pkgrel=1
pkgdesc='Opinionated email server'
arch=(any)
url=https://github.com/nodemailer/wildduck
provides=(wildduck)
conflicts=(wildduck)
license=(custom:EUPL)
depends=(nodejs)
makedepends=(npm)
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('5b42924881e20f154b7dcfb180e714ad753184f8d5d65fc5394aebab0cc86afb')

package() {
    cd "$srcdir"
    local _npmdir="$pkgdir/usr/lib/node_modules/"
    mkdir -p "$_npmdir"
    cd "$_npmdir"
    npm install -g --prefix "$pkgdir/usr" "$srcdir/$_npmname-$pkgver.tgz"
    install -Dm644 "$_npmdir/$_npmname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Remove the files that contain references to $pkgdir
    rm "$pkgdir/usr/lib/node_modules/$_npmname/node_modules/dtrace-provider/build/Makefile"
    rm "$pkgdir/usr/lib/node_modules/$_npmname/node_modules/dtrace-provider/build/config.gypi"

    chown -R root:root "${pkgdir}"
}
