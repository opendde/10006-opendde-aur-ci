# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>
# Contributor: Mohammad AlSaleh <CE.Mohammad.AlSaleh at gmail dot com>

_pkgname="lua-language-server"
pkgname="$_pkgname-git"
pkgver=r3080.02b37394
pkgrel=2
license=('MIT')
pkgdesc='Lua Language Server coded by Lua'
url='https://github.com/sumneko/lua-language-server'
arch=('x86_64')
depends=('lua')
makedepends=('ninja' 'git')
source=(
  "git+https://github.com/sumneko/${_pkgname}.git"
  '0001-Fixes.patch'
  'wrapper'
)
sha256sums=('SKIP'
            '66220566db9888eccbfeed998cae5ccdd4d74f3c4d43867e701bdad9585e7726'
            '6135c5424e5b87146aabf47651d3c95b6038865f26f25a8fce3a1ecd8c8f31fa')

pkgver() {
  cd "${_pkgname}"

  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "${_pkgname}"

  git submodule update --init --recursive
  git apply "${srcdir}"/*.patch
}

build() {
  cd "${_pkgname}"

  ninja -C 3rd/luamake -f ninja/linux.ninja
  ./3rd/luamake/luamake rebuild
}

package() {
  cd "${_pkgname}"

  install -dm0755 "${pkgdir}/usr/lib/${_pkgname}"
  cp -a bin/Linux/* "${pkgdir}/usr/lib/${_pkgname}"

  install -dm0755 "${pkgdir}/usr/share/${_pkgname}"

  cp -a main.lua script "${pkgdir}/usr/share/${_pkgname}"
  cp -a locale platform.lua "${pkgdir}/usr/share/${_pkgname}"
  cp -a debugger.lua "${pkgdir}/usr/share/${_pkgname}"

  install -Dm0755 ../wrapper "${pkgdir}/usr/bin/${_pkgname}"
}
