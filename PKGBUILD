# Maintainer: Mirko Rovere
pkgname="extrattor"
pkgver="1.5"
pkgrel="1"
pkgdesc="A simple Linux utility to extract one or more archives from the terminal"
arch=("x86_64")
depends=('unarj' 'unace' 'p7zip' 'tar' 'pax' 'gzip' 'unzip')
license=("GPL-3.0")
source=("https://raw.githubusercontent.com/Mirko-r/extractor/10bec819cf879220466cfcb85c840c0ef0d8bfca/extractor/extrattor.sh")
sha512sums=("SKIP")

package(){
    install -Dm0755 "${srcdir}/extrattor.sh" "${pkgdir}/usr/bin/extrattor"
}
