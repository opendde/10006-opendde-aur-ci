# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=sly-git
pkgver=1.0.0.beta.152.g66103b6
pkgrel=1
pkgdesc="Common Lisp IDE for Emacs. Fork of slime."
arch=('any')
url="https://github.com/capitaomorte/sly"
license=('custom')
depends=('emacs' 'gawk')
makedepends=('git')
provides=('sly')
conflicts=('sly')
source=("git+https://github.com/capitaomorte/sly.git")
md5sums=('SKIP')
_gitname="sly"
options=('!makeflags')

pkgver() {
  cd "$srcdir"/"$_gitname"
  echo $(git describe --tags | sed 's|-|.|g')
}

build() {
  LANG=C
  cd "$srcdir"/"$_gitname"
  make --debug
 }

package() {
  cd "$srcdir/$_gitname"
  install -d $pkgdir/usr/share/emacs/site-lisp/sly
  cp -r $srcdir/sly/* \
    $pkgdir/usr/share/emacs/site-lisp/sly
  install -D -m644 README.md \
    $pkgdir/usr/share/licenses/$pkgname/public_domain.txt 
}
