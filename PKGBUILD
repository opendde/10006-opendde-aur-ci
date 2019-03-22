# Maintainer: hcra <hcra at u53r dot space>
# Contributor: Pico Paco Nano <founderofjp@gmail.com>
# Contributpr: felix.s <felix.von.s@posteo.de>

pkgname=qweborf
_pkgname=weborf
pkgver=0.15
pkgrel=1
pkgdesc="Minimal HTTP server to share your files - Qt frontend"
arch=(any)
url="https://ltworf.github.io/weborf"
license=(GPL3)
depends=('python' 'weborf' 'desktop-file-utils')
makedepends=('python-pyqt5' 'python-setuptools')
conflicts=("$pkgname-git")
source=(https://github.com/ltworf/weborf/releases/download/$pkgver/weborf_$pkgver.orig.tar.gz)
sha256sums=('c77388253f7513fcabd74900cd8cd28623478c6ced6cd3b06994c4eb3f60e9a3')

build() {
	cd "$srcdir/$_pkgname-$pkgver"

	pyuic5 qweborf/main.ui > qweborf/main.py
	python qweborf.setup.py build
}

package() {
	cd "$srcdir/$_pkgname-$pkgver"

	python qweborf.setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -Dm 0755 qweborf/qweborf "$pkgdir/usr/bin/qweborf"
	install -Dm 0755 qweborf/qweborf.desktop "$pkgdir/usr/share/applications/qweborf.desktop"
}
