# Maintainer: intothegnu <intothegnu@protonmail.com>

pkgname="mpv-gallery-view-git"
# I have no idea how I'm supposed to handle the version number of a git package with no tags
pkgver="1.0.0"
pkgrel="1"
install="mpv-gallery-view.install"
pkgdesc="MPV gallery view for chapters and playlists."
arch=('any')
depends=('mpv')
license=('custom:Unlicense')
provides=('mpv-gallery-view')
conflicts=('mpv-gallery-view')
url="https://github.com/occivink/mpv-gallery-view"
source=("git+https://github.com/occivink/mpv-gallery-view")
md5sums=('SKIP')

package(){
	mkdir -p $pkgdir/usr/lib/mpv/mpv-gallery-view/scripts
	mkdir -p $pkgdir/usr/lib/mpv/mpv-gallery-view/script-modules
	install -m 644 $srcdir/mpv-gallery-view/scripts/* $pkgdir/usr/lib/mpv/mpv-gallery-view/scripts
	install -m 644 $srcdir/mpv-gallery-view/script-modules/* $pkgdir/usr/lib/mpv/mpv-gallery-view/script-modules
}

