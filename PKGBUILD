# $Id$
# Maintainer: Iru Cai <mytbk920423@gmail.com>

pkgname=iridium
pkgver=51.1
pkgrel=4
_launcher_ver=3
pkgdesc="a free, open, and libre browser modification of the Chromium code base"
arch=('i686' 'x86_64')
url="https://iridiumbrowser.de/"
license=('BSD')
depends=('gtk2' 'nss' 'alsa-lib' 'xdg-utils' 'bzip2' 'libevent' 'libxss'
         'libexif' 'libgcrypt' 'ttf-font' 'systemd' 'dbus' 'flac' 'snappy'
         'speech-dispatcher' 'pciutils' 'libpulse' 'harfbuzz' 'libsecret'
         'libvpx' 'perl' 'perl-file-basedir' 'desktop-file-utils'
         'hicolor-icon-theme')
makedepends=('python2' 'gperf' 'yasm' 'mesa' 'ninja')
# makedepends_x86_64=('lib32-gcc-libs' 'lib32-zlib')
optdepends=('kdebase-kdialog: needed for file dialogs in KDE'
            'gnome-keyring: for storing passwords in GNOME keyring'
            'kwallet: for storing passwords in KWallet')
# provides=('chromium')
conflicts=('chromium')
replaces=('chromium')
options=('!strip')
source=(https://downloads.iridiumbrowser.de/source/iridium-browser-${pkgver}.tar.xz
        chromium-launcher-$_launcher_ver.tar.gz::https://github.com/foutrelis/chromium-launcher/archive/v$_launcher_ver.tar.gz
        chromium.desktop
        chromium-widevine.patch
        chromium-52.0.2743.116-unset-madv_free.patch
        chromium-cups-2.2.patch
        fix_PNGImageDecoder.patch)
sha256sums=('614a7cd4fe0a5ba57495fc7afbd407c0e5e59e8897d98c78f96f859e4c9bf80a'
            '8b01fb4efe58146279858a754d90b49e5a38c9a0b36a1f84cbb7d12f92b84c28'
            '028a748a5c275de9b8f776f97909f999a8583a4b77fd1cd600b4fc5c0c3e91e9'
            '4660344789c45c9b9e52cb6d86f7cb6edb297b39320d04f6947e5216d6e5f64c'
            'ed0229c19fff2fa1867499b5557d815b25ed2b81b21bccb5d10bd27cf747bac4'
            '6519cf913cb68e2def1bbf9210ef40a178b45bc9d325297c41b7a784ff57cc8e'
            '42086dbe5c68744a6bed4e4af6035defbd6e1dfc1c3f32a4711c5c953f938698')

# Google API keys (see http://www.chromium.org/developers/how-tos/api-keys)
# Note: These are for Arch Linux use ONLY. For your own distribution, please
# get your own set of keys. Feel free to contact foutrelis@archlinux.org for
# more information.
_google_api_key=AIzaSyDwr302FpOSkGRpLlUpPThNTDPbXcIn_FM
_google_default_client_id=413772536636.apps.googleusercontent.com
_google_default_client_secret=0ZChLK6AxeA3Isu96MkwqDR4

# We don't build PNaCL in Iridium
_build_nacl=0
if [[ $CARCH == i686 ]]; then
  _build_nacl=0
fi

prepare() {
  cd "$srcdir/iridium-browser-$pkgver"

  # https://groups.google.com/a/chromium.org/d/topic/chromium-packagers/9JX1N2nf4PU/discussion
  touch chrome/test/data/webui/i18n_process_css_test.html

  # https://code.google.com/p/chromium/issues/detail?id=541273
  #sed -i "/'target_name': 'libvpx'/s/libvpx/&_new/" build/linux/unbundle/libvpx.gyp

  patch -p0 -i ../fix_PNGImageDecoder.patch

  # Enable support for the Widevine CDM plugin
  # The actual libraries are not included, but can be copied over from Chrome:
  #   libwidevinecdmadapter.so
  #   libwidevinecdm.so
  # (Version string doesn't seem to matter so let's go with "Pinkie Pie")
  sed "s/@WIDEVINE_VERSION@/Pinkie Pie/" ../chromium-widevine.patch |
    patch -Np1

  # Commentception – use bundled ICU due to build failures (50.0.2661.75)
  # See https://crbug.com/584920 and https://crbug.com/592268
  # ---
  ## Remove bundled ICU; its header files appear to get picked up instead of
  ## the system ones, leading to errors during the final link stage.
  ## https://groups.google.com/a/chromium.org/d/topic/chromium-packagers/BNGvJc08B6Q
  #find third_party/icu -type f \! -regex '.*\.\(gyp\|gypi\|isolate\)' -delete

  # Disable MADV_FREE (if set by glibc)
  # https://bugzilla.redhat.com/show_bug.cgi?id=1361157
  patch -Np1 -i ../chromium-52.0.2743.116-unset-madv_free.patch

  # Fix compiling with CUPS 2.2 backend
  patch -Np0 -i ../chromium-cups-2.2.patch

  # Use Python 2
  find . -name '*.py' -exec sed -i -r 's|/usr/bin/python$|&2|g' {} +
  # There are still a lot of relative calls which need a workaround
  mkdir "$srcdir/python2-path"
  ln -s /usr/bin/python2 "$srcdir/python2-path/python"

  # Download the PNaCL toolchain on x86_64; i686 toolchain is no longer provided
  if (( $_build_nacl )); then
    python2 build/download_nacl_toolchains.py \
      --packages nacl_x86_newlib,pnacl_newlib,pnacl_translator \
      sync --extract
  fi
}

build() {
  cd "$srcdir/chromium-launcher-$_launcher_ver"

  make PREFIX=/usr

  cd "$srcdir/iridium-browser-$pkgver"

  export PATH="$srcdir/python2-path:$PATH"

  # CFLAGS are passed through release_extra_cflags below
  export -n CFLAGS CXXFLAGS

  # Work around bug in v8 in which GCC 6 optimizes away null pointer checks
  # https://bugs.chromium.org/p/v8/issues/detail?id=3782
  # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=69234
  CFLAGS+=' -fno-delete-null-pointer-checks'

  local _chromium_conf=(
    -Dgoogle_api_key=$_google_api_key
    -Dgoogle_default_client_id=$_google_default_client_id
    -Dgoogle_default_client_secret=$_google_default_client_secret
    -Dwerror=
    -Dclang=0
    -Dpython_ver=2.7
    -Dlinux_link_gsettings=1
    -Dlinux_link_libpci=1
    -Dlinux_link_libspeechd=1
    -Dlinux_link_pulseaudio=1
    -Dlinux_strip_binary=1
    -Dlinux_use_bundled_binutils=0
    -Dlinux_use_bundled_gold=0
    -Dlinux_use_gold_flags=0
    -Dicu_use_data_file_flag=1
    -Dlogging_like_official_build=1
    -Dtracing_like_official_build=1
    -Dfieldtrial_testing_like_official_build=1
    -Drelease_extra_cflags="$CFLAGS"
    -Dlibspeechd_h_prefix=speech-dispatcher/
    -Dffmpeg_branding=Chrome
    -Dproprietary_codecs=0
    -Duse_gnome_keyring=0
    -Duse_system_bzip2=1
    -Duse_system_flac=1
    -Duse_system_ffmpeg=0
    -Duse_system_harfbuzz=1
    -Duse_system_icu=0
    -Duse_system_libevent=1
    -Duse_system_libjpeg=1
    -Duse_system_libpng=1
    -Duse_system_libvpx=1
    -Duse_system_libxml=0
    -Duse_system_snappy=1
    -Duse_system_xdg_utils=1
    -Duse_system_yasm=1
    -Duse_system_zlib=0
    -Dusb_ids_path=/usr/share/hwdata/usb.ids
    -Duse_mojo=0
    -Duse_gconf=0
    -Duse_sysroot=0
    -Denable_hangout_services_extension=1
    -Ddisable_fatal_linker_warnings=1
    -Ddisable_glibc=1)

  if (( ! $_build_nacl )); then
    _chromium_conf+=(
      -Ddisable_nacl=1
      -Ddisable_pnacl=1
    )
  fi

  build/linux/unbundle/replace_gyp_files.py "${_chromium_conf[@]}"
  build/gyp_chromium --depth=. "${_chromium_conf[@]}"

  ninja -C out/Release chrome chrome_sandbox chromedriver
}

package() {
  cd "$srcdir/chromium-launcher-$_launcher_ver"

  make PREFIX=/usr DESTDIR="$pkgdir" install-strip
  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/chromium/LICENSE.launcher"

  cd "$srcdir/iridium-browser-$pkgver"

  install -D out/Release/chrome "$pkgdir/usr/lib/chromium/chromium"

  install -Dm4755 out/Release/chrome_sandbox \
    "$pkgdir/usr/lib/chromium/chrome-sandbox"

  install -D out/Release/chromedriver "$pkgdir/usr/lib/chromium/chromedriver"

  cp out/Release/{*.pak,*.bin} "$pkgdir/usr/lib/chromium/"

  # Manually strip binaries so that 'nacl_irt_*.nexe' is left intact
  strip $STRIP_BINARIES "$pkgdir/usr/lib/chromium/"{chromium,chrome-sandbox} \
    "$pkgdir/usr/lib/chromium/chromedriver"

  if (( $_build_nacl )); then
    cp out/Release/nacl_helper{,_bootstrap} out/Release/nacl_irt_*.nexe \
      "$pkgdir/usr/lib/chromium/"
    strip $STRIP_BINARIES "$pkgdir/usr/lib/chromium/"nacl_helper{,_bootstrap}
  fi

  cp -a out/Release/locales "$pkgdir/usr/lib/chromium/"

  install -Dm644 out/Release/chrome.1 "$pkgdir/usr/share/man/man1/chromium.1"

  install -Dm644 "$srcdir/chromium.desktop" \
    "$pkgdir/usr/share/applications/chromium.desktop"

  for size in 22 24 48 64 128 256; do
    install -Dm644 "chrome/app/theme/chromium/product_logo_$size.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/chromium.png"
  done

  for size in 16 32; do
    install -Dm644 "chrome/app/theme/default_100_percent/chromium/product_logo_$size.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/chromium.png"
  done

  ln -s /usr/lib/chromium/chromedriver "$pkgdir/usr/bin/chromedriver"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/chromium/LICENSE"

  install -Dm644 out/Release/icudtl.dat "${pkgdir}/usr/lib/chromium/icudtl.dat"
}

# vim:set ts=2 sw=2 et:
