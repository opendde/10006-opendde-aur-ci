# Maintainer: Bas Timmer <basjetimmer at yahoo dot com >

_pkgname=okular
pkgname=okular-no-purpose
pkgver=20.08.3
pkgrel=2
pkgdesc='Okular, a document viewer, without the dependency on purpose. This disables the share menu'
arch=(x86_64)
url="https://kde.org/applications/graphics/okular/"
license=(GPL LGPL FDL)
groups=(kde-applications kde-graphics)
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
source=("https://download.kde.org/stable/release-service/$pkgver/src/$_pkgname-$pkgver.tar.xz"{,.sig}
         kdebug-414701.patch::"https://invent.kde.org/graphics/okular/commit/585340ce.patch")
sha256sums=('3f4d084d738a7dfb996d5f1bb5becd2a96b0fbb35135010460f239cdd98ca9e0'
            'SKIP'
            '29233464d15630b8936857c9dfd643fa1076969024613f46c38ef63cc914fea7')
validpgpkeys=(CA262C6C83DE4D2FB28A332A3A6A4DB839EAA6D7  # Albert Astals Cid <aacid@kde.org>
              F23275E4BF10AFC1DF6914A6DBD2CE893E2D1C87) # Christoph Feck <cfeck@kde.org>
options=(!zipman)

prepare() {
  patch -d $pkgname-$pkgver -p1 -i ../kdebug-414701.patch # Fix navigation after clicking on a link
}

build() {
  cmake -B build -S $_pkgname-$pkgver \
    -DCMAKE_BUILD_TYPE=Release \
    -DKDEExperimentalPurpose_FOUND=OFF \
    -DBUILD_TESTING=OFF
    cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
