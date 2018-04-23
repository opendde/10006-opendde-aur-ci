# Maintainer: Marco Pompili <aur@emarcs.org>

pkgname=oglplus
pkgver=0.72.0
pkgrel=1
pkgdesc="A C++ wrapper for modern OpenGL"
arch=('i686' 'x86_64')
url="https://github.com/matus-chochlik/oglplus"
license=('custom:boost')
makedepends=('cmake' 'boost' 'freeglut' 'glew' 'libpng' 'sdl')
optdepends=('boost' 'freeglut' 'glew' 'libpng' 'sdl')
provides=('oglplus')
source=("https://github.com/matus-chochlik/oglplus/archive/${pkgver}.tar.gz")
sha256sums=('468ef248f97b01051b93523ece5d2fb0ac833d912e64b0bcd73b0207b7e73ce2')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure.sh --prefix /usr --no-examples --no-docs
  cd _build
  make
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}/_build"
  make DESTDIR="${pkgdir}" install
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE_1_0.txt" "${pkgdir}/usr/share/licenses/oglplus/LICENSE"
}
