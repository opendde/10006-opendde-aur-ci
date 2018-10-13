# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: speps <speps dot aur dot archlinux dot org>

pkgname=beatslash-lv2
pkgver=1.0.5
pkgrel=1
pkgdesc="A set of LV2 plugins to mangle, slash, repeat and do much more with your beats."
arch=('i686' 'x86_64')
url="http://objectivewave.wordpress.com/beatslash-lv2/"
license=('GPL')
groups=('lv2-plugins')
depends=('lv2' 'gtkmm')
makedepends=('python2' 'lvtk')
provides=('lv2.beatslash')
source=("$pkgname-$pkgver.tar.gz::https://github.com/blablack/$pkgname/archive/$pkgver.tar.gz")
md5sums=('f992ea91cdf4e223817d94cc251e089d')

prepare() {
  cd "$pkgname-$pkgver"

  # patch sources for lvtk v2
  for src in src/*;
    do sed -i 's/lvtk-1/lvtk-2/g' "$src";
  done

  # patch waf build script for lvtk v2
  sed -i \
    -e 's/lvtk-plugin-1/lvtk-plugin-2/' \
    -e 's/lvtk-ui-1/lvtk-ui-2/' \
    -e 's/lvtk-gtkui-1/lvtk-gtkui-2/' \
    wscript
}

build() {
  cd "$pkgname-$pkgver"

  python2 waf configure --prefix=/usr
  python2 waf
}

package() {
  cd "$pkgname-$pkgver"

  python2 waf --destdir="$pkgdir/" install
}
