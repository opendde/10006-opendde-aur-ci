# Maintainer: Konstantin Shalygin <k0ste@cn.ru>

pkgname="firefox-adblock-plus"
pkgver='2.7.2'
pkgrel='1'
pkgdesc='Adblock Plus blocks all annoying ads, and supports websites by not blocking unobtrusive ads by default (configurable).'
arch=('any')
url="https://addons.mozilla.org/en-US/firefox/addon/adblock-plus"
license=('GPL')
depends=('firefox')
source=("${pkgname}.xpi::https://addons.mozilla.org/firefox/downloads/latest/1865/addon-1865-latest.xpi")
sha256sums=('26f9eafc7d3e259d1590d49a2a4a4336a6d73acb35381abda7e47d03a0494fba')
noextract=(${source[@]%%::*})

package() {
  pushd "${srcdir}"
  install -Dm644 "${pkgname}.xpi" "${pkgdir}/usr/lib/firefox/browser/extensions/{d10d0bf8-f5b5-c8b4-a8b2-2b9879e08c5d}.xpi"
  popd
}
