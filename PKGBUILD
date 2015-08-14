# Maintainer: Aaron Tinio <aptinio at gmail dot com>
pkgname=ruby-install-git
pkgver=0.5.0.r61.9e97cc9
pkgrel=1
pkgdesc="Installs Ruby, JRuby, Rubinius, MagLev or mruby."
arch=('any')
url="https://github.com/postmodern/${pkgname%-git}"
license=('MIT')
depends=('bash' 'curl' 'tar' 'bzip2' 'gcc')
makedepends=('git')
optdepends=('patch: for specifying any additional patches to apply')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install=
source=("git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" PREFIX=/usr install
}
