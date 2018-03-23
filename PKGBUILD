# Maintainer:  Gabriel Souza Franco <Z2FicmllbGZyYW5jb3NvdXphQGdtYWlsLmNvbQ==>
# Contributor: Florian Pritz <bluewind@xinu.at>
# Contributor: Giuseppe Borzi <gborzi@ieee.org>
# Contributor: Brice Méalier <mealier_brice@yahoo.fr>
# Contributor: Michele Mocciola <mickele>
pkgname=opencascade
pkgver=6.9.1
pkgrel=8
pkgdesc="Open CASCADE Technology, 3D modeling & numerical simulation"
arch=('i686' 'x86_64')
url="http://www.opencascade.org"
license=('custom')
depends=('tk' 'mesa' 'libxmu' 'ftgl' 'vtk6')
source=("https://sources.archlinux.org/other/community/opencascade/opencascade-$pkgver.tgz"
        'env.sh' 'opencascade.sh' 'opencascade.conf' 'salome-occt-6.9.1.patch'
        'configuration-problem-glibc-2.26.patch')
md5sums=('7f2e645b5010d190c9bb35dc457f9a7c'
         'a96f28ee7f4273ae1771ee033a2a3af3'
         'd9368b8d348ced3ec4462012977552d2'
         '2924ecf57c95d25888f51071fdc72ad0'
         '88db8e6b9afa132d1893bbb814250350'
         '7087ef8f82913a73abf5e3bc81a186d4')

# This works around a bug that is corrected in OCCT 7.0.0
export CCFLAGS+=" -O2 -fno-delete-null-pointer-checks"
export CXXFLAGS+=" -O2 -fno-delete-null-pointer-checks"

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  # fix build with vtk 6.3.0
  sed -i '/CSF_VTK_LIB/s/-6\.1//g' configure.ac

  # fix for automake 1.13
  sed -i -e 's/AM_CONFIG_HEADER/AC_CONFIG_HEADERS/' configure.ac

  # Included in OCCT 7.0.0
  patch -i "$srcdir/salome-occt-6.9.1.patch" -p1

  # Included in OCCT 7.2.0
  patch -i "$srcdir/configuration-problem-glibc-2.26.patch" -p1

  ./build_configure
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # fix build with vtk 6.3.0
  CXXFLAGS+=' -DvtkFloatingPointType=double'

  # Change to --enable-production with OCCT 7.0.0
  ./configure --disable-debug --disable-production \
    --with-vtk-library=/opt/vtk6/lib/ --with-vtk-include=/opt/vtk6/include/vtk/ \
    --prefix=/opt/$pkgname
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # no DESTDIR support so use prefix. This has to suffix match the prefix in ./configure
  make prefix="$pkgdir/opt/$pkgname" install
  cp -r src/UnitsAPI/ "${pkgdir}/opt/$pkgname/src"
  install -D -m644 "${srcdir}/opencascade.conf" "${pkgdir}/etc/ld.so.conf.d/opencascade.conf"
  install -D -m 755 "${srcdir}/opencascade.sh" "${pkgdir}/etc/profile.d/opencascade.sh"
  install -m 755 "${srcdir}/env.sh" "${pkgdir}/opt/$pkgname"
  install -dm755 "$pkgdir/usr/share/licenses/$pkgname/"
  install -m644 LICENSE_LGPL_21.txt OCCT_LGPL_EXCEPTION.txt "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set ts=2 sw=2 et:
