# Maintainer: Jojii <jojii@gmx.net>
pkgname=datamanager-cli-git
pkgver=1.8.r293.8f32e12
pkgrel=1
epoch=
pkgdesc="The official cli client for the datamanager system"
arch=('i686' 'x86_64')
url="https://github.com/DataManager-Go/DataManagerCLI"
license=('MIT')
groups=()
depends=()
makedepends=(
    'git'
    'go'
)

options=()
install=
changelog=
source=("git+$url")
md5sums=("SKIP")

pkgver() {
	cd "$srcdir/DataManagerCLI"
	printf "1.8.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/DataManagerCLI"
	go build -o manager
    ./manager --help-man > manager.8
}

package() {
	cd "$srcdir/DataManagerCLI"
    mkdir -p $pkgdir/usr/bin
    install -DT manager $pkgdir/usr/bin/manager
    install -Dm644 manager.8 $pkgdir/usr/share/man/man8/manager.8
}
