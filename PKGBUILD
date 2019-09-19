pkgname=libdnf
pkgver=0.35.5
pkgrel=1
pkgdesc="Library providing simplified C and Python API to libsolv"
arch=('i686' 'x86_64')
url="https://github.com/rpm-software-management/$pkgname"
license=('LGPL2.1')
depends=('glib2' 'gpgme' 'json-c' 'libmodulemd1>=1.6.1' 'librepo>=1.10.0' 'libsolv>=0.7.4'
         'libutil-linux' 'openssl' 'rpm-org>=4.14.2.1' 'sqlite' 'zlib')
makedepends=('cmake' 'gtk-doc' 'python' 'python-sphinx' 'swig' 'zchunk>=0.9.11')
checkdepends=('check' 'cppunit' 'python-nose')
optdepends=('python: for python bindings')
provides=( 'hawkey')
conflicts=('hawkey')
replaces=( 'hawkey')
source=("$url/archive/$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('5e8531c72006ed83162d7b5e0b2c580f')

prepare() {
	cd "$pkgname-$pkgver"
	rm -rf build
	mkdir build

	# sphinx-build-3 does not exist on Arch Linux,
	# use sphinx-build instead
	sed -e 's/sphinx-build-3/sphinx-build/' \
	    -i docs/hawkey/CMakeLists.txt

	cp -p /usr/share/cmake/Modules/FindLibSolv.cmake cmake/modules/
}

build() {
	cd "$pkgname-$pkgver"/build

	cmake -DCMAKE_BUILD_TYPE=Release \
	      -DCMAKE_C_FLAGS="$CFLAGS $CPPFLAGS" \
	      -DCMAKE_CXX_FLAGS="$CXXFLAGS $CPPFLAGS" \
	      -DCMAKE_INSTALL_PREFIX=/usr \
	      -DCMAKE_INSTALL_LIBDIR=lib \
	      -DPYTHON_DESIRED=3 \
	      -DWITH_ZCHUNK=ON \
	      ..

	make
}

# As CMake looks for check dependencies, the function check() must be
# defined or else makepkg will not install them and the build will fail.
check() {
	cd "$pkgname-$pkgver"/build
	# Fails because Arch Linux's /etc/os-release does not have a
	# VERSION_ID field
	#make ARGS="-V" test
}

package() {
	cd "$pkgname-$pkgver"/build

	make DESTDIR="$pkgdir/" install

	install -Dp -m644 ../README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# vim: set ft=sh ts=4 sw=4 noet:
