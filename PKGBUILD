# Maintainer: Michael Lojkovic <mikelojkovic@gmail.com>

pkgname=gtk-theme-windows10-dark
pkgver=0.8.5
pkgrel=1
pkgdesc="GTK 3.x Theme made to emulate a Windows 10 environment on Linux machines."
arch=('any')
url="https://github.com/Elbullazul/Windows-10"
license=('GPL')
depends=('gtk-engines' 'gtk-engine-murrine')
optdepends=('gnome-themes-standard')
changelog=(${pkgname}.changelog)
source=("https://github.com/Elbullazul/Windows-10/releases/download/v0.8.5/Windows.10.dark.v0.8.5.zip"
		"https://github.com/Elbullazul/Windows-10/releases/download/v0.8.4/tint2rc")
sha1sums=('65c8a31f8aef8a1a90354223d9ec58cde6482731'
			'039e19b79d169cee6617936879b8ee638b8bebf7')

package() {
	cd Windows\ 10\ Dark

  	# create theme dir
  	install -d -m 755 "$pkgdir/usr/share/themes/Windows10Dark"

  	# install theme
  	find . -type f -exec \
    	install -D -m 644 '{}' "$pkgdir/usr/share/themes/Windows10Dark/{}" \;

	if [ $(pacman -Q openbox | sed 's/ .*//') == "openbox" ]; then
    	cd ..
    	install -d -m 700 "$pkgdir/$HOME"
    	install -d -m 744 "$pkgdir/$HOME/.config/tint2"
    	install -D -m 744 'tint2rc' "$HOME/.config/tint2/tint2rc";
  	fi
}

