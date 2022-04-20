# Maintainer: David Husička <contact@bydave.net>
# Co-maintainer: Tuhana GAYRETLİ <tuhana at tuta dot io>
# Contributor: Tyler Nelson <neo@cybercat.cc>

pkgname=osu-lazer-bin
_pkgname=${pkgname%-bin}
pkgver=2022.418.0
pkgrel=1
pkgdesc="The future of osu! and the beginning of an open era! Commonly known by the codename osu!lazer. Pew pew."
arch=("x86_64")
url="https://osu.ppy.sh"
license=("MIT" "custom:CC-BY-NC 4.0")
depends=(
  ffmpeg4.4
  zlib
  libgl
  fuse2
  osu-mime
)
provides=(osu-lazer)
conflicts=(osu-lazer)
options=(!strip)
source=(
  "https://github.com/ppy/osu/releases/download/$pkgver/osu.AppImage"
  "https://raw.githubusercontent.com/ppy/osu/master/assets/lazer.png"
  "https://raw.githubusercontent.com/ppy/osu-resources/master/LICENCE.md"
  "osu-lazer.desktop"
)
noextract=("osu.AppImage")
sha256sums=(
  "b746bd679ee2cdb624da6c1202c0a3e6152adb63be8db99b9f62a6c67674bd88"
  "36f73cfe0a84cd65a8bb54fcde5a01c419b134bee4a88cc92eb4f33236343a10"
  "30b914824784b6ba6b30a44b22bea4f3c6fbc10f3f0e74fde5ca76a92ef57244"
  "77ace2dca8f81966222eb7cceea4990cc04043b9b4b54991ff8148fc47123c76"
)

package() {
  cd "$srcdir"

  # Install pixmap and binary
  install -Dm644 lazer.png "$pkgdir/usr/share/pixmaps/osu-lazer.png"
  install -Dm755 osu.AppImage "$pkgdir/usr/bin/osu-lazer"

  # Install desktop and license file
  install -Dm644 -t "$pkgdir/usr/share/applications" osu-lazer.desktop
  install -Dm644 -t "$pkgdir/usr/share/licenses/$_pkgname" LICENCE.md
}
