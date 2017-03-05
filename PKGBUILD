# Maintainer:	M.Reynolds <blackboxnetworkproject@gmail.com>
# Contributor:	Bjoern Franke <bjo at nord-west.org>
# Contributor:	flan_suse

pkgname=xfce-theme-greybird
pkgver=3.22.2
pkgrel=1
pkgdesc="A grey and blue Xfce theme."
arch=('any')
url="https://github.com/shimmerproject/Greybird"
license=('CCPL:by-sa-3.0' 'GPL')
groups=('xfce-themes-shimmer-collection')
conflicts=("$pkgname-git")
depends=('gtk-engine-murrine')
optdepends=('elementary-xfce-icons: matching icon set; use the dark icon theme'
	    'gtk3: required for CSS/GTK3 theme'
	    'lightdm-gtk-greeter: required for the LightDM GTK theme'
	    'lightdm-unity-greeter: required for the LightDM Unity theme'
	    'shimmer-wallpapers: contains the Greybird wallpaper, among others'
	    'lib32-gtk-engine-murrine: required for multilib')
source=("$pkgname-$pkgver.tar.gz"::"https://github.com/shimmerproject/Greybird/archive/v$pkgver.tar.gz")
sha256sums=('c94d172cc2087ca5be44038bcf0dce142f3ceee56cbc8bef2edf86b6570687eb')

package() {
	cd "$srcdir"

	install -dm 755 "$pkgdir/usr/share/themes/Greybird Classic"
	install -dm 755 "$pkgdir/usr/share/themes/Greybird Compact"
	install -dm 755 "$pkgdir/usr/share/themes/Greybird a11y"
	
	cp -r  "Greybird-$pkgver/" "$pkgdir/usr/share/themes/Greybird/"
	rm -rf "$pkgdir/usr/share/themes/Greybird/.gitignore"
	
	ln -s  "/usr/share/themes/Greybird/xfwm4-compact" \
	       "$pkgdir/usr/share/themes/Greybird Compact/xfwm4"
	      
	ln -s  "/usr/share/themes/Greybird/xfwm4-a11y" \
	       "$pkgdir/usr/share/themes/Greybird a11y/xfwm4"
}
