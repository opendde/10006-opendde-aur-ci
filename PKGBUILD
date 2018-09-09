pkgbase=msl
pkgname=('msl')
pkgver=1.0.1
pkgrel=1
pkgdesc='Shader language based off GLSL that allows compiling multiple shaders into modules.'
arch=('i686' 'x86_64')
url="https://github.com/akb825/ModularShaderLanguage"
license=('Apache')
makedepends=('cmake' 'git')
depends=('boost')
source=()
sha256sums=()

build() {
	mkdir MSL && cd MSL
	git clone https://github.com/akb825/ModularShaderLanguage .
	git checkout v${pkgver}
	git submodule init
	git submodule update
	mkdir build && cd build
	cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_SKIP_RPATH=TRUE -DMSL_BUILD_DOCS=OFF -DMSL_BUILD_TESTS=OFF -DMSL_SHARED=ON
	make
}

package() {
	cd MSL/build
	make DESTDIR="${pkgdir}" install
}
