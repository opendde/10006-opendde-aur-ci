# Maintainer: Sibren Vasse <arch at sibrenvasse dot nl> 
# Contributor:  oozyslug <oozyslug at gmail dot com>
# Submitter: oozyslug <oozyslug at gmail dot com>

pkgname=byobu
pkgver=5.98
pkgrel=1
pkgdesc="Enhanced profile and useful notifications for tmux/screen"
arch=("any")
url="https://launchpad.net/byobu"
license=("GPL3")
depends=("libnewt" "python" "tmux")
makedepends=("gettext")
optdepends=("screen: alternative back-end for byobu (default: tmux)"
            "python2: needed for byobu-config")
source=("${url}/trunk/${pkgver}/+download/${pkgname}_${pkgver}.orig.tar.gz")
md5sums=('2e09c9d2f9e3b6e2953bd581b027239c')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # arch-specific screens dir
  sed -re 's;^SOCKETDIR=.+$;SOCKETDIR="/tmp/screens";' -i etc/byobu/socketdir	
  ./configure --prefix=/usr --sysconfdir=/etc
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make install DESTDIR="$pkgdir"
}
