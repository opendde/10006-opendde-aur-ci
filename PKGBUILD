# Maintainer: Miguel Ángel López <miguel.angel.lopez.vicente@gmail.com>

pkgname=pokenurse-bin
pkgver=2.0.1
pkgrel=1
pkgdesc="A tool for Pokémon Go to aid in transferring and evolving Pokémon (Binary)"
arch=('i686' 'x86_64')
url="https://github.com/vinnymac/PokeNurse"
depends=()

sha256sums_i686=('640c2999d557f1f50f768d49c74bc444b28af63fde75401ae5fe1501726aedf7')
sha256sums_x86_64=('364b6b0d4bd86f7965b5d997ee79b9ee42bf0b30944a946edd0904d057fe479f')
source_x86_64=("https://github.com/vinnymac/PokeNurse/releases/download/v${pkgver}/PokeNurse-x64.deb")
source_i686=("https://github.com/vinnymac/PokeNurse/releases/download/v${pkgver}/PokeNurse-ia32.deb")

package() {
  tar xJf ${srcdir}/data.tar.xz -C ${pkgdir}/
}

