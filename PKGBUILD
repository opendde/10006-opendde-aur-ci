# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=xpybar
pkgver=1.18.2
pkgrel=1
pkgdesc="A highly extensible minimalistic dock panel configured in Python 3"
arch=(any)
url="https://github.com/maandree/xpybar"
license=('GPL3' 'AGPL3')
depends=(python3 argparser-python 'python-xlib>=0.18' xorg-xrandr)
optdepends=("alarm: for limiting the time of a file search in locks"
            "curl: for Internet services"
	    "file: for image support"
	    "findutils: for file search in locks"
	    "graphicsmagick: for image support"
	    "hdparm: hdparm: for hdparm support"
	    "ii: for ii support"
	    "imagemagick: for image support"
	    "inotify-tools: for ii and inotify support"
	    "iputils: for ping support"
	    "librsvg: for image support"
	    "linux: most of the monitors require Linux's procfs or sysfs"
	    "pdeath: for automatic killing of child processes on exit"
	    "python-pyalsaaudio: for ALSA volume control"
	    "python-pytz: for timezone support"
	    "python-sysv-ipc: for ropty example"
	    "solar-python>=2.5: for solar data")
makedepends=(make coreutils sed zip auto-auto-complete texinfo)
install=xpybar.install
source=($url/archive/$pkgver.tar.gz)
sha256sums=(3b902b96e4795cb4c08457fd7dfabbc4d9944b28e580bc256be029a407c8fce6)


build() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr HDPARM_PATH=/usr/bin/hdpath
}


package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr HDPARM_PATH=/usr/bin/hdpath install DESTDIR="$pkgdir"
  chmod 4755 "$pkgdir/usr/bin/restricted-hdparm"
}

