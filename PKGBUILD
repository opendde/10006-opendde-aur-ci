# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Jack Random <jack ät random.to>
# Contributor: Michael J. Pento <mjpento@verizon.net>
# Contributor: grimi <grimi at poczta dot fm>
pkgname=matcha-gtk-theme
_pkgver=2021-06-02
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="A flat design theme for GTK 3, GTK 2 and GNOME Shell"
arch=('any')
url="https://vinceliuice.github.io/theme-matcha.html"
license=('GPL3')
optdepends=('gtk-engine-murrine: GTK2 theme support'
            'gtk-engines: GTK2 theme support'
            'qogir-icon-theme: Recommended icon theme'
            'kvantum-theme-matcha: Matching Kvantum theme')
options=('!strip')
source=("$pkgname-$_pkgver.tar.gz::https://github.com/vinceliuice/Matcha-gtk-theme/archive/$_pkgver.tar.gz")
sha256sums=('77181ab467a3583dec16329757be2dece64db0cc51cf6438005bc4b90c763250')

package() {
	cd "Matcha-gtk-theme-$_pkgver"
	install -d "$pkgdir/usr/share/themes"
	./install.sh -d "$pkgdir/usr/share/themes"
}
