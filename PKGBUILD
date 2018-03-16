# Maintainer: robertfoster

pkgname=openbazaard
pkgver=0.11.1
pkgrel=1
pkgdesc="Server daemon for communication between client and OpenBazaar network (Latest devel version)"
arch=(i686 x86_64)
url="https://github.com/OpenBazaar/openbazaar-go"
license=('MIT')
depends=()
install=$pkgname.install
makedepends=(go upx)
_user=github.com/OpenBazaar
_repo=openbazaar-go
source=("https://github.com/OpenBazaar/openbazaar-go/archive/v$pkgver.tar.gz"
	$pkgname.service
	$pkgname.conf
	$pkgname.sysuser.conf
)
options=('strip' 'upx')

build(){
	cd $srcdir
	export GOPATH=$PWD/.gopath
	mkdir -p $GOPATH/src/${_user}
	ln -sf $PWD/${_repo}-${pkgver} $GOPATH/src/${_user}/${_repo}

	cd $GOPATH/src/${_user}/${_repo}
	go get -v
}

package() {
	export PATH=$PATH:$PWD/.gopath/bin
	cd $GOPATH/src/${_user}/${_repo}

	go build

	install -Dm755 $GOPATH/bin/${_repo} $pkgdir/usr/bin/$pkgname
	install -Dm644 $srcdir/$pkgname.service $pkgdir/usr/lib/systemd/system/$pkgname.service
	install -Dm644 $srcdir/$pkgname.conf $pkgdir/etc/conf.d/$pkgname
	install -Dm755 $srcdir/$pkgname.sysuser.conf $pkgdir/usr/lib/sysusers.d/$pkgname.conf
}

md5sums=('c681d85ad0ac6a2c6d946ddc2a5b0fd2'
	'b0193c5364076ce7b112f13edf995ac1'
	'9fd31f8bc5b6ccc21a52fc1b58fdb9d6'
'92cd2fa8929c5acddbddf7d4fc2fd494')
