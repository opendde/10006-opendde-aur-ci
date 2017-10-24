# Contributor: wenLiangcan <boxeed at gmail dot com>
# Maintainer: hexchain <i at hexchain.org>

pkgname=iease-music-git
_pkgname=iease-music
pkgver=171.026f721
pkgrel=3
pkgdesc="A lean snippet manager based on GitHub Gist"
arch=('x86_64')
url="https://github.com/trazyn/ieaseMusic"
license=('MIT')
depends=('electron' 'nodejs' 'libxtst' 'gtk2' 'gconf' 'libxss' 'nss' 'python' 'alsa-lib' 'java-environment')
makedepends=('git' 'npm')
provides=('iease-music')
conflicts=('iease-music')
source=(
    "$_pkgname::git://github.com/trazyn/ieaseMusic.git"
    'iease-music.desktop'
    'iease-music.sh'
)

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$_pkgname"
    sed -i 's/^.*"electron".*$//;s/^.*"electron-builder".*$//' package.json
    npm install
}

package() {
    cd "$srcdir"
    install -Dm644 $_pkgname.desktop -t "$pkgdir/usr/share/applications/"

    cd "$srcdir/$_pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    	
    for size in 16 24 32 48 64 96 128 256; do
        target="$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/"
        mkdir -p $target
        install -Dm644 "resource/${size}x${size}.png" "$target/$_pkgname.png"
    done

    cd "$srcdir/$_pkgname/"
    mkdir -p "$pkgdir/opt/ieaseMusic/"
    cp -r --no-preserve='ownership' -- * "$pkgdir/opt/ieaseMusic/"
    install -Dm755 "$srcdir/$_pkgname.sh" "$pkgdir/usr/bin/$_pkgname"
}

sha256sums=('SKIP'
            'bd7a9e09f8adcb6091a32fbd29cebbe13f10390cac951a2b12997a42b7be1dba'
            '903d9fc1e891b09ef7a6e2d997ff597e00587c70f3cdaf2ee0508dfe9385692c')


