# Maintainer: Yamboy1 <yamboyd1@gmail.com>
# Contributor: Alexander Cardosi <alexanderdcardosi@gmail.com>
pkgname=deno-bin
_pkgname=deno
pkgdesc="A secure TypeScript runtime on V8"
pkgver=1.2.0
pkgrel=1
arch=('x86_64')
license=('MIT')
url='http://deno.land/'
provides=('deno')
makedepends=('binutils' 'unzip')
source_x86_64=("${_pkgname}-${pkgver}.zip::https://github.com/denoland/deno/releases/download/v${pkgver}/${_pkgname}-x86_64-unknown-linux-gnu.zip")
sha256sums_x86_64=('3352aa03b92283d7a9058cc552330268180df08cbf68d7750aacf08f548bd381')

prepare() {
  unzip -o "${_pkgname}-${pkgver}.zip"
}

package() {
  mkdir -p "$pkgdir"/usr/bin
  install -Dm0755  "$_pkgname" "$pkgdir"/usr/bin/
  rm -f ../"$_pkgname".zip || true
  rm -f ../../"$_pkgname".zip || true
}
