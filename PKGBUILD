# Maintainer: ccat3z <c0ldcat3z@gmail.com>

pkgname=miktex-git
pkgver=2.9.7000.r0.9231c4ef
pkgrel=1
pkgdesc="a distribution of the TeX/LaTeX typesetting system"
arch=('x86_64')
url="https://miktex.org"
license=('custom')
depends=('apr' 'apr-util' 'bzip2' 'cairo' 'expat' 'fontconfig' 'freetype2'
         'fribidi' 'gd' 'gmp' 'graphite' 'harfbuzz-icu' 'hunspell' 'icu'
         'libjpeg' 'log4cxx' 'xz' 'mpfr' 'libmspack' 'openssl' 'pixman' 'libpng'
         'poppler' 'popt' 'potrace' 'uriparser' 'zziplib' 'poppler-qt5')
makedepends=('git' 'cmake' 'coreutils' 'fop' 'sed' 'libxslt' 'qt5-tools')
source=('miktex::git+https://github.com/MiKTeX/miktex.git')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
    cd "$srcdir/${pkgname%-git}"	
    [ -d build ] || mkdir build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=/opt/miktex -DWITH_UI_QT=ON ..
}

build() {
    cd "$srcdir/${pkgname%-git}/build"
    make
}

package() {
    cd "$srcdir/${pkgname%-git}/build"
    make DESTDIR="$pkgdir/" install
    
    cd $pkgdir

    install -Dm644 opt/miktex/share/applications/miktex-console.desktop usr/share/applications/miktex-console.desktop
    sed -i 's/^Exec=miktex-console$/Exec=\/opt\/miktex\/bin\/miktex-console/' usr/share/applications/miktex-console.desktop
    cp -R opt/miktex/share/applications/icons usr/share/

    mv opt/miktex/man usr/share/man
}
