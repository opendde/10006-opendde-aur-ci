# Original author: Josiah Schwab <jschwab at gmail dot com>
# Maintainer: Josiah Schwab <jschwab at gmail dot com>

pkgname=mesasdk
pkgdesc="Software development kit for use with the MESA stellar evolution code"
pkgver=20160129
pkgrel=2
arch=('x86_64')
url="http://www.astro.wisc.edu/~townsend/static.php?ref=mesasdk"
provides=('mesasdk')
depends=('binutils' 'make' 'perl' 'libx11' 'zlib' 'tcsh' 'glibc')
install=mesasdk.install
source=("http://www.astro.wisc.edu/~townsend/resource/download/${pkgname}/${pkgname}-x86_64-linux-${pkgver}.tar.gz")
sha1sums=('fa277ee9a95a89837bf43cdf5f260aea4b407141')
options=('!strip')

package() {
  mkdir -p ${pkgdir}/opt
  tar --extract --file ${pkgname}-x86_64-linux-${pkgver}.tar.gz --directory ${pkgdir}/opt
}
