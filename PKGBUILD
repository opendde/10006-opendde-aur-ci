# Maintainer: Paul Hentschel (hpmachining) <aur at hpminc dot com>
# Contributor: Justin R. St-Amant <jstamant24 at gmail dot  com>

pkgname=camotics
pkgver=1.2.0
pkgrel=3
pkgdesc="3-axis NC machining simulation software"
arch=('x86_64')
url="https://camotics.org/"
license=('GPL2')
depends=(
  'v8-3.14'
  'qt5-websockets'
  'cairo'
  'desktop-file-utils'
)
makedepends=(
  'scons'
  'python-six'
  'qt5-tools'
  'cbang'
)
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/CauldronDevelopmentLLC/$pkgname/archive/v$pkgver.tar.gz"
  "0001_python3_and_scons.patch"
)
sha256sums=('f5203d2bbd32c4e347a8f79122e57b2deea68e6c5bd4f0be4087c4d62a31c8a4'
            'efd61c32d9adffffe73672effbcdcedcedcc14693c797ac4d93574ac4e20c1b9')

prepare() {
  cd "CAMotics-$pkgver"
	patch -p1 -i "../0001_python3_and_scons.patch"
}

build() {
  cd "CAMotics-$pkgver"
  CBANG_HOME=/opt/cbang scons linkflags=$LDFLAGS
}

package() {
  cd "CAMotics-$pkgver"
  CBANG_HOME=/opt/cbang scons install install_prefix="$pkgdir/usr" linkflags=$LDFLAGS

  install -d "$pkgdir/usr/share/$pkgname"/tpl_lib
  cp -a tpl_lib/ "$pkgdir/usr/share/$pkgname"
  install -Dm644 -t  "$pkgdir"/usr/share/applications CAMotics.desktop
  install -Dm644 -t "$pkgdir"/usr/share/pixmaps images/camotics.png
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md CHANGELOG.md COPYING LICENSE

  # install examples and machines
  install -d "$pkgdir/usr/share/doc/$pkgname"/{examples,machines}
  cp -a {examples/,machines/} "$pkgdir/usr/share/doc/$pkgname"
}

# vim:set ts=2 sw=2 et:
