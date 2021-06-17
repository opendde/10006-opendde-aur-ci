# Maintainer: Mads Kjeldgaard<mail@madskjeldgaard.dk>
pkgname=supercollider-vstplugin-git
pkgver=r1714.13447dd
pkgrel=1
pkgdesc='The IEM vstplugin plugin for SuperCollider'
arch=('x86_64')
url='https://git.iem.at/pd/vstplugin'
license=('custom: Other')
groups=('pro-audio' 'supercollider-plugins')
depends=('supercollider' 'lib32-libx11')
makedepends=('git' 'cmake' 'supercollider-headers-git')
optdepends=()
conflicts=("supercollider-vstplugin")
source=("$pkgname-$pkgver"::git+$url.git)
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname-$pkgver"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {

		SC_SRC="/usr/share/supercollider-headers"
		DEST="$pkgdir/usr/share/SuperCollider/Extensions"

		cd "$srcdir/$pkgname-$pkgver"
		git submodule update --init --recursive
		git checkout develop

		# Get VST2
		.git-ci/get_vst2.sh

		# Get VST3
		.git-ci/get_vst3.sh

		cd "$srcdir/$pkgname-$pkgver"
		mkdir -p build 
		cd build

		cmake -DSC=ON -DPD=OFF -DVST2=ON -DVST3=ON -DBUILD_HOST=ON -DBUILD_HOST32=ON -DBUILD_WINE=OFF -DWINE=OFF -DBRIDGE=ON -DSUPERNOVA=ON -DSC_INCLUDEDIR="$SC_SRC" -DCMAKE_BUILD_TYPE=RELEASE -DSC_INSTALLDIR="$DEST" ..

		cmake --build . -j -v
		# make
}


package() {
	cd "$srcdir/$pkgname-$pkgver/build"
	cmake --build . -v -t install

	install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/supercollider-vstplugin-git/LICENSE.txt"

	echo -E "
-------------------
VSTPlugin installed for SuperCollider:

Please run VSTPlugin.clear and VSTPlugin.search() when starting SuperCollider.

-------------------
	"
	# cmake --build . --config Release --target install
}

