# Maintainer: tytan652 <tytan652 at tytanium dot xyz>
# Contributor: Alice Gaudon <alice at gaudon dot pro>
# Contributor: Benjamin Klettbach <b dot klettbach at gmail dot com>
# Contributor: Jonathan Steel <jsteel at archlinux.org>
# Contributor: ArcticVanguard <LideEmily at gmail dot com>
# Contributor: ledti <antergist at gmail dot com>

DISTRIB_ID=`lsb_release --id | cut -f2 -d$'\t'`

pkgname=obs-studio-browser
pkgver=28.0.1
pkgrel=2
pkgdesc="Free and open source software for video recording and live streaming. With everything except service integration"
arch=("x86_64")
url="https://github.com/obsproject/obs-studio"
license=("GPL3")
_mbedtlsver=2.28
_pythonver=3.10
depends=(
  "jack" "gtk-update-icon-cache" "x264" "rnnoise" "pciutils" "qt6-svg"

  # "libxinerama" "qt5-svg" provided by "vlc-luajit"
  # "libxkbcommon-x11" provided by "qt5-base"
  # "jansson" "curl" provided by "ftl-sdk"

  # Needed to use Qt on Wayland platform
  "qt6-wayland"

  # Both needed to load linux-capture, so those two are no longer optional
  "libxcomposite" "pipewire"

  # Needed to use PipeWire capture
  "xdg-desktop-portal"

  # Needed by obs-browser
  "libxss" "libxrandr" "nss" "at-spi2-atk"
         
  # AUR Packages
  "ffmpeg-obs>=5" "vlc-luajit" "ftl-sdk"
)
# To manage mbedtls rebuild easily, this will prevent you to rebuild OBS on non-updated system
# For Manjaro user this feature is disabled
# Also OBS will need a patch when mbedtls 3 is on the repo
if [[ $DISTRIB_ID == 'ManjaroLinux' ]]; then
  depends+=('mbedtls')
else
  depends+=("mbedtls>=$_mbedtlsver")
fi
## About vlc-luajit
# The official VLC package will make OBS crash when a VLC source is used.
# The issue is that VLC and OBS are compiled with different lua version.
# So I also created vlc-luajit, a VLC package compiled with the same lua as OBS.
# But to make people unable to install VLC official package with obs-studio-tytan652.
# I decided to make vlc-luajit a dependency of OBS rather than an optional one.
## About ffmpeg-obs
# Read ffmpeg-obs PKGBUILD for more info
makedepends=(
  "cmake" "git" "libfdk-aac" "swig" "luajit" "sndio" "lsb-release"

  # Needed by obs-websocket
  'asio' 'nlohmann-json' 'websocketpp'

  # AUR Packages
  "libajantv2"
)
# To manage python rebuild easily, this will prevent you to rebuild OBS on non-updated system
# For Manjaro user this feature is disabled
if [[ $DISTRIB_ID == 'ManjaroLinux' ]]; then
  makedepends+=('python')
else
  makedepends+=("python>=$_pythonver")
fi
optdepends=(
  "libfdk-aac: FDK AAC codec support"
  "intel-media-driver: Hardware encoding (>= Broadwell)"
  "libva-intel-driver: Hardware encoding (<= Haswell)"
  "libva-mesa-driver: Hardware encoding"
  "swig: Scripting"
  "luajit: Lua scripting"
  "sndio: Sndio input client"
  "v4l2loopback-dkms: Virtual camera output"
  "libajantv2: AJA NTV 2 support"
  "decklink: Blackmagic Design DeckLink support"
)
# To manage python rebuild easily, this will prevent you to rebuild OBS on non-updated system
# For Manjaro user this feature is disabled
if [[ $DISTRIB_ID == 'ManjaroLinux' ]]; then
  optdepends+=("python: Python scripting")
else
  optdepends+=("python>=$_pythonver: Python scripting")
fi
provides=("obs-studio=$pkgver" "obs-vst" "obs-websocket" "obs-browser")
conflicts=("obs-studio" "obs-vst" "obs-websocket" "obs-browser" "obs-linuxbrowser")
options=('!strip')
_cefbranch=5060
source=(
  "obs-studio::git+https://github.com/obsproject/obs-studio.git#tag=$pkgver"
  "obs-browser::git+https://github.com/obsproject/obs-browser.git"
  "obs-websocket::git+https://github.com/obsproject/obs-websocket.git"
  "qr::git+https://github.com/nayuki/QR-Code-generator.git"
  "https://cdn-fastly.obsproject.com/downloads/cef_binary_${_cefbranch}_linux64.tar.bz2"
)
sha256sums=(
  "SKIP"
  "SKIP"
  "SKIP"
  "SKIP"
  "ac4e2a8ebf20700e4e36353e314f876623633dd5b474778a2548bb66bdbea11d"
)

if [[ $DISTRIB_ID == 'ManjaroLinux' ]]; then
source+=(
  "$pkgname.hook"
  "$pkgname.sh"
)
sha256sums+=(
  "e65c155cb5c35160d44ae3117f1fc69a9300bf12bfcdd337b139197b48b86654"
  "e5699cf7735c0d765b433d322917ae93238f26f5f332f2d351f1e85a3d1e2849"
)
fi

prepare() {
  cd "$srcdir/obs-studio"
  git config submodule.plugins/obs-browser.url $srcdir/obs-browser
  git config submodule.plugins/obs-websocket.url $srcdir/obs-websocket
  git submodule update

  cd plugins/obs-websocket
  sed -i 's|EXISTS ${CMAKE_CURRENT_SOURCE_DIR}/deps/json/CMakeLists.txt||' CMakeLists.txt
  sed -i 's|AND EXISTS ${CMAKE_CURRENT_SOURCE_DIR}/deps/websocketpp/CMakeLists.txt||' CMakeLists.txt
  sed -i 's|AND EXISTS ${CMAKE_CURRENT_SOURCE_DIR}/deps/asio/asio/include/asio.hpp||' CMakeLists.txt
  sed -i "s|AND EXISTS|EXISTS|" CMakeLists.txt
  sed -i "s|add_subdirectory(deps/json)|find_package(nlohmann_json 3.10.0 REQUIRED)|" CMakeLists.txt
  git config submodule.deps/qr.url $srcdir/qr
  git submodule update deps/qr
}

build() {
  cd "$srcdir"/cef_binary_${_cefbranch}_linux64

  #The arm64 CEF set the wrong arch for the project
  cmake \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo .

  make libcef_dll_wrapper

  cd "$srcdir"/obs-studio
  mkdir -p build; cd build

  cmake \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DENABLE_RTMPS=ON \
    -DQT_VERSION=6 \
    -DENABLE_LIBFDK=ON \
    -DENABLE_JACK=ON \
    -DENABLE_SNDIO=ON \
    -DCEF_ROOT_DIR="$srcdir/cef_binary_${_cefbranch}_linux64" \
    -DOBS_VERSION_OVERRIDE="$pkgver-browser-$pkgrel" ..

  make
}

package() {
  cd obs-studio/build

  make install DESTDIR="$pkgdir"

  if [[ $DISTRIB_ID == 'ManjaroLinux' ]]; then
    install -D -m644 "$srcdir/$pkgname.hook" -t "${pkgdir}"/usr/share/libalpm/hooks/
    install -D -m755 "$srcdir/$pkgname.sh" -t "${pkgdir}"/usr/share/libalpm/scripts/
  fi
}
