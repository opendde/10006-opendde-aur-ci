# This file was generated by GoReleaser. DO NOT EDIT.
# Maintainer: Chmouel Boudjnah <chmouel@chmouel.com>

pkgname='gosmee-bin'
pkgver=0.0.3
pkgrel=1
pkgdesc='Gosmee - smee.io forwarder in go'
url='https://github.com/chmouel/gosmee'
arch=('aarch64' 'x86_64')
license=('Apache 2.0')
provides=('gosmee')
conflicts=('gosmee')

source_aarch64=("${pkgname}_${pkgver}_aarch64.tar.gz::https://github.com/chmouel/gosmee/releases/download/0.0.3/gosmee_0.0.3_Linux_arm64.tar.gz")
sha256sums_aarch64=('386cc53154b69fcda7764c03a4625fe9221a16cdfd6edca1a23d08265528109e')

source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/chmouel/gosmee/releases/download/0.0.3/gosmee_0.0.3_Linux_x86_64.tar.gz")
sha256sums_x86_64=('ef83a5b29b40d64d9de5d1962ddfe5ae74306cfac230aca40ad6a99339f32d16')

package() {
  install -Dm755 "./gosmee" "${pkgdir}/usr/bin/gosmee"
}
