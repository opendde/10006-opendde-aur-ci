# Maintainer: Giancarlo Grasso <gianniesoft at gmail dot com>

pkgname=whatsdesk-bin
pkgver=0.3.9
pkgrel=1
pkgdesc="unofficial client of whatsapp"
arch=('x86_64')
url="https://gitlab.com/zerkc/whatsdesk/"
license=('MIT')
provides=('whatsdesk')
conflicts=('whatsdesk-git')
depends=('libxss'
         'nss'
         'libxtst'
         'libnotify'
         'libappindicator-gtk3')
source_x86_64=("https://zerkc.gitlab.io/whatsdesk/whatsdesk_${pkgver}_amd64.deb"
               "LICENSE")
sha256sums_x86_64=('02b1b2902fe835ac1f34fc0d24ed793f6d312ef12e44066de83ebbfd39b06486'
                   '38f8c3d94c9497be761fc95f10d3c530a693bae33fa89d5ce29fe1fac45e3aea')

package() {
  bsdtar -xv -C "${pkgdir}" -f "${srcdir}/data.tar.xz"
  mkdir -p "${pkgdir}/usr/bin/"
  ln -s "/opt/whatsdesk/whatsdesk" "${pkgdir}/usr/bin"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
