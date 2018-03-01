# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgbase=decred-git
pkgname=('dcrd-git' 'dcrwallet-git')
pkgver=20180224
pkgrel=1
arch=('armv6h' 'armv7h' 'i686' 'x86_64')
makedepends=('dep' 'git' 'go')
groups=('decred')
url="https://decred.org"
license=('ISC')
options=('!strip' '!emptydirs')
source=(git+https://github.com/decred/dcrd
        git+https://github.com/decred/dcrwallet)
sha256sums=('SKIP' 'SKIP')

pkgver() {
  date +%Y%m%d
}

prepare() {
  export GOPATH="$srcdir"
  git clone "$srcdir/dcrd" "$GOPATH/src/github.com/decred/dcrd"
  git clone "$srcdir/dcrwallet" "$GOPATH/src/github.com/decred/dcrwallet"
}

build() {
  export GOPATH="$srcdir"

  msg2 'Building dcrd and dependencies...'
  cd "$GOPATH/src/github.com/decred/dcrd"
  dep ensure -v
  go install . ./cmd/...

  msg2 'Building dcrwallet and dependencies...'
  cd "$GOPATH/src/github.com/decred/dcrwallet"
  dep ensure -v
  go install . ./cmd/...

  msg2 'Prepending dcr to unqualified binaries...'
  for _bin in $(find "$srcdir/bin"  \
                        -mindepth 1 \
                        -maxdepth 1 \
                        -type f ! -name "dcr*" -printf '%f\n'); do
    mv "$srcdir/bin/$_bin" "$srcdir/bin/dcr$_bin"
  done
}

package_dcrd-git() {
  pkgdesc="Decred daemon written in Go"
  provides=('dcrd')
  conflicts=('dcrd')

  msg2 'Installing dcrd license...'
  install -Dm 644 "$srcdir/src/github.com/decred/dcrd/LICENSE" \
          -t "$pkgdir/usr/share/licenses/dcrd"

  msg2 'Installing dcrd docs...'
  for _doc in CHANGES README.md cmd/dcrctl/sample-dcrctl.conf; do
    install -Dm 644 "$srcdir/src/github.com/decred/dcrd/$_doc" \
            -t "$pkgdir/usr/share/doc/dcrd"
  done
  cp -dpr --no-preserve=ownership "$srcdir/src/github.com/decred/dcrd/docs" \
    "$pkgdir/usr/share/doc/dcrd"

  msg2 'Installing dcrd...'
  for _bin in dcraddblock \
              dcrctl \
              dcrd \
              dcrfindcheckpoint \
              dcrgencerts \
              dcrpromptsecret; do
    install -Dm 755 "$srcdir/bin/$_bin" -t "$pkgdir/usr/bin"
  done
}

package_dcrwallet-git() {
  pkgdesc="Secure Decred wallet daemon written in Go"
  provides=('dcrwallet')
  conflicts=('dcrwallet')

  msg2 'Installing dcrwallet license...'
  install -Dm 644 "$srcdir/src/github.com/decred/dcrwallet/LICENSE" \
          -t "$pkgdir/usr/share/licenses/dcrwallet"

  msg2 'Installing dcrwallet docs...'
  for _doc in CHANGES README.md sample-dcrwallet.conf; do
    install -Dm 644 "$srcdir/src/github.com/decred/dcrwallet/$_doc" \
            -t "$pkgdir/usr/share/doc/dcrwallet"
  done
  cp -dpr --no-preserve=ownership \
    "$srcdir/src/github.com/decred/dcrwallet/docs" \
    "$pkgdir/usr/share/doc/dcrwallet"

  msg2 'Installing dcrwallet...'
  for _bin in dcrmovefunds \
              dcrsweepaccount \
              dcrwallet; do
    install -Dm 755 "$srcdir/bin/$_bin" -t "$pkgdir/usr/bin"
  done
}
