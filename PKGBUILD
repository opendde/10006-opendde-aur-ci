# Maintainer: DrakeTDL <everyone@disroot.org>

pkgname=goosemod-installer
pkgver=1.0.1
pkgrel=1
pkgdesc="A simple script to install GooseMod (A Discord Mod)"
arch=(any)
url="https://goosemod.com/"
license=('GPL')
depends=(python)
optdepends=(discord discord-ptb discord-canary discord-development)
source=("${pkgname}")
sha256sums=('ebe7c7b68347125a65f6bd54a2bc55a963876d397c0bd67347bbdd3990aa6476')

package() {
	install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
