pkgname=fluidkeys
pkgver=1.0.0
pkgrel=1
pkgdesc='Simple PGP for engineering teams'
arch=('any')
url="https://www.fluidkeys.com"
license=('AGPL3')
makedepends=('go-pie' 'rsync' 'dep')
provides=("fluidkeys=$pkgver")
source=("https://github.com/fluidkeys/fluidkeys/archive/v${pkgver}.tar.gz")
sha256sums=('bb3c20faaa771c35608556c335fb4faf5e7f7edf03fa386122592ad0fcec1c23')

_gopath="gopath/src/github.com/fluidkeys/fluidkeys"

prepare(){
  mkdir -p "$srcdir/gopath/src/github.com/fluidkeys"
  ln -rTsf $pkgname-$pkgver "$srcdir/$_gopath"
  export GOPATH="$srcdir/gopath"
  cd $srcdir/$_gopath
  dep ensure
}

build() {
  cd "$srcdir/$_gopath"
  export GOPATH="$srcdir/gopath"
  make
}

package() {
  cd $srcdir/$_gopath
  export GOPATH="$srcdir/gopath"

  make install PREFIX="$pkgdir/usr"
}
