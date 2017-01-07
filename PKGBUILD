# Maintainer: Yurii Kolesnykov <yurikoles@gmail.com>
# Based on Det <nimetonmaili g-mail> thunderbird-beta-bin

pkgname=thunderbird-beta-bin-ru
_pkgname=thunderbird-beta
_pkgname_no_lang=thunderbird-beta-bin
pkgver=51.0b1
_major=${pkgver/rc*}
_build=5
pkgrel=3
_lang=ru
pkgdesc="Standalone Mail/News reader - Bleeding edge binary version"
arch=('i686' 'x86_64')
url="https://www.mozilla.org/thunderbird"
license=('GPL' 'LGPL' 'MPL')
depends=('alsa-lib' 'cairo' 'dbus-glib' 'desktop-file-utils' 'fontconfig' 'freetype2' 'gtk-update-icon-cache'
         'gtk2' 'hicolor-icon-theme' 'libnotify' 'libpng' 'libvpx' 'libxt' 'mime-types' 'nss' 'pixman'
         'sqlite' 'startup-notification')
optdepends=('libcanberra: for sound support')
provides=("thunderbird=$pkgver")
conflicts=('thunderbird-beta' 'thunderbird-beta-bin' 'thunderbird-beta-bin-uk')
install=$_pkgname_no_lang.install
source=("$_pkgname_no_lang.desktop"
        "$_pkgname_no_lang-safe.desktop"
        'vendor.js')
source_i686=(thunderbird-$pkgver-i686.tar.bz2::"https://ftp.mozilla.org/pub/thunderbird/releases/$pkgver/linux-i686/$_lang/thunderbird-$pkgver.tar.bz2")
source_x86_64=(thunderbird-$pkgver-x86_64.tar.bz2::"https://ftp.mozilla.org/pub/thunderbird/releases/$pkgver/linux-x86_64/$_lang/thunderbird-$pkgver.tar.bz2")
sha512sums=('fc83c23f67cc5d399bc655d2486936db3ab500bafe399a905a17a0b0f63ad9befb782fc9c07d467a65a80a00e3ce984700ec3cf60e4cb3e1b29b20954c6fa775'
            '3cf4194575041bbe344d6cd17e473eb78caf7e2e1aa8b1309151f7e4677c33571014ba6d7aba267398c3ba69c825c64363272b82b15f7dbb8ae5e3e825f439b7'
            'aeb444784732267f1b1e87e6084a776f82a1912c4c2637d2cf1de1c135dd9d41d2ef66d2bd3f9cbd3a79fad32d17ea6e2968ba644d5f887cb66ba6c09a2098f5')
sha512sums_i686=('3c1eb108256f8c589c352d6af65aa3dbd5ed04ffba69a98b74d681a11347557047665f96995e7e7898a8a41631a8b8492028e7d86d7d72a75e1b85fc108afce8')
sha512sums_x86_64=('5f7ea114fceb1bb6056636d12c87a40f83570db67a2cc9284f0aa3f770ed1e03a46430232bf15aa286853b68172ca5f37a71c111e2377d79b5d4a0a8cf8b6aee')
if [[ $_build = ? ]]; then
  source_i686=(thunderbird-$pkgver-i686.tar.bz2::"https://ftp.mozilla.org/pub/thunderbird/candidates/$_major-candidates/build$_build/linux-i686/$_lang/thunderbird-$_major.tar.bz2")
  source_x86_64=(thunderbird-$pkgver-x86_64.tar.bz2::"https://ftp.mozilla.org/pub/thunderbird/candidates/$_major-candidates/build$_build/linux-x86_64/$_lang/thunderbird-$_major.tar.bz2")
fi

package() {
  # Create directories
  msg2 "Creating directory structure..."
  install -d "$pkgdir"/usr/bin
  install -d "$pkgdir"/usr/share/applications
  install -d "$pkgdir"/opt

  msg2 "Moving stuff in place..."
  # Install
  cp -r thunderbird/ "$pkgdir"/opt/$_pkgname
  install -m644 vendor.js "$pkgdir"/opt/$_pkgname/defaults/pref/

  # /usr/bin symlink
  ln -s /opt/$_pkgname/thunderbird "$pkgdir"/usr/bin/$_pkgname

  # Desktops
  install -m644 *.desktop "$pkgdir"/usr/share/applications/

  # Icons
  for i in 16x16 22x22 24x24 32x32 48x48 256x256; do
    install -d "$pkgdir"/usr/share/icons/hicolor/$i/apps/
    ln -s /opt/$_pkgname/chrome/icons/default/default${i/x*}.png \
          "$pkgdir"/usr/share/icons/hicolor/$i/apps/$_pkgname.png
  done
}
