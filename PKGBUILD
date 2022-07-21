# Maintainer: zu1k <i@zu1k.com>

pkgname=nali-go-bin
_pkgname=nali
pkgver=0.5.0
pkgrel=1
pkgdesc='An offline tool for querying IP geographic information and CDN provider. (Pre-compiled)'
arch=('i686' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/zu1k/nali"
license=('MIT')
provides=('nali')
conflicts=('nali')

source_i686=("https://github.com/zu1k/nali/releases/download/v${pkgver}/$_pkgname-linux-386-v$pkgver.gz")
source_x86_64=("https://github.com/zu1k/nali/releases/download/v${pkgver}/$_pkgname-linux-amd64-v$pkgver.gz")
source_aarch64=("https://github.com/zu1k/nali/releases/download/v${pkgver}/$_pkgname-linux-armv8-v$pkgver.gz")
source_armv6h=("https://github.com/zu1k/nali/releases/download/v${pkgver}/$_pkgname-linux-armv6-v$pkgver.gz")
source_armv7h=("https://github.com/zu1k/nali/releases/download/v${pkgver}/$_pkgname-linux-armv7-v$pkgver.gz")
source_arm=("https://github.com/zu1k/nali/releases/download/v${pkgver}/$_pkgname-linux-armv5-v$pkgver.gz")

sha256sums_i686=('2e9cb276aa14ee1c6892872de67ac6620ae55d12b7334e76a4c7940fbb7e5928')
sha256sums_x86_64=('e7de678d78275725cc95d7dffdab6c2399a26ba83986b447d8343b2c0adba86a')
sha256sums_arm=('f0bc23ad6fab0a9846b238bfb6818e6b9ac0a23b669295f87a3997448ae672ca')
sha256sums_armv7h=('eb942d3721f5eed34dccfcaf11b277e059cde6ef218afe168c08db1310cca2f0')
sha256sums_armv6h=('b9316cfda26953fbd298ad27cdb7c41d688311010abec3418f439302c6ff5774')
sha256sums_aarch64=('efc850e1ed21e59a671b6002d66ac4132d82ef23b8fc41355564cea7b1621294')


package() {
  cd "$srcdir"
  install -Dm755 $_pkgname-linux-*-v$pkgver "$pkgdir"/usr/bin/$_pkgname
}
