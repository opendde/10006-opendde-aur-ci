# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: push2001sla@gmail.com
pkgname=ccd-python-git
pkgver=1.0
pkgrel=3
epoch=
pkgdesc="Cute ChDir written on Python that finds directories"
arch=('any')
url="https://github.com/pushsla/CuteCD"
license=('unknown')
groups=()
depends=('python>=3.6.0')
makedepends=('git')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/pushsla/CuteCD")
noextract=()
md5sums=('6dd2309a76aa7bd81aeb2bfb23f2c51e')
validpgpkeys=()
prepare() {
	rm -rf "$pkgname-$pkgver"
	git clone "$source" -b master "$pkgname-$pkgver"
}
package() {
	cd "$pkgname-$pkgver"
	mkdir -p "$pkgdir/usr/bin/"
	cp ccd-src.py "$pkgdir/usr/bin/ccd"
	echo -e "\033[1mNote:\033[0m ccd reads config file. During first use it will be stored in $HOME/.config/ccd.pycfg"
}
