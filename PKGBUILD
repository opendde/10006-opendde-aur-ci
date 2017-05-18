# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=ocaml-ctypes-git
pkgver=0.11.3.16.g048b81a
pkgrel=1
pkgdesc='Library for binding to C libraries using pure OCaml'
arch=('i686' 'x86_64')
url=https://github.com/ocamllabs/ocaml-ctypes
license=('custom')
depends=('ocaml' 'libffi' 'ocaml-integers')
makedepends=('ocaml-findlib>=1.5.3' 'git')
options=('!strip')
source=("git+$url.git")
md5sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  echo $(git describe --tags | sed 's+-+.+g')
}

build() {
  cd ${pkgname%-git}
  make -j 1
}

package() {
  install -d "$pkgdir/$(ocamlfind printconf destdir)/stublibs"

  cd ${pkgname%-git}
  export OCAMLFIND_DESTDIR="${pkgdir}/$(ocamlfind printconf destdir)"
  export OCAMLFIND_LDCONF=ignore
  make install
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
 
