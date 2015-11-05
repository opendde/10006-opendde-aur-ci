# Maintainer: Ivan Zenin <i.zenin@gmx.com>

pkgname=amule-remote-git
pkgver=master
pkgrel=1
pkgdesc='An eMule-like client for the eD2k and Kademlia p2p networks (remote GUI only, development version)'
url='http://www.amule.org'
arch=('i686' 'x86_64')
license=('GPL')
depends=('geoip' 'geoip-database' 'wxgtk>=2.8')
makedepends=('git')
conflicts=('amule')
source=('git+git://repo.or.cz/amule.git')
md5sums=('SKIP')

pkgver() {
  cd "${SRCDEST}/amule"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "${srcdir}/amule"
  ./configure \
      --prefix=/usr \
      --mandir=/usr/share/man \
      --disable-monolithic \
      --disable-amule-daemon \
      --disable-amulecmd \
      --disable-webserver \
      --enable-amule-gui \
      --disable-cas \
      --disable-wxcas \
      --disable-ed2k \
      --disable-alc \
      --disable-alcc \
      --disable-xas \
      --disable-fileview \
      --disable-plasmamule \
      --disable-static \
      --disable-kde-in-home \
      --enable-geoip \
      --disable-upnp \
      --disable-debug \
      --disable-profile \
      --enable-optimize \
      --enable-mmap \
      --enable-nls \
      --disable-ccache \
      --with-wx-config=/usr/bin/wx-config
  make
} 

package() {
  cd "${srcdir}/amule"
  make DESTDIR="${pkgdir}" install
  find "${pkgdir}" -type d -name .git -exec rm -r '{}' +
  install -dm750 -o129 -g129 "${pkgdir}/var/lib/amule"
  rm -fr "${pkgdir}/usr/share"/{pixmaps,applications}
}

