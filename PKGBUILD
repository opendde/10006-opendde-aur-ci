# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=keneric
pkgver=0.2
pkgrel=1
pkgdesc='A generic thumbnailer for KDE'
arch=(i686 x86_64)
url='http://kde-apps.org/content/show.php/?content=174485'
license=(GPL)
depends=(kio)
makedepends=(extra-cmake-modules)
source=("http://kde-apps.org/CONTENT/content-files/174485-$pkgname-$pkgver.tar.gz" stripPicture kenerickrita.desktop kenericblend.desktop)
md5sums=('96a74b4321816ad5851bcbe7601ed79f'
         '0380500677769af4abe2826b01793a1d'
         '52eb5908aa2414c490853312b6f71a81'
         '723f0d5769a5e35019ba5892ce72f265')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../$pkgname-$pkgver \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTING=OFF \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  make -C build DESTDIR="$pkgdir" install

  mkdir -p "$pkgdir"/usr/{bin,share/kservices5}
  install -Dm755 stripPicture "$pkgdir"/usr/bin
  install -Dm644 *.desktop "$pkgdir"/usr/share/kservices5
}
