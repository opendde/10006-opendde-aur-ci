# Generated by debtap
# Maintainer: LycheeSlicer
# Contributor: LycheeSlicer
pkgname=lycheeslicer
pkgver=4.0.11
pkgrel=1
pkgdesc="Lychee Slicer"
arch=('x86_64')
url="http://mango3d.io"
license=('custom')
depends=('gtk3' 'libsecret' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-atk' 'at-spi2-core')
optdepends=('libappindicator-gtk3')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://mango-lychee.nyc3.cdn.digitaloceanspaces.com/LycheeSlicer-$pkgver.deb")
sha512sums_x86_64=('4e3e9dc004a5e60d555bad5cd5c4783b12fa70915f695a58d825e4a04d4b5be10ce4c2e3028c8c089a64a72aa373219e19da1da9f26728cbf496a51e54572f57')
package(){
	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"
}
