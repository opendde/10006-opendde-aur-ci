# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=gnome-shell-extension-tiling-assistant
_pkgname=Tiling-Assistant
pkgver=27
pkgrel=1
pkgdesc="A GNOME Shell extension to expand GNOME's native 2 column design."
arch=('x86_64')
url="https://github.com/Leleat/Tiling-Assistant"
license=('GPL2')
depends=('gnome-shell>=1:40')
install='INSTALL'
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
noextract=("*tiling-assistant@leleat-on-github*")
sha512sums=('b66baec97d0c9329c1f7d04d4ea52eca2e840324d1954cc1cef2619900ad991646f36a646df63df16d5be86b2e5b641e0fead377b5f4a36b865c7a087218c886')

build() {
  # cd into repo dir
  cd "${srcdir}/Tiling-Assistant-${pkgver}"

  # package extension to compile settings and translations
  gnome-extensions pack tiling-assistant@leleat-on-github \
    --force \
    --podir="../translations" \
    --extra-source="src"
}

package() {
  # cd into repo dir
  cd "${srcdir}/Tiling-Assistant-${pkgver}"

  # instead of using gnome-extensions to install the extension package
  # unzip to $pkgdir/usr/share/gnome-shell/extensions/ since gnome-extensions
  # installs the extension locally while on Arch it seems like /usr/ is the
  # convention
  _UUID="tiling-assistant@leleat-on-github"
  mkdir -p "${pkgdir}/usr/share/gnome-shell/extensions"
  unzip ${_UUID}.shell-extension.zip \
    -d "${pkgdir}/usr/share/gnome-shell/extensions/${_UUID}"
}
