# Maintainer: ava1ar <mail(at)ava1ar(dot)me>

pkgname=airtame-application
pkgver=3.3.2
pkgrel=1
pkgdesc="Airtame official screen streaming application."
arch=('x86_64')
url="http://www.airtame.com"
license=('Custom')
source=('airtame.desktop' "https://downloads.airtame.com/application/ga/lin_x64/releases/airtame-application-${pkgver}.tar.gz")
sha1sums=('6cf4bf96ee176e84700514b22a6c7811e21136b4'
          'b1724925e3549443a75223db686a4232fd2ee2e5')
package() {
  # Install files to /opt
  mkdir -p ${pkgdir}/opt/airtame
  mv ${srcdir}/${pkgname}-${pkgver}/* ${pkgdir}/opt/airtame

  # Install desktop file
  install -m 644 -D "${startdir}"/airtame.desktop "${pkgdir}"/usr/share/applications/airtame.desktop

  # Installing license
  install -m 644 -D ${pkgdir}/opt/airtame/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
