# Maintainer: aksr <aksr at t-com dot me>
pkgname=neatroff-git
pkgver=0.r426.1eadad7
pkgrel=1
epoch=
pkgdesc="An implementation of troff typesetting system in C programming language."
arch=('i686' 'x86_64')
url="http://litcave.rudi.ir/"
license=('custom:BSD')
groups=()
depends=('neatmkfn-git')
makedepends=('git')
optdepends=('neateqn-git: An eqn preprocessor for neatroff.'
            'neatpost-git: Postscript postprocessor for neatroff.'
            'neatrefer-git: A small refer clone for managing bibliographic references.'
            'shape: A farsi/arabic shaping preprocessor for troff.')
checkdepends=()
provides=('neatroff')
conflicts=('neatroff')
replaces=()
backup=()
options=()
changelog=
install=
source=($pkgname::git+git://repo.or.cz/neatroff.git
        #$pkgname::git+git://repo.or.cz/neatroff.git#branch=dir
        "git://repo.or.cz/neatroff_make.git"
        "http://litcave.rudi.ir/neatroff.pdf")
noextract=()
md5sums=('SKIP'
         'SKIP'
         'SKIP')

## FONTS directory 
FDIR=/usr/share/neatroff/font

## MACROS directory
MDIR=/usr/share/neatroff/tmac

pkgver() {
  cd $srcdir/$pkgname
  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  make all FDIR=$FDIR MDIR=$MDIR
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 roff $pkgdir/usr/bin/neatroff
  install -Dm644 README $pkgdir/usr/share/doc/$pkgname/README
  install -Dm644 ../neatroff.pdf $pkgdir/usr/share/doc/$pkgname/neatroff.pdf
  install -Dm644 ../neatroff_make/tmac/NOTICE $pkgdir/usr/share/licenses/$pkgname/NOTICE
  ## copy neatroff macros
  mkdir -p $pkgdir/usr/share/neatroff/tmac/
  cp -r ../neatroff_make/tmac/* $pkgdir/usr/share/neatroff/tmac/
  rm -f $pkgdir/usr/share/neatroff/tmac/NOTICE
}

