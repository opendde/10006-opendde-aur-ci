# Maintainer: marazmista <marazmista@gmail.com>

pkgname=radeon-profile-git
pkgver=20190127.r9.ged1a23f
pkgrel=1
pkgdesc="App for display info about radeon card"
url="http://github.com/marazmista/radeon-profile"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('qt5-base' 'qt5-charts' 'libxkbcommon-x11' 'libxrandr')
makedepends=('qt5-tools')
optdepends=('radeon-profile-daemon: system daemon for reading card info'
	'sudo: start with root privilages without password'
	'mesa-demos: for glxinfo'
	'xorg-xdriinfo: display driver name'
	'xorg-xrandr: show card connected outputs'
	'xf86-video-ati: radeon open source driver'
	'xf86-video-amdgpu: amdgpu open source driver')
provides=('radeon-profile')
replaces=('radeon-profile')
source=("git+https://github.com/marazmista/radeon-profile.git")
sha256sums=('SKIP')

pkgver() {
cd "$srcdir/radeon-profile"
git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
cd "$srcdir/radeon-profile/radeon-profile"

lrelease radeon-profile.pro
qmake-qt5
make
}

package() {
cd "$srcdir/radeon-profile/radeon-profile"

install -Dm755 "target/radeon-profile" "$pkgdir/usr/bin/radeon-profile"

install -Dm644 "extra/radeon-profile.png" "$pkgdir/usr/share/pixmaps/radeon-profile.png"
install -Dm644 "extra/radeon-profile.desktop" "$pkgdir/usr/share/applications/radeon-profile.desktop"

cd translations
for translation in *.qm
do
install -Dm644 $translation "$pkgdir/usr/share/radeon-profile/$translation"
done
}
