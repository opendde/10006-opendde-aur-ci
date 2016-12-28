# Maintainer: James Bunton <jamesbunton@delx.net.au>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Sebastien Piccand <sebcactus gmail com>

pkgname=('handbrake-fdkaac' 'handbrake-cli-fdkaac')
pkgver=1.0.0
pkgrel=1
arch=('i686' 'x86_64')
url="https://handbrake.fr/"
license=('GPL')
makedepends=('intltool' 'python2' 'yasm' 'wget' 'bzip2' 'gcc-libs' 'libnotify'
             'gst-plugins-base' 'gtk3' 'dbus-glib' 'fribidi' 'libass' 'lame'
             'fontconfig' 'freetype2' 'libxml2' 'libogg' 'libvorbis' 'cmake'
             'libtheora' 'libsamplerate' 'ffmpeg' 'x264' 'libx264' 'x265'
             'libvpx' 'libdvdnav' 'jansson' 'librsvg' 'libgudev' 'libfdk-aac')
source=(https://handbrake.fr/mirror/HandBrake-$pkgver.tar.bz2
        handbrake-fix-missing-x265-link-flag.patch)
sha256sums=('15fb4593c70d75621212e4499f018c3c93d7ce39f1083bf527d4616ded0044c5'
            '05e212e76b6e0b94a04de02cbeb7bf9db607059e19297b5bd3d0d143135285c4')

prepare() {
  cd "$srcdir/HandBrake-$pkgver"

  # https://bugs.gentoo.org/show_bug.cgi?id=552792
  patch -Np1 -i ../handbrake-fix-missing-x265-link-flag.patch

  # Use more system libs
  # Bundled libbluray is kept because it is patched locally
  for _lib in ffmpeg x265 libvpx libdvdnav libdvdread; do
    sed -i "/MODULES += contrib\/$_lib/d" make/include/main.defs
  done
}

build() {
  cd "$srcdir/HandBrake-$pkgver"

  ./configure \
    --prefix=/usr \
    --disable-gtk-update-checks \
    --enable-fdk
  make -C build
}

package_handbrake-fdkaac() {
  pkgdesc="Multithreaded video transcoder"
  conflicts=('handbrake')
  depends=('bzip2' 'gcc-libs' 'gst-plugins-base' 'libnotify' 'dbus-glib'
           'fribidi' 'libass' 'lame' 'gtk3' 'fontconfig' 'freetype2' 'libxml2'
           'libogg' 'libvorbis' 'libtheora' 'libsamplerate' 'ffmpeg' 'libx264'
           'x265' 'libvpx' 'libdvdnav' 'jansson' 'librsvg' 'libgudev'
           'desktop-file-utils' 'hicolor-icon-theme' 'libfdk-aac')
  optdepends=('gst-plugins-good: for video previews'
              'gst-libav: for video previews')

  cd "$srcdir/HandBrake-$pkgver/build"

  make DESTDIR="$pkgdir" install
  rm "$pkgdir/usr/bin/HandBrakeCLI"
}

package_handbrake-cli-fdkaac() {
  pkgdesc="Multithreaded video transcoder (CLI)"
  conflicts=('handbrake-cli')
  depends=('bzip2' 'gcc-libs' 'zlib' 'fribidi' 'libass' 'lame' 'libxml2'
           'libtheora' 'libsamplerate' 'ffmpeg' 'libx264' 'x265' 'libvpx'
           'libdvdnav' 'jansson' 'libfdk-aac')

  cd "$srcdir/HandBrake-$pkgver/build"
  install -D HandBrakeCLI "$pkgdir/usr/bin/HandBrakeCLI"
}

# vim:set ts=2 sw=2 et:
