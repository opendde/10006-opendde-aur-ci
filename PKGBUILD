# Maintainer: Justin Wong <justin.w.xd at gmail dot com>
# Co-Maintainer: Peter Cai <peter at typeblog dot net>
_distro="ubuntu16.04"

pkgname=netease-cloud-music
pkgver=1.0.0_2
pkgrel=1
pkgdesc="Netease Cloud Music, converted from .deb package"
arch=("x86_64")
url="http://music.163.com/"
license=('custom')
depends=(
	"alsa-lib" "gtk2" "nss" "libxss"
	"qt5-multimedia" "qt5-x11extras"
	"gst-libav" "gst-plugins-base"
	"gst-plugins-good" "gst-plugins-ugly"
	"gnome-themes-standard"
)
source=(
	"http://s1.music.126.net/download/pc/${pkgname}_${pkgver/_/-}_amd64_${_distro}.deb"
	"http://music.163.com/html/web2/service.html"
	"netease-cloud-music"
)
md5sums=('d9a6fa79ffcb654254a1d8b7ba5901a3'
         'SKIP'
         '31a25ac517facc48762a6a9378a66f58')

package() {
  cd ${srcdir}
  tar -xvf data.tar.xz -C ${pkgdir}
  chmod +x ${pkgdir}/usr/lib/netease-cloud-music/libcef.so
  install -D -m644 service.html ${pkgdir}/usr/share/licenses/$pkgname/license.html
  install -m755 netease-cloud-music ${pkgdir}/usr/bin/netease-cloud-music
}
