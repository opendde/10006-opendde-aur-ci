# Maintainer: Chrysostomus @forum.manjaro.org

pkgname=pacli
pkgver=0.7
pkgrel=1
pkgdesc="An interactive pacman interface using fzf"
arch=(any)
url="https://github.com/Chrysostomus/$pkgname"
license=(MIT)
depends=('bash'
	'downgrade'
	'pacman'
	'fzf'
	'sudo'
	'yaourt')
makedepends=('git')
source=("git://github.com/Manjaro-Pek/$pkgname")
md5sums=('SKIP')

package () {
	cd "$srcdir"
        install -Dm755 "$srcdir/$pkgname/pacli" "$pkgdir/usr/bin/pacli"
}