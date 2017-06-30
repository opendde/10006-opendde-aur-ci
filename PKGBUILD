# Maintainer:  <simonfxr@gmail.com>
pkgname=stack-static
pkgver=1.4.0
pkgrel=1
epoch=
pkgdesc="The Haskell Tool Stack (linked statically)"
arch=('x86_64')
curl="https://github.com/commercialhaskell/stack"
license=('custom:BSD3')
provides=( stack )
conflicts=( stack haskell-stack )
replaces=( stack haskell-stack )
source=(
    "https://github.com/commercialhaskell/stack/releases/download/v1.4.0/stack-${pkgver}-linux-x86_64-static.tar.gz"
    "https://github.com/commercialhaskell/stack/releases/download/v1.4.0/stack-${pkgver}-linux-x86_64-static.tar.gz.asc"
)
sha256sums=(
    '8cc2bb0da1e5f77de7257662c63c82ed289b09a37c72c2fc7a8a81983dbe30ba'
    '65471f5165d5aa87cbe4bc32ce0e895481fa824211c44f24c107fb2ac58e9b7b'
)
validpgpkeys=('C5705533DA4F78D8664B5DC0575159689BEFB442')

package() {
  cd "${srcdir}"

  local d="stack-${pkgver}-linux-x86_64-static"
  mkdir -p "${pkgdir}"/usr/{bin,share/{doc,licenses}/"${pkgname}"}
  cp "${d}/stack" "${pkgdir}/usr/bin"
  cp -R "${d}/doc/." "${pkgdir}/usr/share/doc/${pkgname}/"
  cp "${d}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/"
}

# vim:set ts=2 sw=2 et:
