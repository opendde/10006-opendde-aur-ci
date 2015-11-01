# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>

pkgname=quine-relay
pkgver=5029ce6
pkgrel=1
pkgdesc='Uroboros program with 100 programming languages'
arch=('x86_64' 'i686')
url='http://github.com/mame/quine-relay'
license=('MIT')
depends=('algol68g' 'bash' 'boo' 'chicken' 'clisp' 'clojure' 'fpc' 'gawk' 'gcc'
         'gcc-fortran' 'ghc' 'go' 'groovy' 'llvm' 'make' 'mono' 'nodejs' 'ocaml'
         'octave' 'parrot' 'perl' 'php' 'python' 'r' 'ruby' 'scala' 'tcl'
         'ucblogo' 'vala' 'c-intercal' 'coffee-script' 'f2c' 'gforth' 'icon'
         'iverilog' 'gnu-cobol' 'pike' 'regina-rexx-das' 'swi-prolog'
         'smalltalk' 'beef' 'jasmin' 'gcc-objc' 'gcc-ada' 'scilab' 'lci-git'
         'spl' 'maxima' 'slang' 'fpiet' 'neko' 'nickle' 'pari' 'bsd-games'
         'ratfor' 'gambas3-script' 'mlton' 'thue' 'mono-basic' 'yorick-git' 'zoem' 'aplus-fsf')
optdepends=('advancecomp: For generating langs.png'
            'optipng: For generating langs.png')
source=('quine-relay::git://github.com/mame/quine-relay.git'
        'quine-relay.sh')
sha256sums=('SKIP'
            '2409f6ccaed7070143b365fb1e276ff73620d9651f12d5058c2291b3d093be95')
conflicts=('quine-relay-git')
replaces=('quine-relay-git')

pkgver() {
  cd "$pkgname"

  git describe --always | sed 's|-|.|g'
}

prepare() {
  cd "$pkgname"

  <README.md tail -22 > LICENSE

  # lolcode is available in Arch Linux
  sed -i 's:vendor/lci-\*/::' Makefile
  # npiet is available in Arch Linux
  sed -i 's:vendor/npiet-\*/::' Makefile
  # whitespace is available in Arch Linux
  #sed -i 's:ruby vendor/whitespace.rb:wspace:' Makefile
}

package() {
  cd "$pkgname"

  install -d "$pkgdir/usr/share/quine-relay"
  cp -r * "$pkgdir/usr/share/quine-relay"
  install -Dm755 ../quine-relay.sh "$pkgdir/usr/bin/quine-relay"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
