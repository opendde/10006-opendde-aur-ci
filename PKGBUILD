# Maintainer: cyqsimon <28627918+cyqsimon@users.noreply.github.com>

pkgname=simple-tls-bin
pkgver=0.7.0
pkgrel=2
pkgdesc="A simple TLS1.3 tunnel for TCP traffic."
arch=('x86_64' 'aarch64')
url="https://github.com/IrineSistiana/simple-tls"
license=('GPL3')
provides=('simple-tls')
conflicts=('simple-tls')
source_x86_64=("${url}/releases/download/v${pkgver}/simple-tls-linux-amd64.zip")
source_aarch64=("${url}/releases/download/v${pkgver}/simple-tls-linux-arm64.zip")
sha512sums_x86_64=('cdfa018e3ec4db157e259dfc58c00358ea6dea6c714715bbaaaced7f2348e44e03159f636fc641eae03fc02fce207841f9705b8b21a6ec2f9a907442097f019e')
sha512sums_aarch64=('912993fe59144081f290e412dfec4bb8269bebcc486b67d3b03bc70da85d416f59a9d6ef83321a4101431f9acdf6340b3044d77844285b5343670b1b3eae56c5')

package() {
  cd "$srcdir"
  install -Dm755 simple-tls "${pkgdir}/usr/bin/simple-tls"
}
