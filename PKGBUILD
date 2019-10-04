pkgname=mictray
pkgver=0.1.4
pkgrel=1
pkgdesc="Lightweight application which lets you control the microphone state and volume from system tray"
url="https://github.com/Junker/MicTray"
arch=('i686' 'x86_64')
license=('GPL-3')
makedepends=('vala' 'meson' 'ninja' 'libpulse')
depends=('gtk3' 'libgee')
source=("https://github.com/Junker/${pkgname}/archive/${pkgver}.zip")
md5sums=('edf392a2e583082fab2cf03fb7710cfa')

build() {
cd $srcdir/${pkgname}-$pkgver
meson build --prefix=/usr
cd build
ninja
}

package() {
cd $srcdir/${pkgname}-$pkgver/build
DESTDIR="$pkgdir" ninja install
}
