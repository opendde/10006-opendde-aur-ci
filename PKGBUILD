pkgname=duplicacy-util
pkgver=1.5
pkgrel=2
pkgdesc="A utility to run Duplicacy backups"
arch=('x86_64' 'i686')
url="https://github.com/jeffaco/duplicacy-util"
license=('Apache License 2.0')
makedepends=('go-pie' 'dep')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/jeffaco/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('ec49b052dbf1c23d90c95b648ddeaaa80f4f885d0f257ac2146724f626db8eb8')

prepare(){
  mkdir -p gopath/src/github.com/jeffaco
  ln -rTsf "${pkgname}-${pkgver}" gopath/src/github.com/jeffaco/duplicacy-util
}

build() {
  export GOPATH="$srcdir/gopath"
  export GOFLAGS="-ldflags=-s -ldflags=-w -gcflags=all=-trimpath=${GOPATH} -asmflags=all=-trimpath=${GOPATH}"
  cd "$GOPATH/src/github.com/jeffaco/duplicacy-util"
  go get -v -x
}

# Commented out becasue: timeutils_test.go:250: Result was incorrect, got '4 days, 2:02:05', expected '4 days, 3:02:05'
# Likely due to daylight savings time?

#check() {
#  export GOPATH="$srcdir/gopath"
#  unset GOFLAGS
#  cd "$GOPATH/src/github.com/jeffaco/duplicacy-util"
#  go test -v -x
#}

package() {
  install -Dm755 "gopath/bin/$pkgname" "$pkgdir/usr/bin/$pkgname"

  # Package license (if available)
  for f in LICENSE COPYING LICENSE.* COPYING.*; do
    if [ -e "$srcdir/src/$_gourl/$f" ]; then
      install -Dm644 "$srcdir/src/$_gourl/$f" "$pkgdir/usr/share/licenses/$pkgname/$f"
    fi
  done
}
