# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=('colloid-icon-theme-git' 'colloid-cursors-git')
pkgbase=colloid-icon-theme-git
pkgver=2022.10.26.r3.g9a658d7
pkgrel=1
arch=('any')
license=('GPL3')
makedepends=('git')
options=('!strip')
source=('git+https://github.com/vinceliuice/Colloid-icon-theme.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/Colloid-icon-theme"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
   cd "$srcdir/Colloid-icon-theme"

  # Disable running gtk-update-icon-cache
  sed -i '/gtk-update-icon-cache/d' install.sh
}

package_colloid-icon-theme-git() {
  pkgdesc="Modern and clean icon theme for Linux"
  url="https://www.pling.com/p/1661983"
  depends=('gtk-update-icon-cache' 'hicolor-icon-theme')
  provides=("${pkgname%-git}")
  conflicts=("${pkgname%-git}")

  cd "$srcdir/Colloid-icon-theme"
  install -d "$pkgdir/usr/share/icons"
  ./install.sh -t all -d "$pkgdir/usr/share/icons"
}

package_colloid-cursors-git() {
  pkgdesc="An x-cursor theme inspired by Colloid theme and based on capitaine-cursors"
  url="https://www.pling.com/p/1831077"
  provides=("${pkgname%-git}")
  conflicts=("${pkgname%-git}")

  cd "$srcdir/Colloid-icon-theme/cursors"
  install -d "$pkgdir"/usr/share/icons/Colloid{-cursors,-dark-cursors}
  cp -r dist/* "$pkgdir/usr/share/icons/Colloid-cursors/"
  cp -r dist-dark/* "$pkgdir/usr/share/icons/Colloid-dark-cursors/"
}
