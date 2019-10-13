# Maintainer: Daniel Playfair Cal <daniel.playfair.cal@gmail.com>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Pierre Schmitz <pierre@archlinux.de>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=chromium-ozone
pkgver=77.0.3865.120
pkgrel=1
_launcher_ver=6
_meta_browser_sha=34ef417cdcf848839b59c086be046c2b4a96ac32
pkgdesc="Chromium built with patches for wayland support via Ozone"
arch=('x86_64')
url="https://www.chromium.org/Home"
options=(debug !strip)
license=('BSD')
depends=('gtk3' 'nss' 'alsa-lib' 'xdg-utils' 'libxss' 'libcups' 'libgcrypt'
         'ttf-font' 'systemd' 'dbus' 'libpulse' 'pciutils' 'json-glib' 'libva'
         'desktop-file-utils' 'hicolor-icon-theme')
provides=('chromium')
conflicts=('chromium')
makedepends=('python' 'python2' 'gperf' 'yasm' 'mesa' 'ninja' 'nodejs' 'git'
             'clang' 'lld' 'gn' 'java-runtime-headless')
optdepends=('pepper-flash: support for Flash content'
            'kdialog: needed for file dialogs in KDE'
            'gnome-keyring: for storing passwords in GNOME keyring'
            'kwallet: for storing passwords in KWallet')
install=chromium.install
source=(https://commondatastorage.googleapis.com/chromium-browser-official/chromium-$pkgver.tar.xz
        chromium-launcher-$_launcher_ver.tar.gz::https://github.com/foutrelis/chromium-launcher/archive/v$_launcher_ver.tar.gz
        meta-browser-${_meta_browser_sha}.tar.gz::https://github.com/OSSystems/meta-browser/archive/${_meta_browser_sha}.tar.gz
        include-memory-in-one_euro_filter.h.patch
        link-against-harfbuzz-subset.patch
        fix-wrong-string-initialization-in-LinkedHashSet.patch
        include-limits-in-web_time_range.cc.patch
        chromium-system-icu.patch
        chromium-system-zlib.patch
        chromium-widevine.patch
        chromium-skia-harmony.patch
        0001-ozone-wayland-Sway-avoid-sending-presentation-early.patch
        0002-ozone-wayland-Use-mutex-before-accessing-surfaces-ma.patch
        0003-ozone-wayland-Stop-using-wl_display_roundtrip.patch
        0004-ozone-wayland-Extract-window-management-methods-to-o.patch
        0005-ozone-wayland-Do-not-use-possibly-blocking-dispatch-.patch
        0006-ozone-wayland-Implement-CreateNativePixmapAsync.patch)
sha256sums=('d792f9b09b1dcfd64e68f47a611c540dd1383dd9abd78ca1e06b2a7e2ff06af8'
            '04917e3cd4307d8e31bfb0027a5dce6d086edb10ff8a716024fbb8bb0c7dccf1'
            '892026717ac487e1a92073d7a363a7f4a12b06ed6ac61825842ad734eda857d7'
            '33a5bcd1df2cc7aa7467fa882790ef143a4497d2b704c9e1ea86c8ede90c2d90'
            'ab986e4b723dfcedab1bc8dcada07526facae28a8a7ff3345f658532c1d99987'
            '840f555020751ec284dca35b9317a9dd7dc69fcb910ea1cae2dd7cc9b237dfb7'
            'd3dfe3c86901a11636972a774ed6c941ac76e38c9e4a384f458043a0a03291a9'
            'e73cc2ee8d3ea35aab18c478d76fdfc68ca4463e1e10306fa1e738c03b3f26b5'
            '0f7ba6882844542a7226b419dfefc5b6a16b5b7882698bd773b5ee9148aa6e87'
            'd081f2ef8793544685aad35dea75a7e6264a2cb987ff3541e6377f4a3650a28b'
            '771292942c0901092a402cc60ee883877a99fb804cb54d568c8c6c94565a48e1'
            'c43f54e180a9eeed31ef6b0e05ec98afbb5fc1197c71e119293784bb37579439'
            '3d83763a5ccd4a8dd59a4d1ffbae3fcfba7688e32b6acd03505f779c7bfa8d02'
            '811567d57cf22139e6ace8c8fdbc329a24f586f68214daf6dd224f56cac792b3'
            '5c4b5b596b2b3bdcf33b865d44f1daa0787fc52a2a1d6ac82a6f03287ca6355a'
            '231147345c0f175263cacddb62c97c7b13897870f5ebac9fa6feabf9cc28ea2d'
            'bec73f9f8b88e2c83549fc851f21fd7d0a6db714f713147f253eb7de17508efc')

# Possible replacements are listed in build/linux/unbundle/replace_gn_files.py
# Keys are the names in the above script; values are the dependencies in Arch
declare -gA _system_libs=(
  [ffmpeg]=ffmpeg
  [flac]=flac
  [fontconfig]=fontconfig
  [freetype]=freetype2
  [harfbuzz-ng]=harfbuzz
  [icu]=icu
  [libdrm]=
  [libjpeg]=libjpeg
  #[libpng]=libpng            # https://crbug.com/752403#c10
  [libvpx]=libvpx
  [libwebp]=libwebp
  [libxml]=libxml2
  [libxslt]=libxslt
  [opus]=opus
  [re2]=re2
  [snappy]=snappy
  [yasm]=
  [zlib]=minizip
)
_unwanted_bundled_libs=(
  ${!_system_libs[@]}
  ${_system_libs[libjpeg]+libjpeg_turbo}
)
depends+=(${_system_libs[@]})

# Google API keys (see https://www.chromium.org/developers/how-tos/api-keys)
# Note: These are for Arch Linux use ONLY. For your own distribution, please
# get your own set of keys.
_google_api_key=AIzaSyDwr302FpOSkGRpLlUpPThNTDPbXcIn_FM
_google_default_client_id=413772536636.apps.googleusercontent.com
_google_default_client_secret=0ZChLK6AxeA3Isu96MkwqDR4

_mb_general_patches=()

_mb_wayland_patches=(
  # 'V4L2/0001-Add-support-for-V4L2VDA-on-Linux.patch'
  # 'V4L2/0002-Add-mmap-via-libv4l-to-generic_v4l2_device.patch'
)

_bugfix_patches=(
  '0001-ozone-wayland-Sway-avoid-sending-presentation-early.patch'
  '0002-ozone-wayland-Use-mutex-before-accessing-surfaces-ma.patch'
  '0003-ozone-wayland-Stop-using-wl_display_roundtrip.patch'
  '0004-ozone-wayland-Extract-window-management-methods-to-o.patch'
  '0005-ozone-wayland-Do-not-use-possibly-blocking-dispatch-.patch'
  '0006-ozone-wayland-Implement-CreateNativePixmapAsync.patch'
)

prepare() {
  cd "$srcdir/chromium-$pkgver"

  # Allow building against system libraries in official builds
  sed -i 's/OFFICIAL_BUILD/GOOGLE_CHROME_BUILD/' \
    tools/generate_shim_headers/generate_shim_headers.py

  # https://crbug.com/893950
  sed -i -e 's/\<xmlMalloc\>/malloc/' -e 's/\<xmlFree\>/free/' \
    third_party/blink/renderer/core/xml/*.cc \
    third_party/blink/renderer/core/xml/parser/xml_document_parser.cc \
    third_party/libxml/chromium/libxml_utils.cc

  # https://crbug.com/819294
  patch -Np1 -i ../include-memory-in-one_euro_filter.h.patch

  # https://groups.google.com/a/chromium.org/d/msg/chromium-packagers/UyJsVJ5QqWo/jSv5z7-rEQAJ
  patch -Np1 -i ../link-against-harfbuzz-subset.patch

  # https://crbug.com/980025
  patch -Np1 -i ../fix-wrong-string-initialization-in-LinkedHashSet.patch

  # https://crbug.com/992832
  patch -Np1 -i ../include-limits-in-web_time_range.cc.patch

  # Fixes from Gentoo
  patch -Np1 -i ../chromium-system-icu.patch
  patch -Np1 -i ../chromium-system-zlib.patch

  # Load Widevine CDM if available
  patch -Np1 -i ../chromium-widevine.patch

  # https://crbug.com/skia/6663#c10
  patch -Np0 -i ../chromium-skia-harmony.patch

  # chromium-ozone-wayland
  for PATCH in ${_mb_general_patches[@]}
  do
    echo "Applying $PATCH"
    patch -Np1 -i $srcdir/meta-browser-${_meta_browser_sha}/recipes-browser/chromium/files/${PATCH}
  done

  for PATCH in ${_mb_wayland_patches[@]}
  do
    echo "Applying $PATCH"
    patch -Np1 -i $srcdir/meta-browser-${_meta_browser_sha}/recipes-browser/chromium/chromium-ozone-wayland/${PATCH}
  done

  for PATCH in ${_bugfix_patches[@]}
  do
    echo "Applying $PATCH"
    patch -Np1 -i $srcdir/${PATCH}
  done

  # Force script incompatible with Python 3 to use /usr/bin/python2
  sed -i '1s|python$|&2|' third_party/dom_distiller_js/protoc_plugins/*.py

  mkdir -p third_party/node/linux/node-linux-x64/bin
  ln -s /usr/bin/node third_party/node/linux/node-linux-x64/bin/

  # Remove bundled libraries for which we will use the system copies; this
  # *should* do what the remove_bundled_libraries.py script does, with the
  # added benefit of not having to list all the remaining libraries
  local _lib
  for _lib in ${_unwanted_bundled_libs[@]}; do
    find "third_party/$_lib" -type f \
      \! -path "third_party/$_lib/chromium/*" \
      \! -path "third_party/$_lib/google/*" \
      \! -path 'third_party/yasm/run_yasm.py' \
      \! -regex '.*\.\(gn\|gni\|isolate\)' \
      -delete
  done

  python2 build/linux/unbundle/replace_gn_files.py \
    --system-libraries "${!_system_libs[@]}"

  python2 tools/clang/scripts/update.py
}

build() {
  make -C chromium-launcher-$_launcher_ver

  cd "$srcdir/chromium-$pkgver"

  local _flags=(
    'is_official_build=true' # implies is_cfi=true on x86_64
    'treat_warnings_as_errors=false'
    'fieldtrial_testing_like_official_build=true'
    'ffmpeg_branding="Chrome"'
    'proprietary_codecs=true'
    'link_pulseaudio=true'
    'use_gnome_keyring=false'
    'use_sysroot=false'
    'linux_use_bundled_binutils=false'
    'use_custom_libcxx=false'
    'enable_hangout_services_extension=true'
    'enable_widevine=true'
    'use_ozone=true'
    'ozone_platform_wayland=true'
    'ozone_auto_platforms=false'
    'use_xkbcommon=true'
    'use_system_libwayland=true'
    'use_system_minigbm=true'
    'use_system_libdrm=true'
    'use_vaapi=false'
    'use_jumbo_build=true'
    'enable_nacl=false'
    'enable_swiftshader=false'
    "google_api_key=\"${_google_api_key}\""
    "google_default_client_id=\"${_google_default_client_id}\""
    "google_default_client_secret=\"${_google_default_client_secret}\""
  )

  if check_buildoption ccache y; then
    # Avoid falling back to preprocessor mode when sources contain time macros
    export CCACHE_SLOPPINESS=time_macros
    _flags+=('cc_wrapper="ccache"')
  fi

  if check_option strip y; then
    _flags+=('symbol_level=0')
  else
    _flags+=('symbol_level=1')
  fi

  gn gen out/Release --args="${_flags[*]}" --script-executable=/usr/bin/python2
  ninja -C out/Release chrome chrome_sandbox chromedriver
}

package() {
  cd chromium-launcher-$_launcher_ver
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/chromium/LICENSE.launcher"

  cd "$srcdir/chromium-$pkgver"

  install -D out/Release/chrome "$pkgdir/usr/lib/chromium/chromium"
  install -Dm4755 out/Release/chrome_sandbox "$pkgdir/usr/lib/chromium/chrome-sandbox"
  ln -s /usr/lib/chromium/chromedriver "$pkgdir/usr/bin/chromedriver"

  install -Dm644 chrome/installer/linux/common/desktop.template \
    "$pkgdir/usr/share/applications/chromium.desktop"
  install -Dm644 chrome/app/resources/manpage.1.in \
    "$pkgdir/usr/share/man/man1/chromium.1"
  sed -i \
    -e "s/@@MENUNAME@@/Chromium/g" \
    -e "s/@@PACKAGE@@/chromium/g" \
    -e "s/@@USR_BIN_SYMLINK_NAME@@/chromium/g" \
    "$pkgdir/usr/share/applications/chromium.desktop" \
    "$pkgdir/usr/share/man/man1/chromium.1"

  cp \
    out/Release/{chrome_{100,200}_percent,resources}.pak \
    out/Release/{*.bin,chromedriver} \
    "$pkgdir/usr/lib/chromium/"
  install -Dm644 -t "$pkgdir/usr/lib/chromium/locales" out/Release/locales/*.pak

  if [[ -z ${_system_libs[icu]+set} ]]; then
    cp out/Release/icudtl.dat "$pkgdir/usr/lib/chromium/"
  fi

  for size in 24 48 64 128 256; do
    install -Dm644 "chrome/app/theme/chromium/product_logo_$size.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/chromium.png"
  done

  for size in 16 32; do
    install -Dm644 "chrome/app/theme/default_100_percent/chromium/product_logo_$size.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/chromium.png"
  done

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/chromium/LICENSE"
}

# vim:set ts=2 sw=2 et:
