# Maintainer: Thomas Weißschuh <thomas t-8ch de>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=batman-adv
pkgver=2015.1
pkgrel=1
pkgdesc='batman kernel module'
arch=('i686' 'x86_64')
url='http://www.open-mesh.net/'
license=('GPL')
install='batman-adv.install'
source=("http://downloads.open-mesh.org/batman/releases/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz"
        'batman-adv.install')
depends=('linux')
makedepends=('linux-headers')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make KERNELPATH=/usr/lib/modules/$(uname -r)/build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -D -m644 net/batman-adv/batman-adv.ko "${pkgdir}/usr/lib/modules/$(uname -r)/updates/net/batman-adv/batman_adv.ko"
  install -D -m644 README "${pkgdir}/usr/share/doc/batman-adv/README"
}

sha256sums=('62ff9b769ada746e7a373a048ca8036fbd73f81c63053bbbe25fa24b4343dd0d'
            '347599c02426a905690002885c277f91b82da2b29d3372348e5f02d03c435c37')
