# Maintainer: Mark Egan-Fuller <markeganfuller at googlemail dot com>
# Based on systemsim-cell PKGBUILD by Nicola Squartini <tensor5@gmail.com>
pkgname=systemsim-p9
pkgver=1.1
pkgrel=2
pkgdesc="IBM Full-System Simulator for the Power9 Processor"
arch=('x86_64')
url="http://www.ibm.com/"
license=('custom:IBM Licensed Materials')
groups=('Power9 Simulator')
depends=('tcl' 'xterm' 'uml_utilities')
options=(!strip)
source=(file://systemsim-p9-1.1-0.f22.x86_64.rpm)
md5sums=('cfb8645f4c4794f7d8fa404d559748b7')

package() {
  cp -r "${srcdir}"/opt "${pkgdir}"
  install -d "$pkgdir"/usr/bin
  ln -s /opt/ibm/$pkgname/bin/$pkgname "$pkgdir"/usr/bin/$pkgname
  ln -s /opt/ibm/$pkgname/run/p9/power9 "$pkgdir"/usr/bin/power9
}
