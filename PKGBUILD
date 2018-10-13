# Maintainer: pyz3n

pkgname=weechat-matrix-git
pkgver=r348.ace3fef
pkgrel=2
pkgdesc="weechat script for matrix"
arch=('any')
url='https://github.com/torhve/weechat-matrix-protocol-script'
license=('MIT')
depends=('weechat' 'lua' 'lua-cjson')
makedepends=('git')
source=("${pkgname}::git+https://github.com/torhve/weechat-matrix-protocol-script")
md5sums=('SKIP')
install=weechat-matrix-git.install

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/$pkgname"
    install -D "matrix.lua" -t "$pkgdir/opt"
}
