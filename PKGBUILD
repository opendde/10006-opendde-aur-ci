# Maintainer: David P. <megver83@parabola.nu>
# Contributor: Antonio Rojas <arojas@archlinux,org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

_pkgname=dolphin
pkgname=dolphin-root
pkgver=17.08.2
pkgrel=1
pkgdesc="File Manager, patched to be able to run as root"
arch=('armv7h' 'i686' 'x86_64')
url="https://kde.org/applications/system/dolphin/"
license=(LGPL)
depends=(baloo-widgets knewstuff kio-extras kuiserver kcmutils kparts kinit)
makedepends=(extra-cmake-modules kdoctools python)
optdepends=('kde-cli-tools: for editing file type options' 'ffmpegthumbs: video thumbnails' 'kde-thumbnailer-odf: ODF thumbnails'
            'ruby: installing new service menus from KDE Store' 'kdegraphics-thumbnailers: PDF and PS thumbnails' 'konsole: terminal panel')
conflicts=('kdebase-dolphin<15.08' 'dolphin')
provides=(dolphin)
replaces=(kdebase-dolphin)
source=("https://download.kde.org/stable/applications/$pkgver/src/${_pkgname}-$pkgver.tar.xz"{,.sig}
        "https://gitlab.com/Megver83/kdebase-root-patches/raw/master/0001-Revert-Disallow-executing-Dolphin-as-root-on-Linux.patch"{,.sig})
sha512sums=('de77ab439243b13952cb8d11343b0bd575b77c0daae7fc3936e91b0de9aed069593fbf97024ec84c7342d2993cfb4b2c64bf18da82cdf362b38e8623954559a2'
            'SKIP'
            'f96ce74603d868785cece5cec4a7dc57dd1b50c9423604382065235c8930c5679496cfb9e08b2956520e8205468caf2e36cdb0ad18738d3bf75fc5dfdba114ed'
            'SKIP')
validpgpkeys=('CA262C6C83DE4D2FB28A332A3A6A4DB839EAA6D7' # Albert Astals Cid <aacid@kde.org>
              'F23275E4BF10AFC1DF6914A6DBD2CE893E2D1C87' # Christoph Feck <cfeck@kde.org>
              '6DB9C4B4F0D8C0DC432CF6E4227CA7C556B2BA78' # David P.
) 

prepare() {
  mkdir -p build
  cd $srcdir/${_pkgname}-$pkgver
  patch -p1 -i $srcdir/0001-Revert-Disallow-executing-Dolphin-as-root-on-Linux.patch
}

build() {
  cd build
  cmake ../${_pkgname}-$pkgver \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
