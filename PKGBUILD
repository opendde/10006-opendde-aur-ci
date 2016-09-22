# Maintainer: Guillaume Maudoux <layus DOT on @AT@ gmail DOT com>

pkgname=mozart2-git
pkgver=v2.0.0.alpha.0.4180.g7bdb820
pkgrel=1
pkgdesc="The Mozart Programming System version 2"
arch=('i686' 'x86_64')
url="https://github.com/mozart/mozart2"
license=('BSD')
depends=('boost-libs' 'tk' 'gmp' 'hicolor-icon-theme' 'xdg-utils')
optdepends=('emacs: Interactive programming interface (recommended)')
makedepends=('java-runtime-headless' 'emacs' 'gcc' 'boost>=1.61' 'cmake' 'gtest' 'clang' 'llvm')
provides=('mozart')
conflicts=('mozart' 'mozart-git' 'mozart2' 'mozart2-bin')
install="${pkgname}.install"
source=(
    "$pkgname::git+https://github.com/mozart/mozart2"
    'git+https://github.com/mozart/mozart2-stdlib'
    'git+https://github.com/google/googletest'
)
sha256sums=('SKIP' 'SKIP' 'SKIP')

pkgver() {
    cd "$pkgname"
    git describe --always | sed 's|-|.|g'
}

prepare() {
    cd "$srcdir/$pkgname"

    git submodule init
    git config submodule.stdlib.url $srcdir/mozart2-stdlib
    git config submodule.gtest.url $srcdir/googletest
    git submodule update

    # Add required libraries to executable.
    # TODO : Explore clang build process, I have no idea why this may be needed.
    #        Normally ld should be able to identify required LLVM/Clang libs by itself.
    libs="LLVM clang clangTooling clangFrontendTool clangFrontend \
          clangDriver clangSerialization clangCodeGen clangParse clangSema \
          clangStaticAnalyzerFrontend clangStaticAnalyzerCheckers \
          clangStaticAnalyzerCore clangAnalysis clangARCMigrate clangEdit \
          clangAST clangLex clangBasic"
    sed -i'' \
        -e "s%(generator \"\${CLANG_LIBRARY}\"%\\0 $libs%" \
        vm/generator/main/CMakeLists.txt

    # Remove hard-coded palette settings in QTk (Avoids bug in GUI's on Linux).
    sed -i'' '/tk_setPalette/ s/^/%/' \
        stdlib/wp/qtk/QTkBare.oz
}

build() {
    cd "$srcdir/$pkgname"
    cmake \
          -DCMAKE_BUILD_TYPE=Release \
          -DCMAKE_INSTALL_PREFIX=/usr/ \
          -DMOZART_BOOST_USE_STATIC_LIBS=OFF \
          .

    make #VERBOSE=1
}

check() {
    cd "$srcdir/$pkgname"
    make test
}

package() {
    cd "$srcdir/$pkgname"
    make DESTDIR="$pkgdir/" install
    rm -rf "$pkgdir/usr/include/gtest"
    rm -rf "$pkgdir/usr/lib"

    install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

