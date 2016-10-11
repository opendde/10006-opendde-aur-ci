# Maintainer: Michael Gerhaeuser <michael.gerhaeuser@gmail.com>
# Contributor: Harley Laue <losinggeneration@gmail.com>
pkgname=zerobrane-studio
pkgver=1.40
pkgrel=2
pkgdesc="A lightweight Lua-based IDE for Lua"
arch=(any)
url="http://studio.zerobrane.com/"
license=('MIT')
depends=('wxlua-svn' 'lua52-bitop' 'lua52-socket' 'hicolor-icon-theme')
makedepends=('cmake')
provides=('zerobrane-studio')
conflicts=('zerobrane-studio-git')
optdepends=('love: to debug love programs')
_github_user="pkulchenko"
_github_project="ZeroBraneStudio"
_github_rev="5a2af99"
source=("https://github.com/$_github_user/$_github_project/tarball/${pkgver}"
        "zbstudio.patch"
        "user.lua")
md5sums=('e0137f3b2c96ef6e9832beb3142fc73e'
         '3bb356b8549b60352e8ab36b9a6d9a92'
         '73636b0c87d0412e316e7ad58151e70d')

prepare() {
  cd "$srcdir/$_github_user-$_github_project-$_github_rev"

  patch -p1 < "$srcdir/zbstudio.patch"
}

build() {
  cd "$srcdir/$_github_user-$_github_project-$_github_rev/build"

  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=RelWithDebInfo \
        -DLUA_EXECUTABLE=/usr/bin/lua5.2

  make
}

package() {
  cd "$srcdir/$_github_user-$_github_project-$_github_rev/build"
  make DESTDIR="$pkgdir/" install
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  cp ../LICENSE "$pkgdir/usr/share/licenses/$pkgname"
  cp "$srcdir/user.lua" "$pkgdir/usr/share/zbstudio/cfg/user.lua"
  cp "../lualibs/lua_parser_loose.lua" "$pkgdir/usr/share/zbstudio/lualibs/"
  cp "../lualibs/lua_lexer_loose.lua" "$pkgdir/usr/share/zbstudio/lualibs/"
}

# vim:set ts=2 sw=2 et:
