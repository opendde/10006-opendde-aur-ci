# Maintainer: Antonin Décimo <antonin dot decimo at gmail dot com>
# Contributor: Vincent Bernardoff <vb@luminar.eu.org>
# Contributor: Raphaël Proust <raphlalou@gmail.com>

pkgname=opam-git
pkgver=2.1.0.beta2.r165.g1138d481
pkgrel=1
pkgdesc='OCaml package manager'
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url='https://opam.ocaml.org/'
license=(GPL)
depends=(bubblewrap ocaml-compiler-libs unzip)
makedepends=('git' 'curl')
optdepends=(
  'darcs: For downloading packages with darcs'
  'git: For downloading packages with git'
  'mercurial: For downloading packages with mercurial'
  'rsync: For downloading packages with rsync'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname"::'git+git://github.com/ocaml/opam.git')
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/${pkgname%-git}"
  ./configure --prefix=/usr
  make lib-ext all
}

package() {
  cd "$srcdir/${pkgname%-git}"
  make DESTDIR="$pkgdir" install
}
