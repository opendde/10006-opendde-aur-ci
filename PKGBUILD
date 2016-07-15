# Maintainer: Daniel M. Capella <polyzen@archlinux.info>
# Contributor: Maxwell "Synthead" Pray <synthead@gmail.com>
# Contributor: Fergus Symon <fergofrog@fergofrog.com>

pkgname=razercfg
pkgver=0.35
pkgrel=1
pkgdesc='Next generation Razer device configuration tool'
arch=('any')
url=https://bues.ch/h/razercfg
license=('GPL')
depends=('python' 'libusb')
makedepends=('cmake' 'hardening-wrapper')
optdepends=('python-pyside: for the graphical qrazercfg tool')
backup=('etc/razer.conf')
source=("http://bues.ch/razercfg/razercfg-$pkgver.tar.bz2"{,.asc}
        'tmpfile.conf')
install=razercfg.install
sha256sums=('2f07c5f1b8f775208f67f2b949e00117d22bf8abb4c5f9185c6f55c1b67fc5de'
            'SKIP'
            'a6fa99646938e57bd8be18a38de86ccae5bb19c78e571265db5987a46d0bf21a')
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
