# Maintainer: Holden Lewis <holdenplewis at gmail dot com>

pkgname=impostor-server-bin
pkgver=1.1.0
pkgrel=4
pkgdesc='Unofficial dedicated server for Among Us (binary release).'
url='https://impostor.github.io/Impostor/'
arch=('x86_64')
license=('GPL3')
depends=('zlib' 'krb5')
provides=('impostor-server')
conflicts=('impostor-server')
options=('!strip')
source=("https://github.com/Impostor/Impostor/releases/download/v${pkgver}/Impostor-Server-linux-x64.zip"
        "impostor.service")
sha512sums=('f05213362fd5415608e6cebfd01250ebbb2bba320561d77c9bd20cb91e41c112faa3b8db2d4ecc3afccf2c2b28553516bc53a05c07218603200f2835e6b5f2b6'
            'b1360d6aa5cd769ee7dbdb32148f7e1786acdb6a3080b67a48328252af8cc18ff3448a46f04e656993d891a578217599de96a80e96d7da57f95b107d451fdfaa')

prepare() {
  mv Impostor.Server impostor-server
  chmod +x impostor-server
}

package() {
  
  mkdir -p "${pkgdir}/usr/bin/"
  mkdir -p "${pkgdir}/etc/impostor/"
  mkdir -p "${pkgdir}/usr/lib/systemd/system/"

  cp --verbose "${srcdir}/impostor-server" "${pkgdir}/usr/bin/"
  cp --verbose "${srcdir}/config.json" "${pkgdir}/etc/impostor/"
  cp --verbose "${srcdir}/impostor.service" "${pkgdir}/usr/lib/systemd/system/"
}
