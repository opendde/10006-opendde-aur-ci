# Maintainer: Daniel M. Capella <polycitizen@gmail.com>
# Contributor: Maxwell "Synthead" Pray <synthead@gmail.com>
# Contributor: Fergus Symon <fergofrog@fergofrog.com>

pkgbase=razercfg
pkgname=('razercfg' 'razerd')
pkgver=0.39
pkgrel=1
pkgdesc='Razer mouse configuration tool'
arch=('x86_64')
url=https://bues.ch/h/razercfg
license=('GPL')
depends=('libusb' 'python')
makedepends=('cmake')
source=("http://bues.ch/razercfg/razercfg-$pkgver.tar.bz2"{,.asc}
        'tmpfile.conf'
        'pyqt5.patch::https://github.com/mbuesch/razer/commit/598b8d1da086603993c203d33fc714c04780a92f.patch')
sha512sums=('165fee898a01b7f0086eb6705ef9f24fd8b8836025c071f7851a493181b8d193d0db70fc1731a8586de1f1c795aab4d20bb4ee8526b612c66ba3c434c6e10137'
            'SKIP'
            '0a84cf5775930ff9adca513971a9eaf983f239b4cf59f8915632477c6ca20c02997fed3a24864aa04058d66899da3599d92a2180cfc43676102b733dd1db577b'
            'a5869175aff5c2c36ee1f2853045ee48e7f931adb7cea230bbee03bc2778ea6402946789e92bd809796871ca1ce796ab65ca706c7eefcfff6297a73ffb8a8213')
validpgpkeys=('757FAB7CED1814AE15B4836E5FB027474203454C') # Michael Busch

prepare() {
  cd razercfg-$pkgver
  patch -Np1 -i ../pyqt5.patch | true
}

build() {
  cd razercfg-$pkgver
  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package_razercfg() {
  pkgdesc='Razer mouse configuration tool (UI)'
  depends=('python' 'razerd')
  optdepends=('python-pyqt5: for the graphical qrazercfg tool')

  make -C razercfg-$pkgver/ui DESTDIR="$pkgdir" install
}

package_razerd() {
  pkgdesc='Razer mouse configuration tool (daemon)'
  depends=('libusb')
  makedepends=('cmake')
  backup=('etc/razer.conf')
  install=razercfg.install

  cd razercfg-$pkgver
  sed -i '$d' CMakeLists.txt
  make DESTDIR="$pkgdir" install

  install -Dm644 razer.conf "$pkgdir"/etc/razer.conf
  install -Dm644 "$srcdir"/tmpfile.conf\
    "$pkgdir"/usr/lib/tmpfiles.d/razerd.conf
}

# vim:set ts=2 sw=2 et:
