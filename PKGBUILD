# Maintainer: Daniel M. Capella <polyzen@archlinux.info>
# Contributor: Maxwell "Synthead" Pray <synthead@gmail.com>
# Contributor: Fergus Symon <fergofrog@fergofrog.com>

pkgname=razercfg
pkgver=0.39
pkgrel=1
pkgdesc='Next generation Razer mouse configuration tool'
arch=('any')
url=https://bues.ch/h/razercfg
license=('GPL')
depends=('python' 'libusb')
makedepends=('cmake')
optdepends=('python-pyside: for the graphical qrazercfg tool')
backup=('etc/razer.conf')
source=("http://bues.ch/razercfg/razercfg-$pkgver.tar.bz2"{,.asc}
        'tmpfile.conf')
install=razercfg.install
sha512sums=('165fee898a01b7f0086eb6705ef9f24fd8b8836025c071f7851a493181b8d193d0db70fc1731a8586de1f1c795aab4d20bb4ee8526b612c66ba3c434c6e10137'
            'SKIP'
            '0a84cf5775930ff9adca513971a9eaf983f239b4cf59f8915632477c6ca20c02997fed3a24864aa04058d66899da3599d92a2180cfc43676102b733dd1db577b')
validpgpkeys=('757FAB7CED1814AE15B4836E5FB027474203454C') # Michael Busch

build() {
  cd razercfg-$pkgver
  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd razercfg-$pkgver
  make DESTDIR="$pkgdir" install

  install -Dm644 razer.conf "$pkgdir"/etc/razer.conf
  install -Dm644 "$srcdir"/tmpfile.conf\
    "$pkgdir"/usr/lib/tmpfiles.d/razerd.conf
}

# vim:set ts=2 sw=2 et:
