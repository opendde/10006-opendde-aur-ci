# Maintainer: madprops <mprops at protonmail dot com>

pkgname="clipton-git"
pkgdesc="Clipboard manager based on rofi"
pkgver=r69.44cbebf
pkgrel=1
arch=("x86_64")
url="https://github.com/madprops/clipton"
license=("Unlicense")
depends=("rofi")
sha256sums=("SKIP")
source=("$pkgname::git+https://github.com/madprops/clipton.git")

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd clipton-git
  install -D -m755 clipton.py "$pkgdir/usr/bin/clipton"
  install -D -m755 clipnotify "$pkgdir/usr/bin/clipnotify"
  install -D -m755 clipton.service "$pkgdir/etc/systemd/user/clipton.service"
}
