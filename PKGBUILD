# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=ImHex-Patterns
pkgname=${_pkgname,,}-git
pkgver=r8.2f41f6e
pkgrel=1
pkgdesc='Hex patterns, include patterns and magic files for the use with the ImHex Hex Editor'
url='https://github.com/WerWolv/ImHex-Patterns'
license=('GPL2')
arch=('any')
makedepends=('git')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')
b2sums=('SKIP')

pkgver() {
  cd "${pkgname}"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -Dm0644 -t "${pkgdir}/usr/share/imhex/patterns" \
    "${pkgname}/patterns"/* \
    "${pkgname}/includes"/*
}
