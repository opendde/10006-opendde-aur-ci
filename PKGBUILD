# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=ruff
pkgver=0.0.49
pkgrel=1
pkgdesc='Experimental Python linter written in Rust'
arch=('x86_64')
url="https://github.com/charliermarsh/ruff"
license=('MIT')
depends=('python>=3.7')
makedepends=('maturin' 'python-installer' 'python-wheel')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/r/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('1fdb93c2d7ec36dc6827b35ffbf66bb0b8324ca0f9bd0792914a9833e4725327')

## TODO: Handle git sources in prepare()
prepare() {
	cd "$pkgname-$pkgver"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$pkgname-$pkgver"
	maturin build --release --strip
}

check() {
	cd "$pkgname-$pkgver"
	cargo test --frozen --all-features
}

package() {
	cd "$pkgname-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" target/wheels/*.whl
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s "$_site/$pkgname-$pkgver.dist-info/license_files/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
