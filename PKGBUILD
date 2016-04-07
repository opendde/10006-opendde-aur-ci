# Maintainer: Luca Weiss <WEI16416@spengergasse.at>

pkgname=ubuntu-device-flash-bzr
_pkgname=ubuntu-device-flash
pkgver=r227
pkgrel=1
pkgdesc="Tools to work with Ubuntu Touch"
url="https://launchpad.net/goget-ubuntu-touch"
arch=('x86_64' 'i686')
license=('GPL3')
depends=('android-tools')
makedepends=('go' 'bzr')
# options='!emptydirs'
provides=("ubuntu-device-flash")
conflicts=("ubuntu-device-flash")
source=("bzr+lp:goget-ubuntu-touch")
md5sums=('SKIP')

pkgver() {
  cd $srcdir/goget-ubuntu-touch
  printf "r%s" "$(bzr revno)"
}

build() {
  export GOPATH="$srcdir/build"

  cd $srcdir/goget-ubuntu-touch/${_pkgname}

  #download deps
  echo "go get: downloading dependencies..."
  go get -v -d

  echo "go build: building executable..."
  # Prepare executable
  go build
}

package() {
  SOURCE_PATH="$srcdir/goget-ubuntu-touch"
  # Package license (if available)
  install -Dm644 "$SOURCE_PATH/COPYING" \
        "$pkgdir/usr/share/licenses/$_pkgname/COPYING"

  # Package executables
  install -Dm755 "$SOURCE_PATH/${_pkgname}/${_pkgname}" \
    "$pkgdir/usr/bin/$_pkgname"
}
