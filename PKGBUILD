# Maintainer: Piotr Miller <nwg.piotr@gmail.com>
pkgname=('t2ec')
pkgver=1.3
pkgrel=2
pkgdesc="Scripts to display info icons and controls in Tint2 or other panels"
arch=('x86_64')
url="https://github.com/nwg-piotr/tint2-executors"
license=('GPL3')
depends=('python' 'acpi' 'xorg-xbacklight' 'alsa-utils' 'wireless_tools' 'wget' 'pulseaudio' 'pulseaudio-alsa')
optdepends=('light: for machines not handling xbacklight'
	    'rof-git: for running mouse events commands as single instances'
	    'zenity: for volume and brightness slider box')

source=("https://github.com/nwg-piotr/t2ec/archive/v1.3-2.tar.gz")

md5sums=('f2a6312c36ad73b874ccdbee9f87bb7a')

package() {
  install -D -t "$pkgdir"/usr/lib/"$pkgname" "$pkgname"-"$pkgver"-"$pkgrel"/scripts-arch/*.sh
  install -D -t "$pkgdir"/usr/lib/"$pkgname" "$pkgname"-"$pkgver"-"$pkgrel"/scripts-arch/*.py
  install -D -t "$pkgdir"/usr/bin "$pkgname"-"$pkgver"-"$pkgrel"/scripts-arch/t2ec
  install -D -t "$pkgdir"/usr/share/"$pkgname" "$pkgname"-"$pkgver"-"$pkgrel"/images/*.svg
  install -D -t "$pkgdir"/usr/share/tint2 "$pkgname"-"$pkgver"-"$pkgrel"/configs-arch/*.tint2rc
}

