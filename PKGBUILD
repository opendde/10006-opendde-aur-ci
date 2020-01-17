# Maintainer: Ren Tatsumoto <tatsu at autistici dot org>

pkgname=archie-silence-grub-theme-git
_gitname="arch-silence"
pkgver="r5.9fda3bf"
pkgrel=3
pkgdesc="Arch Silence - GRUB2 theme - GIT version, with a new logo."
arch=('any')
license=('GPL')
depends=()
optdepends=()
install="${pkgname}.install"
url="https://github.com/fghibellini/$_gitname"
source=("git+https://github.com/fghibellini/$_gitname.git")
makedepends=('git')
sha512sums=('SKIP')
conflicts=("$_gitname-grub-theme" "$_gitname-grub-theme-git")
provides=("$_gitname-grub-theme=$pkgver")

pkgver() {
  cd ${srcdir}/${_gitname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  mkdir -p "${pkgdir}/boot/grub/themes/${_gitname}"
  cp -TR "${srcdir}/${_gitname}/theme" "${pkgdir}/boot/grub/themes/${_gitname}"
  echo "$_arch_logo" | base64 -d > "${pkgdir}/boot/grub/themes/${_gitname}/arch_logo.png"
}

_arch_logo="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
TkSuQmCC"
