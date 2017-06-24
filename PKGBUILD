#Maintainer: M0Rf30

pkgname=peerflix-server
pkgver=0.2.0
pkgrel=1
pkgdesc="Streaming torrent client for node.js with web ui"
arch=('i686' 'x86_64')
url="https://github.com/asapach/peerflix-server"
license=('MIT')
depends=('nodejs')
makedepends=('nodejs-grunt-cli' 'bower' 'npm')
source=(https://github.com/asapach/peerflix-server/archive/v${pkgver}.tar.gz
	peerflix-server.sh
	peerflix-server.service)
conflicts=('peerflix-server-git')
options=('!strip')

build() {
  cd $srcdir/$pkgname-$pkgver
  npm install
  bower install
  grunt build
}

package(){
  cd $srcdir/$pkgname-$pkgver

  mkdir -p $pkgdir/opt/peerflix-server
  cp -r dist server node_modules LICENSE $pkgdir/opt/peerflix-server/
  install -Dm644 "${srcdir}/peerflix-server.service" "${pkgdir}/usr/lib/systemd/system/peerflix-server.service"
  install -Dm775 "${srcdir}/peerflix-server.sh" "${pkgdir}/usr/bin/peerflix-server"
} 

md5sums=('f4c27f1c360423f5ad569e62e01482bb'
         'ee5ad551f86380d0a353b5220ab58159'
         'f22faa77f2d6049eee5d1a91140a25cc')
