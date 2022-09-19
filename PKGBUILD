# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=zsh-completions-git
pkgver=0.34.0.r18.gacd4de5
pkgrel=1
pkgdesc="Additional completion definitions for Zsh"
arch=(any)
url="https://github.com/zsh-users/zsh-completions"
license=(GPL)
depends=(zsh)
makedepends=(git)
provides=(zsh-completions)
conflicts=(zsh-completions)

source=('git+https://github.com/zsh-users/zsh-completions.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir"/zsh-completions
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "$srcdir"/zsh-completions/src
	rm _vagrant
	install -m0755 -d "$pkgdir"/usr/share/zsh/site-functions
	install -m0644 _* "$pkgdir"/usr/share/zsh/site-functions
}
