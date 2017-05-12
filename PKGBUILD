# Maintainer: Can Celasun <can[at]dcc[dot]im>
pkgname=netsniff-ng-git
_gitname=netsniff-ng
pkgver=v0.6.3.5.gb25a51fa
pkgrel=1
pkgdesc='A high performance Linux network sniffer for packet inspection (git version).'
arch=('i686' 'x86_64')
url='http://netsniff-ng.org/'
license=('GPL2')
provides=('netsniff-ng')
conflicts=('netsniff-ng')
makedepends=('cmake' 'flex' 'bison' 'git')
depends=('ncurses' 'geoip' 'zlib' 'libnetfilter_conntrack' 'libpcap' 'liburcu' 'libnl' 'libcli' 'libnet' 'libsodium')
source=('git+https://github.com/netsniff-ng/netsniff-ng.git')
md5sums=('SKIP')
pkgver() {
  cd $_gitname
  git describe --always | sed 's|-|.|g'
}

build() {
  cd "${srcdir}"/${_gitname}
  NACL_INC_DIR=/usr/include/sodium NACL_LIB=sodium ./configure
  make DISTRO=1 allbutmausezahn
}

package() {
  cd "${srcdir}"/${_gitname}
  make PREFIX="/usr" DESTDIR="${pkgdir}" SBINDIR="/usr/bin" install_allbutmausezahn
}
