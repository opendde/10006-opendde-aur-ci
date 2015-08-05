# Maintainer: Yegorius <yegorius@domic.us>

pkgname=pulseaudio-dlna
pkgver=0.4.3
pkgrel=1
pkgdesc="A small DLNA server which brings DLNA/UPnP support to PulseAudio"
arch=('i686' 'x86_64')
url="https://github.com/masmu/pulseaudio-dlna"
license=('GPL3')
depends=('python2-dbus' 'python2-beautifulsoup3' 'python2-docopt'
		'python2-requests' 'python2-gobject2' 'python2-setproctitle'
		'python2-protobuf' 'python2-notify2')
makedepends=('python2-setuptools')
optdepends=('lame: MP3 transcoding support'
			'flac: FLAC transcoding support'
			'opus: OPUS transcoding support'
			'libogg: OGG transcoding support')
source=("$pkgname-$pkgver.tar.gz::https://github.com/masmu/pulseaudio-dlna/archive/$pkgver.tar.gz")
sha256sums=('c0b44273359094e4f1df3e3e7a4b67443f278dc5e27a58a2d529e0e78a71e508')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --no-compile --prefix="/usr" --root="$pkgdir"
}
