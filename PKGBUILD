# Maintainer: Noi Sek <noi.t.sek | gmail>

pkgname=lightdm-webkit-theme-aether
pkgver=1.3.0
pkgrel=1
pkgdesc="A sleek, straightforward Archlinux theme for lightdm."
arch=('any')
url="https://github.com/NoiSek/Aether"
license=('GPL3')
depends=('lightdm' 'lightdm-webkit2-greeter>=2.2.3' 'ttf-opensans')
install='lightdm-webkit-theme-aether.install'
changelog='changelog.txt'
source=("https://github.com/NoiSek/Aether/archive/v$pkgver.tar.gz")
md5sums=('b9388bf02055b4d4dd47f3ab4e30869f')

package() {
  cd "$pkgdir"
  mkdir -p usr/share/lightdm-webkit/themes/
  cd usr/share/lightdm-webkit/themes/
  cp --recursive "$srcdir/Aether-$pkgver" "$pkgname"
}
