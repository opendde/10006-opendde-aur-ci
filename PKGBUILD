# Maintainer: Torben <git at letorbi dot com>
# Contributor: emersion <contact at emersion dot fr>
# Contributor: Techlive Zheng <techlivezheng at gmail dot com>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo at gmail dot com>

pkgname=geary-git
pkgver=43.0.r9.g2b7bdbb94
pkgrel=1
pkgdesc="An email application built around conversations, for the GNOME 3 desktop."
arch=(i686 x86_64)
url="https://gitlab.gnome.org/GNOME/geary"
license=('GPL3')
depends=('appstream-glib' 'enchant' 'folks' 'gcr' 'gmime3' 'gtk3' 'gsound'
         'gnome-online-accounts' 'gspell' 'libgee' 'libhandy' 'libnotify'
         'libpeas' 'libsoup' 'libstemmer' 'libunwind' 'libxml2' 'libytnef'
         'nuspell' 'sqlite' 'webkit2gtk')
makedepends=('git' 'gobject-introspection' 'itstool' 'meson' 'vala')
provides=('geary')
conflicts=('geary')
source=('git+https://gitlab.gnome.org/GNOME/geary.git'
        'libsoup2.patch')
sha256sums=('SKIP'
            'fa8e8410350a5540226f4fa984641694680c09631df4b97fb87087933dc1aa04')

pkgver() {
	cd "$srcdir/geary"
	git describe --long | sed 's/^gnome-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$srcdir/geary"
	rm -rf build
	patch -Np1 -i ../../libsoup2.patch
}

build() {
	cd "$srcdir/geary"
	meson --prefix=/usr --buildtype=release -Dprofile=release build
	ninja -v -C build
}

package() {
	cd "$srcdir/geary"
	DESTDIR="$pkgdir" ninja -v -C build install
}
