# Maintainer: Jonas Schürmann <jonasschuermann@aol.de>
# Contributor: condy <condy0919[at]gmail[dot]com>
pkgname=psysh
pkgver=0.8.17
pkgrel=2
pkgdesc="PsySH is a runtime developer console, interactive debugger and REPL for PHP."
url="http://psysh.org"
arch=('x86_64' 'i686')
license=('MIT')
depends=('php')
provides=('psysh')
optdepends=('mariadb: mysql command support')
source=("https://github.com/bobthecow/psysh/releases/download/v${pkgver}/psysh-v${pkgver}.tar.gz"
        'https://raw.githubusercontent.com/bobthecow/psysh/master/LICENSE')
sha256sums=('b250386d7b0ec1db6d2d029a20d2a08e8c64afd06ed6af0bf17a39f92de0a9e6'
            'ffe06af119d0b31e8d5bcfd219648d071023380fb3006b6b07017902ef632ad1')

package() {
  cd "${srcdir}"
  install -Dm755 psysh "${pkgdir}/usr/bin/psysh"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
