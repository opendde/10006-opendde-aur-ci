# Maintainer: Gobidev <adrian[dot]groh[at]t-online[dot]de>
# Contributor: Dominik Schrempf <dominik dot schrempf at gmail dot com>
# Contributor: sekret, mail=$(echo c2VrcmV0QHBvc3Rlby5zZQo= | base64 -d)

pkgname=transcribe
pkgver=9.10
pkgrel=1
pkgdesc="music transcription aid"
arch=('i686' 'x86_64')
url="http://www.seventhstring.com/xscribe/overview.html"
license=('unknown')
depends=('libsm' 'gtk3' 'gst-plugins-base-libs')
source_x86_64=("https://www.seventhstring.com/xscribe/downlo/xscsetup-${pkgver}.0.tar.gz")
md5sums_x86_64=('fea4ca954ce5bed18af367eabf19e39d')

package() {
  cd "$srcdir/$pkgname"

  # Executable.
  install -Dm0755 "$pkgname" "$pkgdir/usr/lib/$pkgname/$pkgname"
  mkdir -p "$pkgdir/usr/bin"
  ln -s /usr/lib/$pkgname/$pkgname "$pkgdir/usr/bin/$pkgname"

  # Documentation.
  install "xschelp.htb" "$pkgdir/usr/lib/$pkgname/"

  # Library.
  lib="libgstvideosection.so"
  if [ -e "$lib" ]; then
    install -Dm0755 "$lib" "$pkgdir/usr/lib/gstreamer-1.0/$lib"
  fi

  # Icons.
  for icon in gtkicons/xsc*png
  do
    unprefixed=${icon#*xsc}
    size=${unprefixed%.png}
    install -Dm0644 $icon "$pkgdir/usr/share/icons/hicolor/${size}/apps/seventhstring-transcribe.png"
  done

  # Mime type with icon.
  mime_file=seventhstring-transcribe.xml
  cat <<"-EOF-" > $mime_file
<?xml version="1.0" encoding="UTF-8"?>
<mime-info xmlns="http://www.freedesktop.org/standards/shared-mime-info">
  <mime-type type="application/seventhstring-transcribe">
	<comment>Transcribe! File</comment>
	<glob pattern="*.xsc"/>
	<icon name="seventhstring-transcribe"/>
  </mime-type>
</mime-info>
-EOF-
  install -Dm0644 $mime_file "$pkgdir/usr/share/mime/packages/$mime_file"

  # Application .desktop file.
  desktop_file=seventhstring-transcribe.desktop
  cat  << -EOF- > $desktop_file
[Desktop Entry]
Encoding=UTF-8
Version=1.0
Type=Application
MimeType=application/seventhstring-transcribe;
Exec=transcribe %f
Categories=Audio;
Terminal=false
Icon=seventhstring-transcribe
Name=Transcribe!
-EOF-

  install -Dm0644 $desktop_file "$pkgdir/usr/share/applications/$desktop_file"
}

# vim:set ts=2 sw=2 et:
