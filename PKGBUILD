# Maintainer: Llewelyn Trahaearn <WoefulDerelict at GMail dot com>
# Contributor: Michael Wendland <dev at michiwend dot com>

pkgname=gnome-shell-extension-arch-update
pkgver=27
pkgrel=2
pkgdesc="Convenient indicator for Arch Linux updates in GNOME Shell."
arch=('any')
url="https://github.com/RaphaelRochet/arch-update"
license=('GPL3')
depends=('fakeroot' 'gnome-shell>=3.18' 'pacman-contrib')
conflicts=('gnome-shell-extensions-git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/RaphaelRochet/arch-update/archive/v${pkgver}.tar.gz")
sha512sums=('aedb0f6b710333d9c5bc474265ad17e181608141e8e2ada504a1f13334bd01abaf258dce6fa13b705e41bc170d17c7250c37f7c4108f4c0e01d6f68b25c709e1')


package() {
  cd "arch-update-${pkgver}"
  # Locate the extension.
  _extname=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)
  _destdir="${pkgdir}/usr/share/gnome-shell/extensions/${_extname}"
  # Copy extension files into place.
  find -maxdepth 1 \( -iname '*.js*' -or -iname '*.css' -or -iname '*.ui' \) -exec install -Dm644 -t "${_destdir}" '{}' +
  find -maxdepth 2 \( -iname '*.svg*' \) -exec install -Dm644 -t "${_destdir}/icons" '{}' +
  find -name '*.xml' -exec install -Dm644 -t "${pkgdir}/usr/share/glib-2.0/schemas/" '{}' +
  cd locale
  for locale in */
    do
      install -Dm644 -t "${_destdir}/locale/${locale}/LC_MESSAGES" "${locale}/LC_MESSAGES"/*.mo
    done
}
