# Maintainer: Bas Timmer <basjetimmer at yahoo dot com >

_pkgname=okular
pkgname=okular-no-purpose
pkgver=19.12.1
pkgrel=2
pkgdesc='Okular, a document viewer, without the dependency on purpose. This disables the share menu'
arch=(x86_64)
url="https://kde.org/applications/graphics/okular/"
license=(GPL LGPL FDL)
groups=(kde-applications kdegraphics)
depends=(djvulibre libspectre libkexiv2 poppler-qt5 qca-qt5 kpty kactivities threadweaver kjs kparts discount phonon-qt5)
makedepends=(extra-cmake-modules ebook-tools kdegraphics-mobipocket kdoctools khtml chmlib)
optdepends=('ebook-tools: mobi and epub support'
            'kdegraphics-mobipocket: mobi support' 'libzip: CHM support'
            'khtml: CHM support' 'chmlib: CHM support' 'calligra: ODT and ODP support'
            'unrar: Comic Book Archive support' 'unarchiver: Comic Book Archive support (alternative)')
conflicts=(kdegraphics-okular)
conflicts=(okular)
replaces=(kdegraphics-okular)
replaces=(okular)
provides=(okular)
source=("https://download.kde.org/stable/release-service/$pkgver/src/$_pkgname-$pkgver.tar.xz"{,.sig})
sha256sums=('485044127c6bbe0d4c71f1518da15050957c06b8fe36633462367d15d684d4bd'
            'SKIP')
validpgpkeys=(CA262C6C83DE4D2FB28A332A3A6A4DB839EAA6D7  # Albert Astals Cid <aacid@kde.org>
              F23275E4BF10AFC1DF6914A6DBD2CE893E2D1C87) # Christoph Feck <cfeck@kde.org>

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../$_pkgname-$pkgver \
    -DCMAKE_BUILD_TYPE=Release \
    -DKDEExperimentalPurpose_FOUND=OFF \
    -DBUILD_TESTING=OFF \
    -DBUILD_OKULARKIRIGAMI=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
