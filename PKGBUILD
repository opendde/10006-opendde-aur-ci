# Maintainer: Daniel Nagy <danielnagy at gmx de>
# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Don Stewart <dons@galois.com>

pkgname=haskell-diff
_hkgname=Diff
_licensefile=LICENSE
pkgver=0.3.0
pkgrel=1
pkgdesc="O(ND) diff algorithm in haskell."
url="http://hackage.haskell.org/package/${_hkgname}"
license=('BSD3')
arch=('i686' 'x86_64')
makedepends=('ghc')
depends=('haskell-array')
options=('strip')
source=("http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")
install="${pkgname}.install"
sha256sums=('28f96d7f4bb0f88a13fa0b59e89cc8b93fa901c6cbe6ca82e84540cb2291ee4c')

build() {
    cd ${srcdir}/${_hkgname}-${pkgver}
    
    runhaskell Setup configure -O -p --enable-split-objs --enable-shared \
        --prefix=/usr --docdir=/usr/share/doc/${pkgname} \
        --libsubdir=\$compiler/site-local/\$pkgid
    runhaskell Setup build
    runhaskell Setup haddock
    runhaskell Setup register --gen-script
    runhaskell Setup unregister --gen-script
    sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
}

package() {
    cd ${srcdir}/${_hkgname}-${pkgver}
    install -D -m744 register.sh   ${pkgdir}/usr/share/haskell/${pkgname}/register.sh
    install    -m744 unregister.sh ${pkgdir}/usr/share/haskell/${pkgname}/unregister.sh
    install -d -m755 ${pkgdir}/usr/share/doc/ghc/html/libraries
    ln -s /usr/share/doc/${pkgname}/html ${pkgdir}/usr/share/doc/ghc/html/libraries/${_hkgname}
    runhaskell Setup copy --destdir=${pkgdir}
    install -D -m644 ${_licensefile} ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    rm -f ${pkgdir}/usr/share/doc/${pkgname}/${_licensefile}
}
