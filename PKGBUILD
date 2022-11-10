# Maintainer: Nick Logozzo <nlogozzo225@gmail.com>
pkgname=nickvision-tube-converter
pkgver=2022.11.0
pkgrel=1
pkgdesc="An easy-to-use YouTube video downloader"
arch=(x86_64)
url="https://github.com/nlogozzo/NickvisionTubeConverter"
license=(GPL3)
depends=(gtk4 libadwaita jsoncpp libcurlpp yt-dlp webkit2gtk-5.0 ffmpeg)
makedepends=(git cmake)
source=("git+https://github.com/nlogozzo/NickvisionTubeConverter.git#tag=${pkgver}")
sha256sums=('SKIP')

build() {
    cd "$srcdir/NickvisionTubeConverter"
    meson builddir --prefix=/usr
}

package() {
    cd "$srcdir/NickvisionTubeConverter"
    DESTDIR="${pkgdir}" ninja -C builddir install
    ln -s /usr/bin/org.nickvision.tubeconverter "${pkgdir}/usr/bin/${pkgname}"
}
