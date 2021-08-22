# Maintainer: Mark Wagie <mark dot wagie at tutantota dot com>
# Contributor: Federico Di Pierro <nierro92@gmail.com>
pkgname=clight
pkgver=4.7
pkgrel=1
pkgdesc="A C daemon that turns your webcam into a light sensor. It can also change display gamma temperature, dim your screen and set your dpms."
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/FedeDP/Clight"
license=('GPL')
depends=('clightd' 'gsl' 'hicolor-icon-theme' 'libconfig' 'popt')
makedepends=('git' 'cmake' 'bash-completion')
optdepends=('geoclue: to retrieve user location through geoclue.'
            'upower: to save energy by increasing timeouts between captures while on battery
             and to autocalibrate keyboard backlight.'
            'bash-completion: to add support for bash automatic completion.'
            'clight-gui: Clight GUI written in Qt.')
backup=("etc/default/$pkgname.conf")
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('a4fc09f118eaa79d5fe9d5f19a2adc323b6401ece7f074e34cb577eec2121833')

build() {
  cmake -B build -S Clight-$pkgver \
    -G "Unix Makefiles" \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev
  make -C build
}

package() {
  make -C build DESTDIR="$pkgdir" install
}
