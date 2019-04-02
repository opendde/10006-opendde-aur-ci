# Maintainer: Xuanwo <xuanwo@archlinuxcn.org>
pkgname=tidb
pkgver=2.1.7
pkgrel=1
pkgdesc='A distributed HTAP database compatible with the MySQL protocol'
makedepends=('go' 'make' 'git')
arch=('x86_64')
url='https://github.com/pingcap/tidb'
license=('Apache')
provides=('tidb-server')
backup=(etc/tidb/tidb.toml)
depends=('tikv')
source=(tidb-${pkgver}.tar.gz::https://github.com/pingcap/tidb/archive/v${pkgver}.tar.gz
        tidb.service
        tidb-sysusers.conf
        tidb-tmpfiles.conf
        tidb.toml)
sha256sums=('187b1edab996f9e46be320e6c759f6e2a295996e885b29c30fa860c09a3d506f'
            '22318c19bb89ff5a0852df5186cc1496214cd49f2264192413a326d1e8c93dc9'
            '2b147d80985e714d5f861baf76591104c07058b9b6fa573bf0676d675cf8fc20'
            '30ce83fbec8f102c30e438282bb5b18c026d08480f2386d68f1116c12481bf66'
            'a34a8ca1f13c965cc0e872fc671f377b64a80cc11225cd6359bf7415b4c86a06')

_gopkgname='github.com/pingcap/tidb'

prepare() {
  export GOPATH="$srcdir/build"
  rm -rf "$GOPATH/src/$_gopkgname"
  mkdir -p `dirname "$GOPATH/src/$_gopkgname"`
  mv -Tv "$srcdir/tidb-${pkgver}" "$GOPATH/src/$_gopkgname"
}

build() {
  export GOPATH="$srcdir/build"
  export PATH=$GOPATH/bin:$PATH

  _LDFLAGS="-X github.com/pingcap/parser/mysql.TiDBReleaseVersion=$pkgver -X $_gopkgname/util/printer.TiDBGitHash=v$pkgver -X $_gopkgname/util/printer.TiDBGitBranch=master"

  cd $GOPATH/src/$_gopkgname

  # Remove all git operations.
  sed -i '/(shell git/d' Makefile

  # A workaround for https://github.com/pingcap/tidb/issues/8827
  rm go.sum

  LDFLAGS=$_LDFLAGS make server
}

package() {
  # Install binary
  install -Dm755 "$srcdir/build/src/$_gopkgname/bin/tidb-server" "$pkgdir/usr/bin/tidb-server"
  # Install systemd service
  install -Dm644 "$srcdir/tidb.service" "$pkgdir/usr/lib/systemd/system/tidb.service"
  # Install sysusers
  install -Dm644 "$srcdir/tidb-sysusers.conf" "$pkgdir/usr/lib/sysusers.d/tidb.conf"
  # Install tmpfiles
  install -Dm644 "$srcdir/tidb-tmpfiles.conf" "$pkgdir/usr/lib/tmpfiles.d/tidb.conf"
  # Install default config
  install -Dm644 tidb.toml "$pkgdir/etc/tidb/tidb.toml"
}

# vim: ft=sh syn=sh et
