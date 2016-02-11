# Maintainer: aksr <aksr at t-com dot me>
pkgname=muforth-git
pkgver=r1828.5ef26ac
pkgrel=1
epoch=
pkgdesc="A simple, indirect-threaded Forth, written in C; for target compiling; runs on Linux, BSD, OSX, and Cygwin."
arch=('i686' 'x86_64')
url="https://github.com/nimblemachines/muforth"
url="http://muforth.nimblemachines.com/"
license=('custom:BSD')
groups=()
depends=('')
makedepends=('git')
optdepends=()
checkdepends=()
provides=('muforth')
conflicts=('muforth')
replaces=()
backup=()
options=()
changelog=
install=
source=("$pkgname::git+https://github.com/nimblemachines/muforth.git")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname/src"
  #./configure.sh
  #make all
  #make install-vim
  ./dual-build.sh
}

package() {
  cd "$srcdir/$pkgname/src"
  mv muforth32 ../mu/muforth32
  mv muforth64 ../mu/muforth64
  mkdir -p $pkgdir/usr/{bin,lib/${pkgname%-*}}
  ln -rsf ../mu/muforth64 ../mu/muforth
  cp -R ../mu $pkgdir/usr/lib/${pkgname%-*}
  ln -rs -t $pkgdir/usr/bin/ $pkgdir/usr/lib/${pkgname%-*}/mu/muforth32
  ln -rs -t $pkgdir/usr/bin/ $pkgdir/usr/lib/${pkgname%-*}/mu/muforth64
  ln -rs $pkgdir/usr/lib/${pkgname%-*}/mu/muforth $pkgdir/usr/bin/muforth
  install -Dm644 ../README $pkgdir/usr/share/doc/${pkgname%-*}/README
  install -Dm644 ../doc/README.obsolete $pkgdir/usr/share/doc/${pkgname%-*}/README.obsolete
  install -Dm644 ../LICENSE $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
}

