# Maintainer: Piotr Miller <nwg.piotr@gmail.com>
pkgname=('t2ec')
pkgver=1.1
pkgrel=3
pkgdesc="Scripts to display info icons and controls in Tint2 or other panels"
arch=('x86_64')
url="https://github.com/nwg-piotr/tint2-executors"
license=('GPL3')
depends=('python' 'acpi' 'xorg-xbacklight' 'alsa-utils' 'wireless_tools' 'wget')
optdepends=('light: for machines not handling xbacklight'
	    'rof-git: for running mouse events commands as single instances'
	    'zenity: for volume and brightness slider box')

source=("https://github.com/nwg-piotr/t2ec/archive/v1.1-3.tar.gz")

md5sums=('a98ea36917c09da167f4c2236211f452')

package() {
  install -D -t "$pkgdir"/usr/lib/"$pkgname" "$pkgname"-"$pkgver"-"$pkgrel"/scripts-arch/*.sh
  install -D -t "$pkgdir"/usr/lib/"$pkgname" "$pkgname"-"$pkgver"-"$pkgrel"/scripts-arch/*.py
  install -D -t "$pkgdir"/usr/bin "$pkgname"-"$pkgver"-"$pkgrel"/scripts-arch/t2ec
  install -D -t "$pkgdir"/usr/share/"$pkgname" "$pkgname"-"$pkgver"-"$pkgrel"/images/*.svg
  install -D -t "$pkgdir"/usr/share/tint2 "$pkgname"-"$pkgver"-"$pkgrel"/configs-arch/*.tint2rc
}

