# Maintainer: Robert Cegliński <rob.ceglinski@gmail.com>

pkgname=minetest-mineclone2
pkgver=0.81.0
pkgrel=1
pkgdesc='Minecraft clone game for Minetest'
arch=('any')
url='https://git.minetest.land/MineClone2/MineClone2'
license=('GPL3')
depends=('minetest-common')
source=("mineclone2-$pkgver.tar.gz::https://git.minetest.land/MineClone2/MineClone2/archive/${pkgver}.tar.gz")
sha256sums=('1496a63963f795c38b82133eeebe5c5c607c1ddecd1f185b76d20a19d185a578')
sha512sums=('e60151fa51289f9d56594fbc3fbf6cf2be4ad7f7d57256e58a934e856b6ae805245696b483f7cf14fd479262e8328da5dec305371f274d35aac2975d435cd0df')
b2sums=('037081d555114cc183e4a959a659ba48252395cd7cbe9eeb02363f3f5a788ca5f72261b54628ba5d946e91b89cdc079564d43506fc89414ddc8c8c1cdba732cc')

package() {
  cd mineclone2

  for f in $(find . -type f); do
    install -Dm644 "$f" "$pkgdir/usr/share/minetest/games/mineclone2/$f"
  done
}
