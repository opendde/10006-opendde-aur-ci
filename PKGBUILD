# Maintainer: Tom Richards <tom@tomrichards.net>
# Contributor: grimsock <lord.grimsock at gmail dot com>
# Contributor: David Danier <david.danier@team23.de>

pkgname=solr
pkgver=6.6.0
pkgrel=1
pkgdesc="Popular, blazing fast open source enterprise search platform from the Apache Lucene project"
arch=('any')
license=('Apache')
url="http://lucene.apache.org/solr/"
depends=('java-runtime-headless>=8')
makedepends=('unzip')
source=("http://archive.apache.org/dist/lucene/$pkgname/$pkgver/solr-$pkgver.tgz"{,.asc}
        "solr.service"
        "solr.sysusers")
backup=(opt/solr/server/etc/jetty{,-http,-https,-ssl}.xml
        opt/solr/server/etc/webdefault.xml
        opt/solr/server/solr/solr.xml
        opt/solr/server/solr/zoo.cfg)
install="$pkgname.install"
options=(!strip)
validpgpkeys=('052C5B48A480B9CEA9E218A5F98C13CFA5A135D8'  # "Jim Ferenczi (CODE SIGNING KEY) <jimczi@apache.org>"
              '2085660D9C1FCCACC4A479A3BF160FF14992A24C') # "Ishan Chattopadhyaya <ishan@apache.org>"
sha256sums=('6b1d1ed0b74aef320633b40a38a790477e00d75b56b9cdc578533235315ffa1e'
            'SKIP'
            'e4ca86de2ef9425913280deeeec42d6e8ff310b08ea55d9156193ceef3c847bd'
            'a336c1a16742b100b3d28fe49722366477bb805e262f36b83cc2fdd9e85d5bf9')
build() {
  cd "$srcdir/$pkgname-$pkgver"/bin
  rm *.cmd
  rm install_solr_service.sh
  rm -rf init.d
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p "$pkgdir"/opt/solr
  cp -R * "$pkgdir"/opt/solr
  chown -R 114:114 "$pkgdir"/opt/solr
  install -Dm644 "$srcdir/solr.service" "$pkgdir/usr/lib/systemd/system/solr.service"
  install -Dm644 "$srcdir/solr.sysusers" "$pkgdir/usr/lib/sysusers.d/solr.conf"
}
