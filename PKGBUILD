# Contributor: Alex Whitt <alex.joseph.whitt@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

_pkgsrcname=transient
_pkgmaintainer=magit
pkgver=0.3.0
pkgrel=1
pkgdesc="Implements prefix commands, infix arguments and suffix commands."
pkgname=emacs-transient
arch=('any')
url="https://github.com/${_pkgmaintainer}/${_pkgsrcname}"
license=('GPL3')
depends=('emacs-dash' 'emacs-hydra')
source=("$pkgname-$pkgver.tar.gz::https://github.com/${_pkgmaintainer}/${_pkgsrcname}/archive/v${pkgver}.tar.gz")
sha256sums=('e193406d1236fdfe50cfa1a9d687390c9c7187b5da7d8f02014eb94da01e9a95')

build() {
  cd ${_pkgsrcname}-${pkgver}/lisp
  emacs -q --no-splash -batch -L . -f batch-byte-compile *.el
}

package() {
  cd ${_pkgsrcname}-${pkgver}/lisp
  install -Dm644 *.el{c,} -t "$pkgdir"/usr/share/emacs/site-lisp/
}
