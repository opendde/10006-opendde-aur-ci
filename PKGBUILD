pkgname=qnetwalk
pkgver=1.6
pkgrel=1
pkgdesc="Connect all the terminals to the server, in as few turns as possible"
arch=('x86_64')
url="https://github.com/AMDmi3/qnetwalk"
license=('GPL')
depends=('qt5-base' 'sdl_mixer')
makedepends=('cmake' 'qt5-tools')
source=("https://github.com/AMDmi3/qnetwalk/archive/$pkgver.tar.gz")

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr .
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

md5sums=('d0c53f06795bb1a72f434d87f05bbb05')
sha1sums=('d68c68856f3f0439417d8b546b7fc9b9f4c46868')
sha256sums=('5712ba4fa245ab5de06bded4c8b48f2714c9c804637d77c414145248f208e44c')
sha384sums=('abb6cebd7a7eadf5db2ac721ca22ba167715d20a01857e2f5c8570b8e0738d1a7963d7a97362b712a6180159300815f6')
sha512sums=('00286d969f353b2da0ad65e062648b7cf89872fbd6b0d27b3d6decee2cb33c8e858ab03c7e6c1e63c2902f6de405af65916ec260c293d1eab2a514a56b14f003')
