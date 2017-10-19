# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=tidb-git
pkgver=1.0.0.17.gb45890ab6
pkgrel=1
pkgdesc="Distributed SQL database inspired by the desing of Google F1"
arch=('i686' 'x86_64')
url="https://pingcap.com/"
license=('APACHE')
depends=('glibc')
makedepends=('go' 'godep' 'git')
source=(git+https://github.com/pingcap/tidb.git
        config.toml
				tidb.service
				tidb.user
				tidb.tmpfile
				socket-perms.patch)
backup=(etc/tidb/config.toml)
sha256sums=('SKIP'
            '0651e419f27961ccb85bf5ea7ef9576bbc433f7211aa8a77e2b6139f7dba8c7e'
            '66c85143faeec8b136a71dbf1d400afa041eace57271dbfce0edfccca3874402'
            'e8e60176eca71d4f930828e9e152c3bae4db70cff409a7557f12e145700e4a03'
            '30ce83fbec8f102c30e438282bb5b18c026d08480f2386d68f1116c12481bf66'
            'a7827d1c75ee57a52a5e60b930ef1619a6cd580d98730a59bc6a49e358affbe6')

pkgver() {
	cd "$srcdir"/tidb
	git describe --tags --always | sed 's/-/./g;s/^v//'
}

prepare() {
	mkdir -p src/github.com/pingcap
	cd src/github.com/pingcap
	rm -f tidb
	ln -s "$srcdir/tidb"

	cd "$srcdir"/tidb
	patch -p1 -i "$srcdir"/socket-perms.patch
	sed 's|/tmp/tidb|/var/lib/tidb|g' -i tidb-server/main.go config/config.go
}

build() {
	export GOPATH="$srcdir"
	export PATH="$PATH:$GOPATH/bin"
	cd src/github.com/pingcap/tidb
	LDFLAGS= make
}

#check() {
#	export GOPATH="$srcdir"
#	export PATH="$PATH:$GOPATH/bin"
#	cd src/github.com/pingcap/tidb
#	make test
#}

package() {
	export GOPATH="$srcdir"
	export PATH="$PATH:$GOPATH/bin"

	install -Dm644 config.toml "$pkgdir"/etc/tidb/config.toml
	install -Dm644 tidb.service "$pkgdir"/usr/lib/systemd/system/tidb.service
	install -Dm644 tidb.user "$pkgdir"/usr/lib/sysusers.d/tidb.conf
	install -Dm644 tidb.tmpfile "$pkgdir"/usr/lib/tmpfiles.d/tidb.conf

	cd src/github.com/pingcap/tidb
	install -Dm755 bin/tidb-server "$pkgdir"/usr/bin/tidb-server
}
