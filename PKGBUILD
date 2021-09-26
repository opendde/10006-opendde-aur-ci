# This file was generated by https://github.com/berberman/arch-hs, please check it manually.
# Maintainer: Thilo Wischmeyer <thwischm@gmail.com>

pkgname=liesbar
pkgver=0.2.0.0
pkgrel=2
pkgdesc="Small Haskell framework for creating status bars with lesbar"
url="https://git.sr.ht/~salmiak/liesbar"
license=("MIT")
arch=('x86_64')
depends=('ghc-libs' 'haskell-async' 'haskell-xdg-basedir' 'lesbar')
makedepends=('ghc')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~salmiak/${pkgname}/archive/v${pkgver}.tar.gz" "dynamic-linking.patch")
sha256sums=("39420cd9bacbdccf7a9fa9bf8ef68ecdf8e5f15e4770a35f00974b8fc27fe0fd" "1581087ea4efddbbc59d3896988a7737135536dee4a80949d3e9407b26c207c8")

prepare() {
  cd $pkgname-v$pkgver
  patch --forward --strip=1 --input="${srcdir}/dynamic-linking.patch"
}

build() {
  cd $pkgname-v$pkgver

  runhaskell Setup configure -O --enable-shared --enable-executable-dynamic --disable-library-vanilla \
    --prefix=/usr --docdir=/usr/share/doc/$pkgname \
    --dynlibdir=/usr/lib --libsubdir=\$compiler/site-local/\$pkgid \
    --ghc-option=-optl-Wl\,-z\,relro\,-z\,now \
    --ghc-option='-pie'

  runhaskell Setup build $MAKEFLAGS
  runhaskell Setup register --gen-script
  runhaskell Setup unregister --gen-script
  sed -i -r -e "s|ghc-pkg.*update[^ ]* |&'--force' |" register.sh
  sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
}

package() {
  cd $pkgname-v$pkgver

  install -D -m744 register.sh "$pkgdir"/usr/share/haskell/register/$pkgname.sh
  install -D -m744 unregister.sh "$pkgdir"/usr/share/haskell/unregister/$pkgname.sh
  runhaskell Setup copy --destdir="$pkgdir"
  install -D -m644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
  rm -f "$pkgdir"/usr/share/doc/$pkgname/LICENSE
}
