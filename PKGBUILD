# Maintainer: Justin Dray <justin@dray.be>
# Contributor: Josh McGee <josh.s.mcgee@gmail.com>
# Contributor: Earnestly <zibeon@gmail.com>

pkgname=shellcheck-git
pkgver=0.3.7.r1.gbb7ef58
pkgrel=1
pkgdesc="A shell script static analysis tool: Git Release"
arch=(i686 x86_64)
url=http://www.shellcheck.net/
license=('AGPL3')
depends=('gmp')
makedepends=('git'
             'ghc'
             'haskell-json'
	     'haskell-mtl'
	     'haskell-parsec'
	     'haskell-quickcheck'
	     'haskell-regex-tdfa')
provides=(shellcheck)
conflicts=(shellcheck)
source=("$pkgname::git+https://github.com/koalaman/shellcheck.git")
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git describe --long --tags | sed -r 's/^v//g;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
	cd "$pkgname"
	runhaskell Setup configure --prefix=/usr --docdir="/usr/share/doc/${pkgname}" -O
}

build() {
	cd "$pkgname"
	runhaskell Setup -v build
}

package() {
	cd "$pkgname"
	runhaskell Setup copy --destdir="${pkgdir}"
}
