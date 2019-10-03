# Maintainer: Bruce Zhang
pkgname=petal
_name=Petal
pkgver=2.22.0
pkgrel=1
pkgdesc="Douban.FM Client With Extra - - - 一个简洁的豆瓣FM客户端"
arch=('x86_64' 'i686')
url="https://ilime.github.io/Petal/"
license=('MIT')
depends=('electron')
makedepends=('yarn' 'jq' 'moreutils')
provides=('petal')
conflicts=('petal-bin')
source=("$pkgname-$pkgver.src.tar.gz::https://github.com/ilime/Petal/archive/v$pkgver.tar.gz")
sha256sums=('02e0d794cc7f56583767fd77ba8a087607b875b2c2b3abd8a447836a1aa740d1')

prepare() {
	cd "$srcdir/$_name-$pkgver"

	local cache="$srcdir/npm-cache"
    local dist=/usr/lib/electron

    jq '.electronDist = $dist | .electronVersion = $version' \
        --arg dist "$dist" \
        --arg version "$(sed s/^v// $dist/version)" \
        electron-builder.json | sponge electron-builder.json

    export YARN_CACHE_FOLDER="$cache"
	yarn
}

build() {
	cd "$srcdir/$_name-$pkgver"

	if [[ ! -e app/build/index.html ]]
	then
		yarn build:electron:prod && yarn build
	fi
	cp -r build app/build
	# Temperarily fix build script
	./node_modules/.bin/electron-builder --linux --dir
	rm -r app/build
}

package() {
	msg2 "Packaging application resources"
	cd "$srcdir/$_name-$pkgver/dist/linux-unpacked/resources"
	install -Dm644 app.asar "$pkgdir/usr/share/petal/app.asar"

	msg2 "Packaging application icons"
	cd "$srcdir/$_name-$pkgver/assets/icons"
	for file in *x*.png; do
		install -Dm644 "$file" "$pkgdir/usr/share/icons/hicolor/${file%.png}/apps/petal.png"
	done

	msg2 "Packaging application entry & desktop file"
	cd "$srcdir"
	echo "#!/bin/env sh
exec electron /usr/share/petal/app.asar \$@
" > petal.sh
	echo "[Desktop Entry]
Name=Petal
Exec=petal %U
Terminal=false
Type=Application
Icon=petal
StartupWMClass=Petal
Comment=Douban.FM Client With Extra
Comment[zh_CN]=一个简洁的豆瓣FM客户端
Categories=Audio;
" > petal.desktop
	install -Dm755 petal.sh "$pkgdir/usr/bin/petal"
	install -Dm644 petal.desktop "$pkgdir/usr/share/applications/petal.desktop"
}
