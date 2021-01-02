# Maintainer: mprom <madspeter at rommedahl dot info>
# Maintainer: Ali Molaei <ali dot molaei at protonmail dot com>
# Contributor: Proton Technologies AG (ProtonMail Bridge developers) <bridge at protonmail dot ch>

_pkgname=protonmail-import-export-app
pkgname=$_pkgname-bin
pkgver=1.2.3
pkgrel=1
pkgdesc="The Import-Export app helps you to migrate your emails from local files or remote IMAP servers to ProtonMail or simply export emails to local folder."
arch=("x86_64")
url="https://protonmail.com/import-export"
license=("GPLv3")
depends=( 'qt5-base' 'qt5-multimedia' 'libsecret' 'ttf-dejavu' )
optdepends=( 'pass: pass support' 'gnome-keyring: gnome-keyring support')
conflicts=("$_pkgname" "$_pkgname-beta-bin")
provides=("$_pkgname")
source=("https://protonmail.com/download/ie/protonmail-import-export-app_${pkgver}-1_amd64.deb")
sha256sums=("b109d277dae19d42ba05ab6e8612a613ecfdf677ee381d5c379e5180f149cd66")

package() {
  tar -xzC "$pkgdir" -f data.tar.gz
  rm -rf "$pkgdir/opt"
}
