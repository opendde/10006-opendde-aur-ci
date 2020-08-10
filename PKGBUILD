# Maintainer: Felix Springer <felixspringer149@gmail.com>

pkgname=blucontrol
pkgver=0.2.0.0
pkgrel=1
pkgdesc="Configurable blue light filter"
url="https://github.com/jumper149/blucontrol"
license=('custom:BSD3')
arch=('x86_64')
depends=(
  'ghc'
  'ghc-libs'
  'haskell-data-default'
  'haskell-finite-typelits'
  'haskell-lifted-base'
  'haskell-monad-control'
  'haskell-time-compat'
  'haskell-transformers-base'
  'haskell-x11'
  'libx11'
  'libxrandr'
)
source=(
  "https://github.com/jumper149/${pkgname}/archive/v${pkgver}.tar.gz"
  "compile-dynamically.patch"
  "Setup.hs"
)
sha256sums=(
  'b187c341ab66ac54970b3b4a3ed7e28162da85219fa33342599eefdc2c571a36'
  '5d9a96b72f4f4ee68a767334cc4dbcf82d8a91f09f000e1900bd399d17363cdb'
  '5066653559d4d6134b022d66a634a17fdcf8db35d28b447e581fec284afa4689'
)

prepare() {
  cd "${pkgname}-${pkgver}"

  patch -p1 -i "${srcdir}/compile-dynamically.patch"
  cp "${srcdir}/Setup.hs" "./"
}

build() {
  cd "${pkgname}-${pkgver}"

  runhaskell Setup configure -O \
    --disable-library-vanilla \
    --docdir="/usr/share/doc/${pkgname}" \
    --dynlibdir="/usr/lib" \
    --enable-executable-dynamic \
    --enable-shared \
    --enable-tests \
    --libsubdir=\$compiler/site-local/\$pkgid \
    --prefix="/usr" \
    #--datasubdir="${pkgname}" \
    #--ghc-option=-optl-Wl\,-z\,relro\,-z\,now \
    #--ghc-option='-pie' \

  runhaskell Setup build
  runhaskell Setup register --gen-script
  runhaskell Setup unregister --gen-script
  sed -i -r -e "s|ghc-pkg.*update[^ ]* |&'--force' |" register.sh
  sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
}

check() {
  cd "${pkgname}-${pkgver}"

  runhaskell Setup test
}

package() {
  cd "${pkgname}-${pkgver}"

  install -D -m744 register.sh "${pkgdir}/usr/share/haskell/register/${pkgname}.sh"
  install -D -m744 unregister.sh "${pkgdir}/usr/share/haskell/unregister/${pkgname}.sh"
  runhaskell Setup copy --destdir="${pkgdir}"
  install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  rm -f "${pkgdir}/usr/share/doc/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
