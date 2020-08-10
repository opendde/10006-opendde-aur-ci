# Maintainer: Bruce Zhang <zttt183525594@gmail.com>
_pkgname=feeluown
pkgname=feeluown
pkgver=3.5.2
pkgrel=1
pkgdesc="FeelUOwn Music Player"
arch=('any')
url="https://github.com/cosven/FeelUOwn"
license=('GPL3')
depends=('python-qasync' 'python-pyqt5' 'mpv' 'python-opengl' 'python-janus' 'python-requests')
makedepends=('python-setuptools' 'python-pip')
optdepends=(
	'feeluown-local'
	'feeluown-netease'
	'feeluown-kuwo'
	'feeluown-xiami'
	'feeluown-qqmusic'
)
_name=${pkgname#python-}
source=(
	"https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz"
	"feeluown.desktop"
)
sha256sums=('b8d3c88dcff0d446d52e713769802586b59c2e29566aaebf3b329ab727dd585c'
            'f093cccd74e29115782b30fcda28fb0c3b935091673b50882b332c934ed56065')
groups=('feeluown-full')

build() {
	cd "$pkgname-$pkgver"
	LANG=en_US.UTF-8 python setup.py build
}

package() {
	cd "$pkgname-$pkgver"
	LANG=en_US.UTF-8 python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -D -m644 "$srcdir/$pkgname-$pkgver/feeluown/feeluown.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/feeluown.png"
	install -D -m644 "$srcdir/feeluown.desktop" "$pkgdir/usr/share/applications/FeelUOwn.desktop"
}
