# Maintainer: Adrián Laviós <adrian@lavios.eu>
pkgname=dnscrypt-proxy-go
pkgver=2.0.0beta2
pkgrel=1
pkgdesc="A modern client implementation written in Go of the DNSCrypt v2 protocol."
arch=('x86_64')
url="https://github.com/jedisct1/dnscrypt-proxy"
license=('custom:ISC')
makedepends=('git' 'go')
conflicts=('dnscrypt-proxy')
backup=('etc/dnscrypt-proxy/dnscrypt-proxy.toml' 'etc/dnscrypt-proxy/forwarding-rules.txt' 'etc/dnscrypt-proxy/blacklist.txt')
source=("https://github.com/jedisct1/dnscrypt-proxy/archive/${pkgver}.tar.gz"
        'dnscrypt-proxy.service')
sha512sums=('38ebf18f5e20640475dadca1ea282d59466397f15af9a3e3848991c34f3634d7740ee2f856bafef23a3594b3b41769c74833ae8e7005b0c539d1c907fb984999'
            '4c5531ebf92f2d528812bcf8923ea8e86bc6c96938a07980530406f1a4003bdc42ad78a14c2eeed37dd0adbc300cb98aaa6e11c0370ee806c89cef5211654192')

prepare() {
  cd "$srcdir/dnscrypt-proxy-${pkgver}/dnscrypt-proxy"
  sed -i 's/"dnscrypt-resolvers.csv"/"\/var\/cache\/dnscrypt-proxy\/dnscrypt-resolvers.csv"/g' dnscrypt-proxy.toml
  sed -i 's/"forwarding-rules.txt"/"\/etc\/dnscrypt-proxy\/forwarding-rules.txt"/g' dnscrypt-proxy.toml
  sed -i 's/"query.log"/"\/var\/log\/dnscrypt-proxy\/query.log"/g' dnscrypt-proxy.toml
  sed -i 's/"blacklist.txt"/"\/etc\/dnscrypt-proxy\/blacklist.txt"/g' dnscrypt-proxy.toml
  sed -i 's/"blocked.log"/"\/var\/log\/dnscrypt-proxy\/blocked.log"/g' dnscrypt-proxy.toml
}

build() {
  msg2 'Setting gopath...'
  mkdir -p "$srcdir/gopath"
  export GOPATH="$srcdir/gopath"
  
  msg2 'Setting build environment...'
  mkdir -p "${GOPATH}/src/github.com/jedisct1"
  ln -sfn "$srcdir/dnscrypt-proxy-${pkgver}" "${GOPATH}/src/github.com/jedisct1/dnscrypt-proxy"
  
  msg2 'Compiling...'
  cd "${GOPATH}/src/github.com/jedisct1/dnscrypt-proxy/dnscrypt-proxy"
  go build
}

package() {
  cd "$srcdir/dnscrypt-proxy-${pkgver}/dnscrypt-proxy"
  install -Dm755 "dnscrypt-proxy" "$pkgdir/usr/bin/dnscrypt-proxy"
  install -Dm644 "dnscrypt-proxy.toml" "$pkgdir/etc/dnscrypt-proxy/dnscrypt-proxy.toml"
  install -Dm644 "forwarding-rules.txt" "$pkgdir/etc/dnscrypt-proxy/forwarding-rules.txt"
  install -Dm644 "blacklist.txt" "$pkgdir/etc/dnscrypt-proxy/blacklist.txt"
  install -Dm644 "$srcdir/dnscrypt-proxy.service" "$pkgdir/usr/lib/systemd/system/dnscrypt-proxy.service"
  
  install -Dm644 "../LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
