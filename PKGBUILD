# Maintainer: jprjr <john@jrjrtech.com>

pkgname=('lua-pgmoon' 'lua51-pgmoon' 'lua52-pgmoon' 'lua53-pgmoon')
_pkgbase='pgmoon'
pkgver=1.15.0
pkgrel=1
arch=('any')
url='https://github.com/leafo/pgmoon'
license=('MIT')
_archive="${_pkgbase}-${pkgver}"
source=("$pkgname-$pkgver.tar.gz::https://github.com/leafo/pgmoon/archive/v$pkgver.tar.gz")

_package() {
    pkgdesc="PostgreSQL driver written in pure Lua for Lua ${1}"
    depends=("${pkgname%-*}" "${pkgname%-*}-lpeg")
    if [[ "$1" == "5.1" ]] ; then
        depends+=("${pkgname%-*}-bitop")
    fi
    optdepends=("${pkgname%-*}-cqueues: asynchronous connectivity"
                "${pkgname%-*}-socket: synchronous connectivity")

    cd "${_archive}"
    install -Dm644 pgmoon.lua "$pkgdir/usr/share/lua/$1/pgmoon.lua"
    install -Dm644 pgmoon/*.lua -t "$pkgdir/usr/share/lua/$1/pgmoon"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_lua-pgmoon() {
    _package 5.4
}

package_lua53-pgmoon() {
    _package 5.3
}

package_lua52-pgmoon() {
    _package 5.2
}

package_lua51-pgmoon() {
    _package 5.1
}

sha256sums=('dabf50ca9947dc135b7126cee56b3287242f00c7438ceca7403cef45277829e1')
