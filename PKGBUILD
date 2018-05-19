# Maintainer: FFY00 <filipe.lains@gmail.com>

pkgname=tribler
pkgver=7.0.2
pkgrel=1
pkgdesc="Privacy enhanced BitTorrent client with P2P content discovery"
url="http://www.tribler.org/"
arch=(any)
license=('LGPL3')
depends=('python2-cryptography' 'python2-feedparser' 'python2-apsw' 'python2-cherrypy' 'python2-plyvel' 'python2-pillow' 'python2-pyqt5' 'qt5-svg' 'phonon-qt5-vlc' 'python2-feedparser' 'python2-chardet' 'python2-psutil' 'python2-meliae'
'python2-decorator' 'python2-netifaces' 'python2-requests' 'python2-twisted' 'libsodium' 'libtorrent-rasterbar' 'python2-m2crypto' 'python2-configobj' 'python2-matplotlib')
optdepends=('vlc: for internal video player')
makedepends=('python2-setuptools')
source=("https://github.com/Tribler/tribler/releases/download/v${pkgver}/Tribler-v${pkgver}.tar.xz")
md5sums=('4273969881196dba1130df6f21e8eb18')

build () {
  cd "${srcdir}/tribler"
  python2 setup.py build
}

package() {
  cd "${srcdir}/tribler"
  python2 setup.py install --root=${pkgdir} --optimize=1
  install -d "${pkgdir}"/usr/{bin,share/tribler}
  cp -r Tribler "${pkgdir}"/usr/share/tribler
  cp -r TriblerGUI "${pkgdir}"/usr/share/tribler
  cp Tribler/schema_sdb_v*.sql "${pkgdir}"/usr/share/tribler/Tribler
  install -d "${pkgdir}"/usr/share/{applications,pixmaps}
  install -m644 Tribler/Main/Build/Ubuntu/tribler.desktop "${pkgdir}"/usr/share/applications
  install -m644 Tribler/Main/Build/Ubuntu/tribler.xpm "${pkgdir}"/usr/share/pixmaps
  install -m644 Tribler/Main/Build/Ubuntu/tribler_big.xpm "${pkgdir}"/usr/share/pixmaps
  install -m755 debian/bin/tribler "${pkgdir}"/usr/bin
  install -m644 logger.conf "${pkgdir}"/usr/share/tribler/
  install -m644 run_tribler.py "${pkgdir}"/usr/share/tribler/
  install -m644 check_os.py "${pkgdir}"/usr/share/tribler/
  cp -r twisted "${pkgdir}"/usr/share/tribler
}

