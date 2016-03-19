# Contributor: M0Rf30

pkgname=capanalysis
pkgver=v1.2.0
pkgrel=1
arch=(i686 x86_64)
pkgdesc="PCAP files from another point of view"
url="http://www.capanalysis.net/"
license=('GPL')
depends=('glibc' 'libpcap' 'libpqxx' 'sqlite' 'openssl' 'zlib' 'wireshark-cli' 'apache' 'php-apache' 'php-sqlite' 'php-pgsql' 'postgresql')
makedepends=(xxd xplico)
source=('capanalysis::git+https://github.com/M0Rf30/capanalysis.git'
	capanalysis.service
	capana.conf)
install=capanalysis.install

prepare() {
    cd capanalysis
    make pkgbin
    make subdir capanalysis check_version
    mkdir ../xplico
    cd ../xplico
    ln -sr /opt/xplico/bin/xplico .
    ln -sr /opt/xplico/bin/modules/ .
}
package() {
    cd capanalysis
    make INSTALL_DIR=$pkgdir/opt/capanalysis install
    mkdir -p $pkgdir/etc/httpd/conf/extra
    cp ../capana.conf $pkgdir/etc/httpd/conf/extra/httpd-capana.conf
    install -Dm644 ../capanalysis.service "${pkgdir}"/usr/lib/systemd/system/capanalysis.service

}

pkgver() {
  cd capanalysis
  echo $(git tag)
}

md5sums=('SKIP'
         '9c33942e477795f97539cc7e57e404cf'
         '9c8e3ca78f5dd0b8616b6c8b1e5e4e1e')
