# Maintainer: JustKidding <jk@vin.ovh>

# Based on aur/chromium-vaapi, with ungoogled-chromium patches

# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Pierre Schmitz <pierre@archlinux.de>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=ungoogled-chromium-git
pkgver=85.0.4183.121.1.r0.ge46b774
pkgrel=1
_launcher_ver=6
_gcc_patchset=2
_pkgname=$(echo $pkgname | cut -d\- -f1-2)
_pkgver=$(echo $pkgver | cut -d\. -f1-4)
# ungoogled chromium variables
_uc_ver=master
_uc_usr=Eloston
_uc_sum='SKIP'
_uc_url="$_pkgname-$_uc_ver::git://github.com/$_uc_usr/ungoogled-chromium.git"
pkgdesc="A lightweight approach to removing Google web service dependency (master branch)"
arch=('x86_64')
url="https://github.com/Eloston/ungoogled-chromium"
license=('BSD')
depends=('gtk3' 'nss' 'alsa-lib' 'xdg-utils' 'libxss' 'libcups' 'libgcrypt'
         'ttf-liberation' 'systemd' 'dbus' 'libpulse' 'pciutils' 'json-glib'
         'desktop-file-utils' 'hicolor-icon-theme')
makedepends=('python' 'python2' 'gperf' 'mesa' 'ninja' 'nodejs' 'git' 'libva'
             'libpipewire02' 'clang' 'lld' 'gn-m85' 'java-runtime-headless'
             'python2-setuptools')
optdepends=('pepper-flash: support for Flash content'
            'libpipewire02: WebRTC desktop sharing under Wayland'
            'libva: hardware-accelerated video decode [experimental]'
            'kdialog: needed for file dialogs in KDE'
            'org.freedesktop.secrets: password storage backend on GNOME / Xfce'
            'kwallet: for storing passwords in KWallet on KDE desktops')
provides=('chromium')
conflicts=('chromium')
install=chromium.install
source=(https://commondatastorage.googleapis.com/chromium-browser-official/chromium-$_pkgver.tar.xz
        $_uc_url
        chromium-launcher-$_launcher_ver.tar.gz::https://github.com/foutrelis/chromium-launcher/archive/v$_launcher_ver.tar.gz
        chromium-drirc-disable-10bpc-color-configs.conf
        https://github.com/stha09/chromium-patches/releases/download/chromium-${pkgver%%.*}-patchset-$_gcc_patchset/chromium-${pkgver%%.*}-patchset-$_gcc_patchset.tar.xz
        media-Set-allocation-limit-compatible-with-FFmpeg-4.3.patch
        intel-vp9-quirk.patch
        wayland-egl.patch
        nvidia-vdpau.patch
        chromium-skia-harmony.patch)
sha256sums=('e018547e54566410fb365d9f3dae10037c30fca5debe6ba8baceef3ad3b03d28'
            $_uc_sum
            '04917e3cd4307d8e31bfb0027a5dce6d086edb10ff8a716024fbb8bb0c7dccf1'
            'babda4f5c1179825797496898d77334ac067149cac03d797ab27ac69671a7feb'
            '2194fe22b9e5ccdc4a86da4e3572214f670c561486671f57c90636fd3cbfa43e'
            '0f041d655335cd2a4773ae7ca5e301a0ff12c6c53f57b7cf6651c268e0420a1c'
            'a25fc6fccb84fd0a58a799661cd9c4ffeb2731fa49268f43aa7108f1542c5af6'
            '34d08ea93cb4762cb33c7cffe931358008af32265fc720f2762f0179c3973574'
            '8095bf73afbca7c2b07306c5b4dd8f79b66e1053fa4e58b07f71ef938be603f1'
            '771292942c0901092a402cc60ee883877a99fb804cb54d568c8c6c94565a48e1')

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
  [libpng]=libpng
  #[libvpx]=libvpx
  [libwebp]=libwebp
  [libxml]=libxml2
  [libxslt]=libxslt
  [opus]=opus
  [re2]=re2
  [snappy]=snappy
  [zlib]=minizip
)
_unwanted_bundled_libs=(
  $(printf "%s\n" ${!_system_libs[@]} | sed 's/^libjpeg$/&_turbo/')
)
depends+=(${_system_libs[@]})

pkgver() {
  cd "$_pkgname-$_uc_ver"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/chromium-$_pkgver"

  # Allow building against system libraries in official builds
  sed -i 's/OFFICIAL_BUILD/GOOGLE_CHROME_BUILD/' \
    tools/generate_shim_headers/generate_shim_headers.py

  # https://crbug.com/893950
  sed -i -e 's/\<xmlMalloc\>/malloc/' -e 's/\<xmlFree\>/free/' \
    third_party/blink/renderer/core/xml/*.cc \
    third_party/blink/renderer/core/xml/parser/xml_document_parser.cc \
    third_party/libxml/chromium/*.cc

  # https://crbug.com/1095962
  patch -Np1 -i ../media-Set-allocation-limit-compatible-with-FFmpeg-4.3.patch

  # Fixes for building with libstdc++ instead of libc++
  patch -Np1 -i ../patches/chromium-85-NearbyShareEncryptedMetadataKey-include.patch
  patch -Np1 -i ../patches/chromium-85-sim_hash-include.patch

  # https://crbug.com/skia/6663#c10
  patch -Np0 -i ../chromium-skia-harmony.patch

  # Intel KabyLake/GeminiLake VP9 quirk
  patch -Np1 -i ../intel-vp9-quirk.patch

  # Wayland/EGL regression (crbug #1071528 #1071550)
  patch -Np1 -i ../wayland-egl.patch

  # NVIDIA vdpau-wrapper
  patch -Np1 -i ../nvidia-vdpau.patch

  # Ungoogled Chromium changes
  _ungoogled_repo="$srcdir/$_pkgname-$_uc_ver"
  _utils="${_ungoogled_repo}/utils"
  msg2 'Pruning binaries'
  python "$_utils/prune_binaries.py" ./ "$_ungoogled_repo/pruning.list"
  msg2 'Applying patches'
  python "$_utils/patches.py" apply ./ "$_ungoogled_repo/patches"
  msg2 'Applying domain substitution'
  python "$_utils/domain_substitution.py" apply -r "$_ungoogled_repo/domain_regex.list" \
    -f "$_ungoogled_repo/domain_substitution.list" -c domainsubcache.tar.gz ./

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
      \! -path "third_party/harfbuzz-ng/utils/hb_scoped.h" \
      \! -regex '.*\.\(gn\|gni\|isolate\)' \
      -delete
  done

  python2 build/linux/unbundle/replace_gn_files.py \
    --system-libraries "${!_system_libs[@]}"
}

build() {
  make -C chromium-launcher-$_launcher_ver

  cd "$srcdir/chromium-$_pkgver"

  if check_buildoption ccache y; then
    # Avoid falling back to preprocessor mode when sources contain time macros
    export CCACHE_SLOPPINESS=time_macros
  fi

  export CC=clang
  export CXX=clang++
  export AR=ar
  export NM=nm

  local _flags=(
    'custom_toolchain="//build/toolchain/linux/unbundle:default"'
    'host_toolchain="//build/toolchain/linux/unbundle:default"'
    'is_official_build=true' # implies is_cfi=true on x86_64
    'ffmpeg_branding="Chrome"'
    'proprietary_codecs=true'
    'rtc_use_pipewire=true'
    'link_pulseaudio=true'
    'use_gnome_keyring=false'
    'use_sysroot=false'
    'use_custom_libcxx=false'
    'enable_widevine=true'
    'use_vaapi=true'
  )

  if [[ -n ${_system_libs[icu]+set} ]]; then
    _flags+=('icu_use_data_file=false')
  fi

  if check_option strip y; then
    _flags+=('symbol_level=0')
  fi

  # Append ungoogled chromium flags to _flags array
  _ungoogled_repo="$srcdir/$_pkgname-$_uc_ver"
  readarray -t -O ${#_flags[@]} _flags < "${_ungoogled_repo}/flags.gn"

  # Facilitate deterministic builds (taken from build/config/compiler/BUILD.gn)
  CFLAGS+='   -Wno-builtin-macro-redefined'
  CXXFLAGS+=' -Wno-builtin-macro-redefined'
  CPPFLAGS+=' -D__DATE__=  -D__TIME__=  -D__TIMESTAMP__='

  # Do not warn about unknown warning options
  CFLAGS+='   -Wno-unknown-warning-option'
  CXXFLAGS+=' -Wno-unknown-warning-option'

  msg2 'Configuring Chromium'
  gn-m85 gen out/Release --args="${_flags[*]}" --script-executable=/usr/bin/python2
  msg2 'Building Chromium'
  ninja -C out/Release chrome chrome_sandbox chromedriver
}

package() {
  cd chromium-launcher-$_launcher_ver
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/chromium/LICENSE.launcher"

  cd "$srcdir/chromium-$_pkgver"

  install -D out/Release/chrome "$pkgdir/usr/lib/chromium/chromium"
  install -Dm4755 out/Release/chrome_sandbox "$pkgdir/usr/lib/chromium/chrome-sandbox"
  ln -s /usr/lib/chromium/chromedriver "$pkgdir/usr/bin/chromedriver"

  install -Dm644 ../chromium-drirc-disable-10bpc-color-configs.conf \
    "$pkgdir/usr/share/drirc.d/10-$pkgname.conf"

  install -Dm644 chrome/installer/linux/common/desktop.template \
    "$pkgdir/usr/share/applications/chromium.desktop"
  install -Dm644 chrome/app/resources/manpage.1.in \
    "$pkgdir/usr/share/man/man1/chromium.1"
  sed -i \
    -e 's/@@MENUNAME@@/Chromium/g' \
    -e 's/@@PACKAGE@@/chromium/g' \
    -e 's/@@USR_BIN_SYMLINK_NAME@@/chromium/g' \
    "$pkgdir/usr/share/applications/chromium.desktop" \
    "$pkgdir/usr/share/man/man1/chromium.1"

  install -Dm644 chrome/installer/linux/common/chromium-browser/chromium-browser.appdata.xml \
    "$pkgdir/usr/share/metainfo/chromium.appdata.xml"
  sed -ni \
    -e 's/chromium-browser\.desktop/chromium.desktop/' \
    -e '/<update_contact>/d' \
    -e '/<p>/N;/<p>\n.*\(We invite\|Chromium supports Vorbis\)/,/<\/p>/d' \
    -e '/^<?xml/,$p' \
    "$pkgdir/usr/share/metainfo/chromium.appdata.xml"

  local toplevel_files=(
    chrome_100_percent.pak
    chrome_200_percent.pak
    resources.pak
    v8_context_snapshot.bin

    # ANGLE
    libEGL.so
    libGLESv2.so

    chromedriver
  )

  if [[ -z ${_system_libs[icu]+set} ]]; then
    toplevel_files+=(icudtl.dat)
  fi

  cp "${toplevel_files[@]/#/out/Release/}" "$pkgdir/usr/lib/chromium/"
  install -Dm644 -t "$pkgdir/usr/lib/chromium/locales" out/Release/locales/*.pak
  install -Dm755 -t "$pkgdir/usr/lib/chromium/swiftshader" out/Release/swiftshader/*.so

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

# vim:set ts=2 sw=2 et ft=sh:
