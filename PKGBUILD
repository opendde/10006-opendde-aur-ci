# Maintainer: Harsh Barsaiyan <hbarsaiyan@gmail.com>
# This file is automatically generated. Do not edit.

pkgname=youtube-music-bin
_pkgname=YouTube-Music
pkgver=1.7.4
pkgrel=1
epoch=
pkgdesc="YouTube Music Desktop App bundled with custom plugins like built-in ad blocker & downloader"
arch=('x86_64')
url="https://github.com/th-ch/youtube-music"
license=('MIT')
makedepends=('git')
source=("https://github.com/th-ch/youtube-music/releases/download/v${pkgver}/${_pkgname}-${pkgver}.AppImage"
        "https://raw.githubusercontent.com/th-ch/youtube-music/master/license"
        "youtube-music-bin.desktop")
noextract=('${_pkgname}-${pkgver}.AppImage')
options=(!strip)
sha512sums=(
            "f4cec3ddd40f6ee8e94dda8e39e7b02d872a69292d686daa2b87261ae91bbc3109f8f2101436ef29424b47884671f88c0ce5b992d774015d16eb8ef5aa07cf23"
            "SKIP"
            "5cde2a00f56761b510a550cbf685206646519068f5b1b14d0a0e6c954e38f677aef8ec83c53ff2c85b67ae539a4a419368f2593207548a868466502e675ae38c"
)

prepare(){
	chmod +x $_pkgname-$pkgver.AppImage
	./$_pkgname-$pkgver.AppImage --appimage-extract
}

package() {
	# install license
	install -Dm644 license "${pkgdir}/usr/share/licenses/${pkgname}/license"

	# install icon
	install -Dm644 "${srcdir}/squashfs-root/youtube-music.png" "${pkgdir}/usr/share/pixmaps/youtube-music-bin.png"

	# install appimage
	install -Dm755 ${_pkgname}-${pkgver}.AppImage "${pkgdir}/usr/bin/youtube-music-bin"

	# install desktop entry
	install -Dm755 youtube-music-bin.desktop "${pkgdir}/usr/share/applications/youtube-music-bin.desktop"
}
