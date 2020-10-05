# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: DeedleFake <yisszev at beckforce dot com>
# Contributor: JJK

pkgname=srb2-data
pkgver=2.2.8
instver=2.2.7
pkgrel=1
pkgdesc="Data files for Sonic Robo Blast 2"
arch=('any')
license=('custom')
url='http://www.srb2.org'
optdepends=('srb2: "Sonic Robo Blast 2" game')
source=(
    "https://github.com/STJr/SRB2/releases/download/SRB2_release_${instver}/SRB2-${instver}-Full.zip"
    "https://github.com/STJr/SRB2/releases/download/SRB2_release_${pkgver}/SRB2-v${pkgver}-Patch.zip"
)
sha256sums=('6e82e51eb61b2df42e5020dfd690a31c8e4d67eedad81564a58b2f9837479b72'
            '2e8a255f809069097d1718eef8ee32c8605c70187b996d328bf6bf183515182c')

package() {
  install -d "$pkgdir"/usr/share/games/SRB2
  install -m644 {player,music}.dta {srb2,zones,patch_music,patch}.pk3 "$pkgdir"/usr/share/games/SRB2
}
