# Maintainer: Joaquin <joaquingc123 at gmail dot com>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Dies <JerryCasiano(at)gmail(dot)com>
# Contributor: Joeny Ang <ang(dot)joeny(at)gmail(dot)com>
# Contributor: Guan 'kuno' Qing <neokuno(at)gmail(dot)com>
# Contributor: Guten Ye <ywzhaifei(at)gmail(dot)com>
# Contributor: i_magnific0 <i_magnific0(at)yahoo(dot)com>
# Contributor: Pavlo <pavlofreemen(at)gmail(dot)com>

pkgname=font-manager
pkgver=0.8.3
pkgrel=1
pkgdesc='A simple font management application for GTK+ Desktop Environments'
url='https://fontmanager.github.io'
arch=('x86_64' 'i686')
license=('GPL')
depends=('libsoup' 'libxml2' 'sqlite' 'json-glib' 'gtk3' 'webkit2gtk')
optdepends=('file-roller')
makedepends=('intltool' 'yelp-tools' 'gobject-introspection' 'vala' 'meson' 'ninja' 'libxml2')
source=("https://github.com/FontManager/master/releases/download/$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('b1f0d22cada36aa8d8508aff0bfc72af276e73acc074a28897449f5f4ed14ac6')

build() {
    cd "$pkgname-$pkgver"
    meson --prefix /usr --buildtype=release build_dir
    ninja -v -C build_dir
}

package() {
    cd "$pkgname-$pkgver"
    DESTDIR="$pkgdir" ninja -C build_dir install
}
