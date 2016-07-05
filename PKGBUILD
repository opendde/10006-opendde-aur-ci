# Maintainer: Samuel Walladge <samuel at swalladge dot id dot au>
# vim: ts=2 sw=2 et

pkgname=crrcsim-sceneries
pkgver=20160705
pkgrel=1
pkgdesc="various extra sceneries for crrcsim"
arch=(any)
url="http://joel.lienard.free.fr/crrcsim/index-en.html"
license=('unknown')
depends=('crrcsim')
makedepends=('unzip')
source=("http://joel.lienard.free.fr/crrcsim/colmiraillet.zip"
        "http://joel.lienard.free.fr/crrcsim/busards.zip"
        "http://joel.lienard.free.fr/crrcsim/mont_clocher.zip"
        "http://joel.lienard.free.fr/crrcsim/col_arc.zip"
        "http://joel.lienard.free.fr/crrcsim/faisses.zip"
        "http://joel.lienard.free.fr/crrcsim/faisses2.zip"
        "http://joel.lienard.free.fr/crrcsim/sornin.zip"
        "http://joel.lienard.free.fr/crrcsim/valbonnais.zip"
        "http://joel.lienard.free.fr/crrcsim/valbonnais2.zip"
        "http://joel.lienard.free.fr/crrcsim/brie.zip")

md5sums=('4551491c999c6a93171f90d623f9a49f'
         '5ae0ff55114c7d4ba05e14348fa7471a'
         '458e8ca697cc97844c4a0d2611f8b3e9'
         'e2cbec86d483bd36db2761b7711da5d0'
         'cf26867516c78eefc1dfa7a780326f0f'
         '4735e2da17445262adbcf1870feda8df'
         'cc5646dbf51b87cac0fd95ad462c3b8c'
         'aedb083ee1284df05b1bf83df4a8318d'
         'ba88f9ab379e609f2ccc5e15320e7a8c'
         '8f7d5140278655411aa0615b629d0e87')

noextract=("colmiraillet.zip"
           "busards.zip"
           "mont_clocher.zip"
           "col_arc.zip"
           "faisses.zip"
           "faisses2.zip"
           "sornin.zip"
           "valbonnais.zip"
           "valbonnais2.zip"
           "brie.zip")

package() {
  cd "${srcdir}"
  DIR="${pkgdir}/usr/share/crrcsim/scenery/"
  mkdir -p "${DIR}"

  for ZIP in "${noextract[@]}"; do
    unzip "${ZIP}" -d "${DIR}"
  done
}

