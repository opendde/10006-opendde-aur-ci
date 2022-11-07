# Maintainer: tytan652 <tytan652@tytanium.xyz>

_pluginname=gradient-source
pkgname=obs-$_pluginname
pkgver=0.3.0
_obsver=28.0.0
pkgrel=4
pkgdesc="Gradient Source for OBS studio"
arch=("i686" "x86_64" "aarch64")
url="https://obsproject.com/forum/resources/gradient-source.1172/"
license=("GPL2")
depends=("obs-studio>=$_obsver")
makedepends=("cmake" "git" "libxcomposite" "ffmpeg" "pciutils")
source=(
  "$pkgname::git+https://github.com/exeldro/$pkgname#commit=ff6c915204d31a45f576f1f43875bfef18c71f04"
  "obs-studio-$_obsver.tar.gz::https://github.com/obsproject/obs-studio/archive/$_obsver.tar.gz"
)
sha256sums=(
  'SKIP'
  '412a1a26699a6861dbbe93346310d002369c62e00626e8c3a77c127e5e1c06e8'
)

prepare() {
  rm -rf fakeroot

  cd "obs-studio-$_obsver"/plugins
  cp -r "$srcdir/$pkgname" .
  sed -i 's|check_obs_browser()||g' CMakeLists.txt
  sed -i 's|FATAL_ERROR "obs-websocket|STATUS "obs-websocket|g' CMakeLists.txt
  echo "add_subdirectory($pkgname)" | tee -a CMakeLists.txt >/dev/null
}

# Need to compile plugin in OBS compilation process
build() {
  cd "obs-studio-$_obsver"
  cmake -B build \
  -DCMAKE_INSTALL_PREFIX=/usr \
  -DCMAKE_INSTALL_LIBDIR=lib \
  -DENABLE_UI=OFF \
  -DENABLE_WAYLAND=OFF \
  -DENABLE_PIPEWIRE=OFF \
  -DENABLE_SCRIPTING=OFF \
  -DENABLE_DECKLINK=OFF \
  -DENABLE_ALSA=OFF \
  -DENABLE_JACK=OFF \
  -DENABLE_PULSEAUDIO=OFF \
  -DENABLE_V4L2=OFF \
  -DENABLE_SPEEXDSP=OFF \
  -DENABLE_LIBFDK=OFF \
  -DENABLE_SNDIO=OFF \
  -DENABLE_FREETYPE=OFF \
  -DENABLE_VLC=OFF \
  -DENABLE_BROWSER=OFF \
  -DENABLE_VST=OFF \
  -DENABLE_RTMPS=OFF \
  -DENABLE_AJA=OFF \
  -DENABLE_NEW_MPEGTS_OUTPUT=OFF

  make -C build
}

package() {
  mkdir -p "$pkgdir"/usr/lib/obs-plugins
  mkdir -p "$pkgdir"/usr/share/obs/obs-plugins

  cd "obs-studio-$_obsver"
  make -C build DESTDIR="$srcdir/fakeroot/" install
  cp -a "$srcdir"/fakeroot/usr/lib/obs-plugins/$_pluginname.so "$pkgdir"/usr/lib/obs-plugins/
  cp -a "$srcdir"/fakeroot/usr/share/obs/obs-plugins/$_pluginname "$pkgdir"/usr/share/obs/obs-plugins/
}