# Maintainer: Gustavo Castro < gustawho [ at ] openmailbox [ dot ] org >
# Contributor: Faheem Pervez < trippin1 gmail >
# Contributor: Evgeniy Alekseev <arcanis at archlinux dot org>
# Contributor: prettyvanilla <prettyvanilla at lavabit dot com>
# Contributor: Antonio Rojas <arojas@archlinux,org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>
# Contributor: Dany Martineau <dany.luc.martineau at gmail dot com>
# Contributor: sausageandeggs <sausageandeggs at archlinux dot us>

pkgname=dolphin-klook
_origpkgname="${pkgname%%-*}"
pkgver=18.04.2
pkgrel=1
pkgdesc="KDE File Manager with KLook support"
arch=(i686 x86_64)
url="http://kde.org/applications/system/dolphin/"
license=(LGPL)
depends=(baloo-widgets knewstuff kio-extras kactivities klook-git desktop-file-utils kuiserver kcmutils)
makedepends=(extra-cmake-modules kdoctools python)
optdepends=('kde-cli-tools: for editing file type options' 'ffmpegthumbs: Video thumbnails' 'ruby: installing new service menus with GHNS'
            'ruby: installing new service menus with GHNS' 'plasma-desktop: remote:// protocol'
            'kdegraphics-thumbnailers: PDF and PS thumbnails' 'konsole: terminal panel')
conflicts=('kdebase-dolphin<18.04' kdebase-dolphin-klook "$_origpkgname" "dolphin-klook-frameworks")
replaces=(kdebase-dolphin)
provides=("$_origpkgname")
groups=(kde-applications kdebase)
source=("http://download.kde.org/stable/applications/$pkgver/src/$_origpkgname-$pkgver.tar.xz"{,.sig}
        "dolphin-klook.patch")
install="dolphin.install"
sha256sums=('b27ecfc4864638d88f2efd59f183d469f801ba0d85c37ca872e85ed70ba8683e'
            'SKIP'
            'e76ff2915e3fa7f4405a80b002a2062ca0f2d9e7f57775162815c02eec547fde')
validpgpkeys=(CA262C6C83DE4D2FB28A332A3A6A4DB839EAA6D7) # Albert Astals Cid <aacid@kde.org>

prepare() {
  mkdir -p build
  cd "$_origpkgname-$pkgver"
  patch -Np1 -i "${srcdir}/dolphin-klook.patch"
}

build() {
  cd build
  cmake ../$_origpkgname-$pkgver \
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
