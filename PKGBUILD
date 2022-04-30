# Maintainer: Logan Sevcik <logan+aur@sevcik.email>
pkgname=arm-image-installer
pkgver=3.6
pkgrel=1
pkgdesc="Install and manipulate ARM disk images"
arch=(any)
url="https://pagure.io/arm-image-installer"
license=(GPL2)
source=(https://pagure.io/arm-image-installer/archive/arm-image-installer-$pkgver/arm-image-installer-arm-image-installer-$pkgver.tar.gz)
md5sums=('ae245159505c79fef4e1e45c21f5fec8')

package() {
	mkdir -p "$pkgdir/usr/"{bin,share/arm-image-installer}
	find "$srcdir/arm-image-installer-arm-image-installer-$pkgver" -mindepth 1 -maxdepth 1 -type f -perm -u=x -exec \
		install -Dm755 {} "$pkgdir/usr/bin" \;
	find "$srcdir/arm-image-installer-arm-image-installer-$pkgver" -mindepth 1 -maxdepth 1 -type d -exec \
		cp -r {} "$pkgdir/usr/share/arm-image-installer" \;
}
