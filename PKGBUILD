# Maintainer: Kamil Śliwak <cameel2@gmail.com>

_addon_name=temporary_containers
_addon_version=1.8
_addon_id=888648
_addon_filename="${_addon_name}-${_addon_version}-fx.xpi"
_gecko_id="{c607c8df-14a7-4f28-894f-29e8722976af}"

pkgname=firefox-extension-temporary-containers
pkgver=${_addon_version}
pkgrel=1
pkgdesc="Browser extension that lets you open automatically managed disposable containers"
arch=('any')
url="https://github.com/stoically/temporary-containers"
license=('MIT/X11')
depends=("firefox")
source=("https://addons.cdn.mozilla.net/user-media/addons/${_addon_id}/${_addon_filename}")
noextract=("${_addon_filename}")
sha256sums=('abd3cc36826e571a3779c112ebd3e18886e6d0708aad4936a3c82b6f5eab7a2b')


package() {
    cd "${srcdir}"
    install -Dm644 "${_addon_filename}" "${pkgdir}/usr/lib/firefox/browser/extensions/${_gecko_id}.xpi"
}
