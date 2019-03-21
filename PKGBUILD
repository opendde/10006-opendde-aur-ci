# Contributor: sballert <sballert@posteo.de>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

_gituser="politza"
_gitrepo="pdf-tools"

pkgname=emacs-pdf-tools-git
pkgver=0.90r23.g9a63f39
pkgrel=1
pkgdesc="Emacs support library for PDF files."
url="https://github.com/${_gituser}/${_gitrepo}"
arch=('any')
license=('GPL3')
depends=('emacs' 'emacs-tablist-git' 'libpng' 'zlib' 'poppler-glib')
optdepends=('imagemagick: following links of a PDF document by plain keystrokes')
makedepends=('git' 'cask')
checkdepends=('git' 'cask')
provides=('emacs-pdf-tools')
conflicts=('emacs-pdf-tools')
source=("git+https://github.com/${_gituser}/${_gitrepo}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_gitrepo"
  git describe --tags|sed 's+-+r+'|tr - .|cut -c2-
}
check() {
  cd "$_gitrepo"
  make check
}

build() {
  cd "$_gitrepo"
  make bytecompile
  make server/epdfinfo
}

package() {
  cd "$_gitrepo"
  install -d  "$pkgdir"/usr/share/emacs/site-lisp/${_gitrepo}/
  install -d  "$pkgdir"/usr/bin
  install -m644 lisp/*.el{c,} "$pkgdir"/usr/share/emacs/site-lisp/${_gitrepo}/
  install -m755 server/epdfinfo "$pkgdir"/usr/bin/
}
