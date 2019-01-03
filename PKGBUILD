# Contributor: Korzhetskiy Yury <neitrinoph@gmail.com>

pkgname=mingw-w64-qwt
pkgver=6.1.4
pkgrel=1
pkgdesc="Qt Widgets for Technical Applications (mingw-w64)"
arch=('any')
license=('custom:qwt')
url="http://qwt.sourceforge.net"
depends=('mingw-w64-qt5-svg')
makedepends=('mingw-w64-gcc')
options=('staticlibs' '!strip' '!buildflags')
source=("http://downloads.sourceforge.net/qwt/qwt-${pkgver}.tar.bz2")
sha256sums=('1529215329e51fc562e0009505a838f427919a18b362afff441f035b2d9b5bd9')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  for _arch in ${_architectures}; do
    export QTDIR=/usr/${_arch}/lib/qt
    export PATH=${QTDIR}/bin:${PATH}
    mkdir -p "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
    cd "${srcdir}"
    cp -r "qwt-${pkgver}/" "${pkgname}-${pkgver}-build-${_arch}"
    cd "${srcdir}/${pkgname}-${pkgver}-build-${_arch}/qwt-${pkgver}"
    

    # Build release only
    sed -i 's|+= debug_and_release|+= release|' qwtbuild.pri
    sed -i '/+= build_all/d' qwtbuild.pri

    # No designer plugin:
    sed -i 's|+= QwtDesigner|-= QwtDesigner|' qwtconfig.pri

    # This is a mingw build, so Windows prefix is used. Let's change it:
    sed -i "s|C:/Qwt-\$\$QWT_VERSION|/usr/${_arch}|" qwtconfig.pri

    # Make install locations consistent with Arch's native Qwt:
    sed -i 's|$${QWT_INSTALL_PREFIX}/doc|$${QWT_INSTALL_PREFIX}/share/doc/qwt|' qwtconfig.pri
    sed -i 's|$${QWT_INSTALL_PREFIX}/include|$${QWT_INSTALL_PREFIX}/include/qwt|' qwtconfig.pri

    # No need for docs:
    sed -i "s|= target doc|= target|" src/src.pro

    ${QTDIR}/bin/qmake qwt.pro

    make
  done

}

package() {

  for _target in ${_architectures}; do

    cd "${srcdir}/${pkgname}-${pkgver}-build-${_target}/qwt-${pkgver}"

    make INSTALL_ROOT=${pkgdir} QTDIR=/usr/${_target}/ install

    cd "${pkgdir}/usr/${_target}"

    # Move DLLs from lib to bin
    mkdir -p bin
    mv lib/*.dll bin/
    ${_target}-strip --strip-unneeded "$pkgdir"/usr/${_target}/bin/*.dll
    ${_target}-strip -g "$pkgdir"/usr/${_target}/lib/*.a
    # Move features to share/qt/mkspecs
    rm -rf "$pkgdir"/usr/${_target}/share
    mkdir -p lib/qt/mkspecs
    mv features lib/qt/mkspecs
  done
}
