# Maintainer: Kyle Manna <kyle(at)kylemanna(dot)com>

_srcname=linux-4.3
pkgname=linux-can-dkms
pkgver=4.3.3
pkgrel=1
pkgdesc="CAN kernel modules (DKMS)"
arch=('i686' 'x86_64')
url="https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/plain/Documentation/networking/can.txt"
license=('GPL2')
depends=('dkms')
install=${pkgname}.install
source=("https://www.kernel.org/pub/linux/kernel/v4.x/${_srcname}.tar.xz"
        "https://www.kernel.org/pub/linux/kernel/v4.x/${_srcname}.tar.sign"
        "https://www.kernel.org/pub/linux/kernel/v4.x/patch-${pkgver}.xz"
        "https://www.kernel.org/pub/linux/kernel/v4.x/patch-${pkgver}.sign"
        'dkms.conf'
        'Makefile'
       )
sha256sums=('4a622cc84b8a3c38d39bc17195b0c064d2b46945dfde0dae18f77b120bc9f3ae'
            'SKIP'
            '95cd81fcbb87953f672150d60950548edc04a88474c42de713b91811557fefa5'
            'SKIP'
            'b213142af20f9c0bdfdb52104cc2daed2de3edb2e45a6e4e243b9e980ce3c5db'
            '3653b26f843ad66d31ffe3c916d2b26bd59e2e6273e9d967bfdb8af4e693162d')
validpgpkeys=('ABAF11C65A2970B130ABE3C479BE3E4300411886' # Linus Torvalds
              '647F28654894E3BD457199BE38DBBDC86092693E' # Greg Kroah-Hartman
             )

package() {

  # Copy Makefile and dkms.conf
  install -Dm644 Makefile "${pkgdir}"/usr/src/${pkgname}-${pkgver}/Makefile
  install -Dm644 dkms.conf "${pkgdir}"/usr/src/${pkgname}-${pkgver}/dkms.conf

  # Set name and version
  sed -e "s/@PKGNAME@/${pkgname}/" \
      -e "s/@PKGVER@/${pkgver}/" \
      -i "${pkgdir}"/usr/src/${pkgname}-${pkgver}/dkms.conf

  # Copy sources
  mkdir -p "${pkgdir}/usr/src/${pkgname}-${pkgver}/net/"
  cp -r "${srcdir}/${_srcname}/net/can" "${pkgdir}/usr/src/${pkgname}-${pkgver}/net/can"

  mkdir -p "${pkgdir}/usr/src/${pkgname}-${pkgver}/drivers/net/"
  cp -r "${srcdir}/${_srcname}/drivers/net/can" "${pkgdir}/usr/src/${pkgname}-${pkgver}/drivers/net/can"
}
