# Maintainer: oliver < a t >  first . in-berlin . de
# Contributor: charlesthehawk at yahoo dot com
# Contributor:  Serge Zirukin <ftrvxmtrx@gmail.com>

pkgname=ocaml-sqlite3
_pkgname=sqlite3-ocaml
pkgver=4.0.2
pkgrel=1
pkgdesc="SQLite3 bindings for OCaml"
arch=('i686' 'x86_64')
url="http://mmottl.github.io/sqlite3-ocaml"
license=('MIT')
makedepends=('ocaml' 'ocaml-findlib' 'sqlite3')
source=("https://github.com/mmottl/sqlite3-ocaml/releases/download/v$pkgver/sqlite3-ocaml-$pkgver.tar.gz")
md5sums=('77d9d5c50c8982bf8adc34d12c6d6c54')
options=('!makeflags' 'staticlibs')

_pkgdir="$_pkgname-$pkgver"

build () {
  cd "${srcdir}/${_pkgdir}"

  ./configure --disable-debug --prefix /usr --destdir "$pkgdir"
   make all
}

package() {
  cd "${srcdir}/${_pkgdir}"

  export OCAMLFIND_DESTDIR="$pkgdir$(ocamlfind printconf destdir)"
  mkdir -p "${OCAMLFIND_DESTDIR}/stublibs"
  make install
  install -D -m644 COPYING.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m644 _build/lib/sqlite3.a ${pkgdir}/usr/lib/ocaml/sqlite3/sqlite3.a

}
