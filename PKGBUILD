# Maintainer: Omar Sandoval <osandov at cs dot washington dot edu>
# Contributor: Roger Zanoni <rogerzanoni@gmail.com>
# Contributor: Sylvain Henry <hsyl20@gmail.com>
# Contributor: Marti Raudsepp <marti@juffo.org>
# Contributor: Dan McGee <dpmcgee@gmail.com>
# Contributor: LeCrayonVert <sunrider@laposte.net>
# Contributor: Lukas Fleischer <archlinux@cryptocrack.de>
# Contributor: Vladimir Kirillov <proger@wilab.org.ua>

pkgname=coccinelle
pkgver=1.0.1
pkgrel=1
pkgdesc="Provides spatch program used to apply semantic patches"
arch=('i686' 'x86_64')
url="http://coccinelle.lip6.fr/"
license=('GPL2')
makedepends=('camlp4' 'ocaml' 'ocaml-findlib')
depends=('pcre' 'python')
optdepends=('ocaml: OCaml scripting feature'
            'ocaml-findlib: OCaml scripting feature')
options=(!strip)
source=(http://coccinelle.lip6.fr/distrib/${pkgname}-${pkgver}.tgz)
sha256sums=('39caac46c1f80cbe5de21164c5b31a794e3befdb9cd7ef1d080d455ac171b526')

build() {
   cd "$pkgname-$pkgver"

   ./configure --prefix=/usr
   make
}

package() {
   cd "$pkgname-$pkgver"

   make DESTDIR="$pkgdir/" MANDIR="/usr/share/man" install
}
