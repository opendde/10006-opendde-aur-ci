# Maintainer: @RubenKelevra <cyrond@gmail.com>
# Contributor: Gleb Sinyavskiy <zhulik.gleb@gmail.com>

_archive_extension='tar.gz'
pkgname=system-bridge
pkgver=3.4.9
pkgrel=1
epoch=1
pkgdesc="Bridges your system to other systems, like Home Assistant"
arch=('any')
url="https://github.com/timmo001/$pkgname"
license=(MIT)
depends=(
 	python-pydantic
	python-typer
	python-incremental
	python-keyboard
	python-mutagen
	python-plyer
	python-psutil
	python-sanic
	python-zeroconf
	python-shellingham
	python-tabulate
	python-aiohttp
	python-pyperclip
	pyside6
	python-appdirs
	python-colorlog
	python-cryptography
	python-pandas
	python-screeninfo
)
makedepends=(
	yarn
	node-gyp
	python-build
	python-installer
	python-wheel
	libxss
	gtk3
	nss
)
optdepends=(
	'lshw: To get system information such as the UUID'
	'upower: To get battery information'
)
source=(
	"$pkgname-$pkgver.$_archive_extension::https://github.com/timmo001/$pkgname/archive/refs/tags/$pkgver.$_archive_extension"
        "$pkgname.desktop"
        "$pkgname"
        "$pkgname.service"
)
b2sums=('be1add1c5d599f31854f31f58e9738c7c839f685174f9a308931e8880ea9e73ab043069c70fc81a6e35b2c87947cbaf3a185cb6ee51702a6f757232e3908582a'
        'fa5f2b2bb64d44f7791fe8631481cf294f0a3afa88f1ac7fdb55508df9acc4ad26b1723cadebbf1bc09369c2e3732c6628b6b06d44c3bdcebee0d5913d85d097'
        '26634fe43624791f7ae6fe85e70792fcf67fcd5a9997ba40043c49a636d939d610eb5e6ededdf1e6723dd8280e924160e72a8469501a1436ad67f28eab2d4fef'
        '03852934e853a7a5973e4139a9c51a160df81af1fa958ac6550a6525aa97ad3ebc983bf4a662cce345e04cc0451912687d4c199c9152c7160b173abad2b73b37')
changelog=$pkgname.changelog

prepare() {
	cd "$srcdir/$pkgname-$pkgver/frontend"

	yarn install
}
build() {
	for command in 'shared' 'backend' 'cli' 'connector' 'frontend' 'gui'; do
	
		cd "$srcdir/$pkgname-$pkgver/$command"
		if [ "$command" == 'frontend' ]; then
			yarn build
			yarn export
		fi
		python -m build --wheel --no-isolation
	done
}

package() {
	for command in 'shared' 'backend' 'cli' 'connector' 'frontend' 'gui'; do
	
		cd "$srcdir/$pkgname-$pkgver/$command"

		python -m installer --destdir="$pkgdir" dist/*.whl
	done

	cd "$srcdir"
	install -Dm 755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm 644 "$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
	install -Dm 644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

	cd "$srcdir/$pkgname-$pkgver"
	install -Dm 644 "resources/$pkgname.svg" "$pkgdir/usr/share/icons/$pkgname.svg"
        install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
