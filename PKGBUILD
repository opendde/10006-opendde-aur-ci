# Maintainer: Daniel M. Capella <polyzen@archlinux.info>
# Contributor: Maxwell "Synthead" Pray <synthead@gmail.com>
# Contributor: Fergus Symon <fergofrog@fergofrog.com>

pkgname=razercfg
pkgver=0.38
pkgrel=1
pkgdesc='Next generation Razer mouse configuration tool'
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
sha512sums=('4619e19278fe97956043e2b628ed4c130b0e7ac2756a81335460cc520e0dea979fa6db3e927f414d24914409377782238a6ce9e1dba1868f6bfc34984a0ab456'
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
