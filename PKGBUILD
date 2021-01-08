# Maintainer: X0rg
# Contributor: Tom Kwok <contact@tomkwok.com>
# Contributor: Jorge Barroso <jorge.barroso.11 at gmail dot com>
# Contributor: Roman Kyrylych <Roman.Kyrylych@gmail.com>
# Contributor: Benjamin Wild <benwild@gmx.de>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Joshua Stiefer <facedelajunk@gmail.com>

pkgname=exaile
_pkgver=4.1.0-rc1
pkgver=${_pkgver//-/}
pkgrel=1
pkgdesc="A full-featured Amarok-style media player for GTK+"
arch=('any')
url="https://www.exaile.org/"
license=('GPL2')
depends=('python>=3.6'
	'python-bsddb'
	'gtk3>=3.22.0'
	'gst-python>=1.14.0'
	'gst-plugins-base>=1.14.0'
	'gst-plugins-good>=1.14.0'
	'python-mutagen>=1.38.0'
	'python-dbus'
	'python-cairo'
	'python-gobject')
makedepends=('pygobject-devel>=3.22.0' 'help2man')
checkdepends=('python-mox3' 'python-pytest')
optdepends=('udisks2: device detection'
	#'python-discid: CD info'
	'spydaap: DAAP server'
	'python-zeroconf: DAAP plugins (daapserver and daapclient)'
	'ipython: ipconsole plugin'
	'python-pylast: Last.FM integration'
	'python-lxml: lyrics from lyricsmania.com (lyricsmania)'
	'python-beautifulsoup4: lyrics from lyrics.wikia.com (lyricwiki)'
	'python-musicbrainzngs: Musicbrainz covers'
	'python-feedparser: podcast plugin'
	'webkit2gtk: Wikipedia info'
	'libkeybinder3: Xlib-based hotkeys'
	'librsvg: scalable icons'
	'libnotify: recording streams'
	'moodbar: moodbar plugin'
	'gst-plugins-bad: BPM Counter plugin')
source=("$pkgname-$_pkgver.tar.gz::https://github.com/exaile/exaile/archive/$_pkgver.tar.gz")
sha512sums=('45c83cbfc38cdb9877d32d67781f30710b315e73af1f0d48532ef0d75d642ddfe8d26c96ceca8c78b51bb153719474e4c6f229556f4a589c5aeb088303e7de8e')

build() {
	cd "$srcdir/$pkgname-$_pkgver"
	make PREFIX="/usr"
}

check() {
	cd "$srcdir/$pkgname-$_pkgver"
	make PYTEST=py.test test
}

package() {
	cd "$srcdir/$pkgname-$_pkgver"
	make PREFIX="/usr" DESTDIR="$pkgdir" install
}
