# Maintainer: Graham Edgecombe <graham@grahamedgecombe.com>
pkgname=cfr
pkgver=0_76
pkgrel=1
pkgdesc='Another Java decompiler'
arch=('any')
url='http://www.benf.org/other/cfr/'
license=('MIT')
depends=('java-runtime')
source=("http://www.benf.org/other/cfr/cfr_${pkgver}.jar"
        'cfr' 'LICENSE')
noextract=("cfr_${pkgver}.jar")
md5sums=('9c5d7847c6a7303901ebcff8f4022658'
         'd0f7cff1f51f2b25139e4855bf0520ee'
         '023543479a311ba82f63192d82d4ef92')

package() {
  install -D cfr "$pkgdir/usr/bin/cfr"
  install -Dm644 "cfr_${pkgver}.jar" "$pkgdir/usr/share/java/cfr/cfr.jar"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/cfr/LICENSE"
}
