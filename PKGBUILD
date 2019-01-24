# Maintainer: Bart Verhagen <bart at verhagenconsultancy dot be>
pkgname=('rapidcheck')
pkgbase='rapidcheck'
pkgver=0.0.0
pkgrel=1
epoch=983
pkgdesc="QuickCheck clone for C++ with the goal of being simple to use with as little boilerplate as possible."
arch=('any')
url="https://github.com/emil-e/rapidcheck"
license=('BSD')
groups=()
depends=()
makedepends=(cmake)
checkdepends=()
optdepends=(catch2 google-test boost)
provides=('rapidcheck=0.0.0')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=rapidcheck.changelog
source=("rapidcheck::git+$url.git#commit=3eb9b4ff69f4ff2d9932e8f852c2b2a61d7c20d3")
noextract=()
validpgpkeys=()

_git_dir='rapidcheck'
_build_dir='build'

_build_targets=('all')

_test_binary='counter'
_test_targets=(${_test_binary})

pkgver() {
    printf "%s" $pkgver
}

build() {
    cmake -G "Unix Makefiles" -H"$_git_dir" -B"$_build_dir" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="$pkgdir/usr/" -DCMAKE_INSTALL_LIBDIR="lib" -DRC_ENABLE_EXAMPLES=OFF -DRC_ENABLE_TESTS=OFF -DRC_INSTALL_ALL_EXTRAS=ON
    make --directory "$_build_dir" ${_build_targets[@]}
}

check() {
    cmake -G "Unix Makefiles" -H"$_git_dir" -B"$_build_dir" -DRC_ENABLE_EXAMPLES=ON
    make --directory "$_build_dir" ${_test_targets[@]}

    $_build_dir/examples/${_test_binary}/${_test_binary}
}

package_rapidcheck() {
    cmake -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" -P "$_build_dir/cmake_install.cmake" 
}

md5sums=('SKIP')
