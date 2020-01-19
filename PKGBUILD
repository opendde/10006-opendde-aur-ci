pkgname=chromium-vaapi-bin
pkgver=79.0.3945.117
_pkgrel='1'
pkgrel=1
pkgdesc='Chromium with VA-API support to enable hardware acceleration, pre-compiled'
url='https://www.chromium.org/Home'
arch=('x86_64')
license=('BSD')
provides=('chromium' 'chromium-vaapi')
conflicts=('chromium' 'chromium-vaapi')

depends=('gtk3' 'nss' 'alsa-lib' 'xdg-utils' 'libxss' 'libcups' 'libgcrypt'
         'ttf-font' 'systemd' 'dbus' 'libpulse' 'pciutils' 'json-glib' 'libva'
         'desktop-file-utils' 'hicolor-icon-theme')

optdepends=('pepper-flash: support for Flash content'
            'pipewire: WebRTC desktop sharing under Wayland'
            'kdialog: needed for file dialogs in KDE'
            'gnome-keyring: for storing passwords in GNOME keyring'
            'kwallet: for storing passwords in KWallet'
            'libva-intel-driver: support HW acceleration on Intel graphics cards'
            'libva-mesa-driver: support HW acceleration on AMD graphics cards'
            'libva-vdpau-driver-chromium: support HW acceleration on Nvidia graphics cards'
            'chromium-widevine: for viewing premium video content')

validpgpkeys=('EB4F9E5A60D32232BB52150C12C87A28FEAC6B20')
source=("https://pkgbuild.com/~maximbaz/repo/chromium-vaapi-${pkgver}-${_pkgrel}-${arch}.pkg.tar.zst"{,.sig})
sha256sums=('977305a6b758c622ec94ebb63c1a620814a7071bb8e55393f6d09d3520041ad0'
            'SKIP')

# Keep in sync with AUR/chromium-vaapi:
#
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
  #[libvpx]=libvpx            # needs unreleased libvpx
  [libwebp]=libwebp
  [libxml]=libxml2
  [libxslt]=libxslt
  [opus]=opus
  [re2]=re2
  [snappy]=snappy
  [yasm]=
  [zlib]=minizip
)
depends+=(${_system_libs[@]})

package() {
  cp -ar "$srcdir/usr" "$pkgdir/usr"
  chmod 4755 "$pkgdir/usr/lib/chromium/chrome-sandbox"
}
