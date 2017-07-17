# Maintainer: American_Jesus <american.jesus.pt AT gmail DOT com>

_repo=aerial-sddm-theme
_pkgname=sddm-theme-aerial
pkgname=$_pkgname-git
pkgver=0.1.r16.gca72b8d
pkgrel=1
pkgdesc="SDDM theme with Apple TV Aerial videos"
arch=('any')
url="https://github.com/3ximus/aerial-sddm-theme"
license=('GPL')
depends=('sddm')
makedepends=('git')
install="$_pkgname.install"
source=("git+https://github.com/3ximus/$_repo.git")
sha256sums=('SKIP')

pkgver() {
  cd $_repo

  local _ver=$(awk -F '=' '/Version/ {print $2}' metadata.desktop)
  printf '%s.r%s.g%s' "$_ver" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
build() {
  cd $_repo
  rm preview*.gif
}
package() {
  install -Dm644 -t "$pkgdir/usr/share/sddm/themes/aerial/" $_repo/*
}
