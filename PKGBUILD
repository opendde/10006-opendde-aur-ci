# Maintainer: Stephan Springer <buzo+arch@Lini.de>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Douglas Soares de Andrade <dsa@aur.archlinux.org>

pkgbase=qscintilla-qt4
pkgname=('qscintilla-qt4' 'python-qscintilla-qt4' 'python2-qscintilla-qt4'
         'python-qscintilla-qt4-common')
pkgver=2.10.8
pkgrel=4
license=('GPL')
arch=('x86_64')
url="http://www.riverbankcomputing.co.uk/software/qscintilla/intro"
makedepends=('qt4' 'python-pyqt4' 'python2-pyqt4')
options=('!buildflags') # Fix Qt Designer plugin
source=("http://downloads.sourceforge.net/pyqt/QScintilla_gpl-${pkgver}.tar.gz")
sha256sums=('46cd5b4e609ca5e13130ba8cc7028d44fd1dc5b037f97c492899006ed0c992eb')

prepare() {
  cp -a QScintilla_gpl-${pkgver}{,-qt4}
}

build() {
    export QMAKEFEATURES=$PWD/Qt4Qt5/features/
    cd "$srcdir"/QScintilla_gpl-${pkgver}-qt4/Qt4Qt5
    qmake-qt4
    make

    cd ../designer-Qt4Qt5
    qmake-qt4 INCLUDEPATH+=../Qt4Qt5 QMAKE_LIBDIR+=../Qt4Qt5
    make

    cd ..
    cp -rf Python Python2
    cd Python
    python configure.py -n ../Qt4Qt5/ -o ../Qt4Qt5/ -c --qmake /usr/bin/qmake-qt4 --no-dist-info
    make

    cd ../Python2
    python2 configure.py -n ../Qt4Qt5/ -o ../Qt4Qt5/ -c --qmake /usr/bin/qmake-qt4 --no-dist-info
    make
}

package_qscintilla-qt4() {
    pkgdesc="A port to Qt4 of Neil Hodgson's Scintilla C++ editor class"
    depends=('qt4')
    replaces=('qscintilla<2.9.1')
    conflicts=('qscintilla<2.9.1')
    provides=("qscintilla=$pkgver")

    cd QScintilla_gpl-${pkgver}-qt4/Qt4Qt5
    make DESTDIR="${pkgdir}" INSTALL_ROOT="${pkgdir}" install

    cd ../designer-Qt4Qt5
    make DESTDIR="${pkgdir}" INSTALL_ROOT="${pkgdir}" install
}

package_python-qscintilla-qt4-common() {
    pkgdesc="Common python qscintilla bindings files shared between python-qscintilla-qt4 and python2-qscintilla-qt4"
    depends=('qscintilla-qt4')
    replaces=('python-qscintilla-common<2.9.1')
    conflicts=('python-qscintilla-common<2.9.1')
    provides=("python-qscintilla-common=$pkgver")

    cd QScintilla_gpl-${pkgver}-qt4/Python
    make DESTDIR="${pkgdir}" INSTALL_ROOT="${pkgdir}" install

    # Provided by python-qscintilla
    rm -r "${pkgdir}"/usr/lib
}

package_python-qscintilla-qt4() {
    pkgdesc="Python 3.x bindings for QScintilla2"
    depends=('python-qscintilla-qt4-common' 'python-pyqt4')
    replaces=('python-qscintilla<2.9.1')
    conflicts=('python-qscintilla<2.9.1')
    provides=("python-qscintilla=$pkgver")

    cd QScintilla_gpl-${pkgver}-qt4/Python
    make DESTDIR="${pkgdir}" INSTALL_ROOT="${pkgdir}" install

    # Provided by python2-qscintilla-common
    rm -r "${pkgdir}"/usr/share
}

package_python2-qscintilla-qt4() {
    pkgdesc="Python 2.x bindings for QScintilla2"
    depends=('python-qscintilla-qt4-common' 'python2-pyqt4')
    replaces=('python2-qscintilla<2.9.1')
    conflicts=('python2-qscintilla<2.9.1')
    provides=("python2-qscintilla=$pkgver")

    cd QScintilla_gpl-${pkgver}-qt4/Python2
    make DESTDIR="${pkgdir}" INSTALL_ROOT="${pkgdir}" install

    # Provided by python2-qscintilla-common
    rm -r "${pkgdir}"/usr/share
}
