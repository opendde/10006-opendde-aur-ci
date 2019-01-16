# Maintainer: James Bunton <jamesbunton@delx.net.au>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

# This is intended to track qt5-base, but without the dependency on Linux 4.11's statx.
#
# In Qt 5.12.0 the statx syscall changed to a hard dependency if it is detected
# at compile time. Previously if the running kernel returned ENOSYS Qt would
# use a runtime fall back.
#
# See https://bugreports.qt.io/browse/QTBUG-72484
# and https://bugs.archlinux.org/task/61130

pkgbase=qt5-base-nostatx
_pkgbase=qt5-base
pkgname=(qt5-base-nostatx qt5-xcb-private-headers-nostatx)
_qtver=5.12.0
pkgver=${_qtver/-/}
pkgrel=2
arch=('x86_64')
url='http://qt-project.org/'
license=('GPL3' 'LGPL3' 'FDL' 'custom')
pkgdesc='A cross-platform application and UI framework'
depends=('libjpeg-turbo' 'xcb-util-keysyms' 'xcb-util-renderutil' 'libgl' 'fontconfig' 'xdg-utils'
         'shared-mime-info' 'xcb-util-wm' 'libxrender' 'libxi' 'sqlite' 'xcb-util-image' 'mesa'
         'tslib' 'libinput' 'libxkbcommon-x11' 'libproxy' 'libcups' 'double-conversion')
makedepends=('libfbclient' 'libmariadbclient' 'sqlite' 'unixodbc' 'postgresql-libs' 'alsa-lib' 'gst-plugins-base-libs'
             'gtk3' 'libpulse' 'cups' 'freetds' 'vulkan-headers')
optdepends=('qt5-svg: to use SVG icon themes'
            'postgresql-libs: PostgreSQL driver'
            'libmariadbclient: MariaDB driver'
            'unixodbc: ODBC driver'
            'libfbclient: Firebird/iBase driver'
            'freetds: MS SQL driver'
            'gtk3: GTK platform plugin')
conflicts=('qtchooser')
groups=('qt' 'qt5')
_pkgfqn="${_pkgbase/5-/}-everywhere-src-${_qtver}"
source=("http://download.qt.io/official_releases/qt/${pkgver%.*}/${_qtver}/submodules/${_pkgfqn}.tar.xz"
        qtbug-72844.patch::"https://code.qt.io/cgit/qt/qtbase.git/patch/?id=52e0d9e2")
sha256sums=('5e03221d780e121aabd734896aab8f331e5d8c9d9b54f1eb04907d0818eaeecb'
            'afdea0787e1d8d4c2e7139770761aba4fe8268f50b7f5d715bdd850cc7017996')

prepare() {
  cd ${_pkgfqn}

  # Build qmake using Arch {C,LD}FLAGS
  # This also sets default {C,CXX,LD}FLAGS for projects built using qmake
  sed -i -e "s|^\(QMAKE_CFLAGS_RELEASE.*\)|\1 ${CFLAGS}|" \
    mkspecs/common/gcc-base.conf
  sed -i -e "s|^\(QMAKE_LFLAGS_RELEASE.*\)|\1 ${LDFLAGS}|" \
    mkspecs/common/g++-unix.conf

  patch -p1 -i ../qtbug-72844.patch # Fix drag and drop regression
}

build() {
  cd ${_pkgfqn}

  ./configure -confirm-license -opensource -v \
    -prefix /usr \
    -docdir /usr/share/doc/qt \
    -headerdir /usr/include/qt \
    -archdatadir /usr/lib/qt \
    -datadir /usr/share/qt \
    -sysconfdir /etc/xdg \
    -examplesdir /usr/share/doc/qt/examples \
    -plugin-sql-{psql,mysql,sqlite,odbc,ibase} \
    -system-sqlite \
    -openssl-linked \
    -nomake examples \
    -no-rpath \
    -optimized-qmake \
    -dbus-linked \
    -system-harfbuzz \
    -journald \
    -no-use-gold-linker \
    -reduce-relocations \
    -no-feature-statx
  make
}

package_qt5-base-nostatx() {
  pkgdesc='A cross-platform application and UI framework'
  provides=(qt5-base)
  conflicts=(qt5-base)

  cd ${_pkgfqn}
  make INSTALL_ROOT="${pkgdir}" install

  install -Dm644 LICENSE* -t "$pkgdir"/usr/share/licenses/$_pkgbase

  # Drop QMAKE_PRL_BUILD_DIR because reference the build dir
  find "${pkgdir}/usr/lib" -type f -name '*.prl' \
    -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d' {} \;

  # Fix wrong qmake path in pri file
  sed -i "s|${srcdir}/${_pkgfqn}|/usr|" \
    "${pkgdir}"/usr/lib/qt/mkspecs/modules/qt_lib_bootstrap_private.pri

  # Symlinks for backwards compatibility
  for b in "${pkgdir}"/usr/bin/*; do
    ln -s $(basename $b) "${pkgdir}"/usr/bin/$(basename $b)-qt5
  done
}

package_qt5-xcb-private-headers-nostatx() {
  pkgdesc='Private headers for Qt5 Xcb'

  depends=("qt5-base-nostatx=$pkgver")
  optdepends=()
  groups=()
  provides=(qt5-xcb-private-headers)
  conflicts=(qt5-xcb-private-headers)

  cd ${_pkgfqn}
  install -d -m755 "$pkgdir"/usr/include/qtxcb-private
  cp -r src/plugins/platforms/xcb/*.h "$pkgdir"/usr/include/qtxcb-private/
}
