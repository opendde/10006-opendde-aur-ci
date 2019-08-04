# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Hokuto <abrahamhokuto@outlook.com>

pkgname=windows-xp-icons-git
pkgver=r26.68520e3
pkgrel=1
pkgdesc="Remake of classic YlmfOS theme with some mods for icons to scale right"
arch=('any')
url="https://github.com/B00merang-Project/WinXP-Icons"
license=('GPL')
makedepends=('git')
source=('git+https://github.com/B00merang-Project/WinXP-Icons.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/WinXP-Icons"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/WinXP-Icons"

  install -d -m755 "$pkgdir/usr/share/icons/WinXP"

  find . -type f -exec \
       install -D -m644 '{}' "$pkgdir/usr/share/icons/WinXP/{}" \;

  find . -type l -exec \
       install -D -m644 '{}' "$pkgdir/usr/share/icons/WinXP/{}" \;
}
