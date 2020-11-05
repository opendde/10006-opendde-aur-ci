# Maintainer: Simon Legner <Simon.Legner@gmail.com>
# Maintainer: Ndoskrnl <lollipop.studio.cn@gmail.com>
pkgname=coredns-wgsd-git
_pkgname='wgsd'
pkgver=1.8.0
pkgrel=1
pkgdesc="A DNS server that chains plugins - with module wgsd"
makedepends=('go')
conflicts=('coredns-bin')
arch=('i686' 'x86_64')
url="https://github.com/tobikris/wgsd"
license=('Apache')
provides=('coredns')
conflicts=('coredns')
source=($_pkgname::git+https://github.com/tobikris/wgsd.git#branch=serve-self
coredns.service
coredns-sysusers.conf)

sha256sums=('SKIP'
            '030cd8e938c293c11a9acdb09b138f98b37874772072336792ec4bf0d9eff9b1'
            '536d03f8b20b0d2d6e8f96edd7e4e4dd7f6fef39ab0e952522d8725f3cc186b7')

pkgver() {
    cd $srcdir/$_pkgname
    cat go.mod | grep -o --color=never -P '(?<=coredns v)[.\d]+'
}

build() {
  export GOPATH="$srcdir/build"
  export PATH=$GOPATH/bin:$PATH

  cd $srcdir/$_pkgname/cmd/coredns
  go build

  cd $srcdir/$_pkgname/cmd/wgsd-client
  go build
}

package() {
  install -Dm755 "$srcdir/$_pkgname/cmd/coredns/coredns" "$pkgdir/usr/bin/coredns"
  install -Dm755 "$srcdir/$_pkgname/cmd/wgsd-client/wgsd-client" "$pkgdir/usr/bin/wgsd-client"
  install -Dm644 "$srcdir/coredns.service" "$pkgdir/usr/lib/systemd/system/coredns.service"
  install -Dm644 "$srcdir/coredns-sysusers.conf" "$pkgdir/usr/lib/sysusers.d/coredns.conf"
  install -d "${pkgdir}/etc/coredns"
}
