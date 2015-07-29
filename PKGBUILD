# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>
# Contributor: Vojtěch Aschenbrenner <v@asch.cz>

pkgname=tpacpi-bat
pkgver=3.0
pkgrel=1
pkgdesc="A Perl script with ACPI calls for recent ThinkPads (such as T420 and W520) whose battery thresholds are not supported by tp_smapi"
url="https://github.com/teleshoes/tpacpi-bat"
arch=('x86_64' 'i686')
license=('GPL3')
depends=('perl' 'acpi_call')
conflicts=('tpacpi-bat-git')
source=(https://github.com/teleshoes/${pkgname}/archive/v${pkgver}.tar.gz)
sha256sums=('f9aa8be181df6a7d41eac6224abb6dadf1d147022449e9159c4aa09397b7a485')

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${pkgname%-*}.service" "$pkgdir/usr/lib/systemd/system/${pkgname}.service"
}
