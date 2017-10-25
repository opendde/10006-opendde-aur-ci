# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Maintainer: Eli Schwartz <eschwartz@archlinux.org>

# All my PKGBUILDs are managed at https://github.com/eli-schwartz/pkgbuilds

_pkgname=https-everywhere
pkgname=firefox-extension-${_pkgname}
pkgver=2017.10.24
pkgrel=1
pkgdesc="Plugin for firefox which ensures you are using https whenever it's possible."
license=('GPL2')
arch=('any')
url="https://www.eff.org/https-everywhere"
depends=("firefox")
makedepends=("unzip")
source=("${_pkgname}-${pkgver}.xpi::https://www.eff.org/files/https-everywhere-${pkgver}-eff.xpi"
        "${_pkgname}-${pkgver}.xpi.sig::https://www.eff.org/files/https-everywhere-${pkgver}-eff.xpi.sig")
noextract=("${_pkgname}-${pkgver}.xpi")
sha256sums=('42e1739f884bf3ccefe06cb02ac278e52ee2f5c572fe53b770026c21fd225308'
            'SKIP')
validpgpkeys=('1073E74EB38BD6D19476CBF8EA9DBF9FB761A677') # William Budington

prepare() {
  cd "$srcdir"

  unzip -qqo "${_pkgname}-${pkgver}.xpi" -d "${_pkgname}-${pkgver}"
}

package() {
  cd "${srcdir}"

  _extension_id="$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' ${_pkgname}-${pkgver}/install.rdf)"
  _extension_dest="${pkgdir}/usr/lib/firefox/browser/extensions/${_extension_id}"
  # Should this extension be unpacked or not?
  if grep '<em:unpack>true</em:unpack>' ${_pkgname}-${pkgver}/install.rdf > /dev/null; then
    install -dm755 "${_extension_dest}"
    cp -R ${_pkgname}-${pkgver}/* "${_extension_dest}"
    chmod -R ugo+rX "${_extension_dest}"
  else
    install -Dm644 ${_pkgname}-${pkgver}.xpi "${_extension_dest}.xpi"
  fi
}
