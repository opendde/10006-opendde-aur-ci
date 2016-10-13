# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Thiago Perrotta <perrotta dot thiago at poli dot ufrj dot br>
# Contributor: Ivan Petruk <localizator@ukr.net>
pkgname=super-flat-remix-icon-theme
_pkgname=Flat-Remix
pkgver=1.10
pkgrel=2
pkgdesc='a pretty simple icon theme, derived from Ultra-Flat-Icons, Paper and Flattr'
arch=('any')
url='http://gnome-look.org/content/show.php/Super+flat+remix+icon+theme?content=169073'
license=('custom:cc-by-nc-sa-3.0')
depends=('xdg-utils')
options=(!strip !emptydirs)
source=("https://github.com/daniruiz/$_pkgname/archive/master.zip")
sha1sums=('c0d95f9233de30906ff465dd8761ba8acf4d2aa1')

package() {
    cd "${srcdir}/$_pkgname-master/"
    install -dm755 "${pkgdir}/usr/share/icons"
    rm -f "${_pkgname//-/ }"/{CREDITS,LICENSE.txt}
	cp -a "${_pkgname//-/ }" "${pkgdir}/usr/share/icons/$_pkgname"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}


