# Maintainer: marazmista <marazmista@gmail.com>

pkgname=radeon-profile-daemon-git
pkgbase=radeon-profile-daemon-git
pkgver=20190124.r6.g05bdb90
pkgrel=1
pkgdesc="System daemon for radeon-profile"
url="http://github.com/marazmista/radeon-profile-daemon"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('qt5-base' 'radeon-profile')
optdepends=('xf86-video-ati: radeon driver'
	    'xf86-video-amdgpu: amdgpu driver')
provides=('radeon-profile-daemon')
replaces=('radeon-profile-daemon')
source=('git+https://github.com/marazmista/radeon-profile-daemon.git')
sha256sums=('SKIP')
  
pkgver() {
cd "$srcdir/radeon-profile-daemon/"
git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
mkdir -p build
cd build
qmake-qt5 "../radeon-profile-daemon/radeon-profile-daemon/"
make
}
 
package() {
install -Dm644 "$srcdir/build/target/radeon-profile-daemon" "$pkgdir/usr/bin/radeon-profile-daemon"
chmod +x "$pkgdir/usr/bin/radeon-profile-daemon"

install -Dm644 "$srcdir/radeon-profile-daemon/radeon-profile-daemon/extra/radeon-profile-daemon.service" "$pkgdir/usr/lib/systemd/system/radeon-profile-daemon.service"
}