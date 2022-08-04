# -*- shell-script -*-
# Contributor: Mikko Sysikaski  mikko.sysikaski at gmail dot com
# Updated by Stephen Diehl - sdiehl@clarku.edu
# Maintainer: Alastair Pharo  asppsa at gmail dot com
# Maintainer: Albert Graef <aggraef@gmail.com>

pkgname=pure-pcre
_pkgname=pure
pkgver=0.68
pkgrel=4
pkgdesc="Pure is a modern-style functional programming language based on term rewriting (variant with Perl regex support)."
arch=("i686" "x86_64")
license=('GPL3' 'LGPL3')
url="http://purelang.bitbucket.org/"
depends=('llvm35-libs' 'gmp' 'mpfr' 'pcre' 'readline')
makedepends=('llvm35')
optdepends=("clang35: needed for inlining C/C++ code"
	    "pure-docs: online documentation"
            "w3m: access to help in interactive mode"
            "emacs-pure-mode: editing Pure files from Emacs"
            "texmacs-pure: embedding Pure sessions in TeXmacs")
provides=('pure')
conflicts=('pure')
source=("https://github.com/agraef/pure-lang/releases/download/$_pkgname-$pkgver/$_pkgname-$pkgver.tar.gz"
       "emacs27.patch")
md5sums=('082d522d05e58e55dc8094ba4c3d3eda'
         'fe62166e277a6accefbfa81e2e307900')

prepare() {
  cd $srcdir/$_pkgname-$pkgver
  patch -p2 -i ../emacs27.patch
}

build() {
  cd $srcdir/$_pkgname-$pkgver
  ./configure --prefix=/usr --with-pcre --without-elisp --without-texmacs --enable-release
  make || return 1
  # check that the interpreter is working
  make check || return 1
}

package() {
  cd $srcdir/$_pkgname-$pkgver
  make DESTDIR=$pkgdir install || return 1
  # Copy the needed binaries from the LLVM toolchain to make the batch
  # compiler work without having the llvm35 package installed.
  cp /usr/bin/llc /usr/bin/llvm-as /usr/bin/opt $pkgdir/usr/lib/pure
}
