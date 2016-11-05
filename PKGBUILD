# Maintainer: Albert Graef <aggraef at gmail.com>
# Contributor: bjoern lindig (bjoern _dot_ lindig _at_ google.com)

pkgname=faust2-git
pkgver=7930.828a428
pkgrel=1
pkgdesc="The latest development version of Faust featuring additional backends for LLVM, C, Java, JavaScript etc."
arch=('i686' 'x86_64')
url="http://faust.grame.fr/"
license=('GPL')
depends=('llvm-libs'
# needed for sound2faust:
	 'libsndfile'
# needed for libfaustremote:
#	 'jack2'
# needed for libHTTPDFaust:
	 'libmicrohttpd' 'openssl')
# We need xxd at build time, which is provided by 'gvim', 'vim' and 'xxd'
# (AUR).
makedepends=('llvm' 'clang' 'git' 'xxd')
optdepends=('clang: needed for sound2reader'
	    'ruby: needed for faust2sc and scbuilder')
provides=('faust')
conflicts=('faust')
# This keeps the static libraries. Remove the 'staticlibs' option if this
# isn't wanted.
options=('strip' 'staticlibs')
source=("$pkgname::git+git://git.code.sf.net/p/faudiostream/code#branch=faust2"
	"git+https://github.com/rukano/emacs-faust-mode.git")
md5sums=('SKIP' 'SKIP')

pkgver() {
  cd $srcdir/$pkgname
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

# NOTE: libHTTPDFaust requires 'liblo', 'libmicrohttpd' and 'openssl'.
# Similarly, sound2faust requires libsndfile which we also include by default.
# These are all optional, so you can get rid of the extra dependencies by
# changing the build target from 'world' to 'all' and removing the
# corresponding dependencies above.

build() {
  cd $srcdir/$pkgname
  make PREFIX=/usr world
  # 'remote' is disabled right now since it requires jack2.
  #make remote PREFIX=/usr
}

package() {
  cd $srcdir/$pkgname
  make install PREFIX=/usr DESTDIR="$pkgdir"

  # docs
  install -d "$pkgdir/usr/share/doc/faust"
  install -Dm644 documentation/*.{pdf,html} "$pkgdir/usr/share/doc/faust"

  # examples
  install -d "$pkgdir/usr/share/faust/examples"
  cp -R "examples/"* "$pkgdir/usr/share/faust/examples/"

  ## syntax highlighting files
  cd syntax-highlighting

  # kate
  install -Dm644 faust.xml "$pkgdir/usr/share/apps/katepart/syntax/faust.xml"
  # gedit
  install -Dm644 faust.lang "$pkgdir/usr/share/gtksourceview-2.0/language-specs/faust.lang"
  install -Dm644 faust.lang "$pkgdir/usr/share/gtksourceview-3.0/language-specs/faust.lang"

  # highlight
  install -Dm644 dsp.lang "$pkgdir/usr/share/highlight/langDefs/dsp.lang"

  # vim
  install -Dm644 faust.vim "$pkgdir/usr/share/vim/vimfiles/syntax/faust.vim"

  # emacs
  install -d "$pkgdir/usr/share/emacs/site-lisp/"
  install -Dm644 "$srcdir/emacs-faust-mode/faust-mode.el" "$pkgdir/usr/share/emacs/site-lisp/"
}
