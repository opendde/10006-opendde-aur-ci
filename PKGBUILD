# Maintainer: gborzi <gborzi@ieee.org>
# Contributor: mickele <mimocciola@yahoo.com>
pkgname=gmsh
pkgver=2.13.2
pkgrel=1
pkgdesc="An automatic 3D finite element mesh generator with pre and post-processing facilities."
arch=('i686' 'x86_64')
url="http://www.geuz.org/gmsh/"
license=('custom')
depends=('fltk' 'lapack' 'med' 'opencascade' 'cairo')
makedepends=('cmake' 'desktop-file-utils' 'sed' 'swig')
optdepends=('gmsh-docs: docs for gmsh'
            'python2: for onelab.py'
            'python: for onelab.py')
options=(!emptydirs)
source=("${url}src/${pkgname}-${pkgver}-source.tgz" gmsh.desktop gmsh.completion)
md5sums=('94bdf9fc03a842690ad5f251dc965fd9'
         'e63dc24ba025741fc1a82633b475e4a8'
         '9ee4b5bf27956de5aa412bbc939660d3')

build() {
   cd "${srcdir}/${pkgname}-${pkgver}-source"

   # Help links to local doc (package gmsh-docs)
   sed -e "s|http://gmsh.info/doc/texinfo/|file:///usr/share/doc/gmsh/gmsh.html|" \
       -i Fltk/graphicWindow.cpp
   sed -e "s|http://gmsh.info/doc/|file:///usr/share/licenses/gmsh/|" \
       -i Fltk/helpWindow.cpp

   mkdir -p build

   cd build

   cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr -DENABLE_BUILD_SHARED=ON \
      -DENABLE_PETSC=FALSE .. 

   make
}

package() {

   cd "${srcdir}/${pkgname}-${pkgver}-source/build"
   make DESTDIR=${pkgdir} install
   install -D -m644 "${pkgdir}/usr/bin/onelab.py" "${pkgdir}/usr/lib/python2.7/site-packages/onelab.py"
   install -D -m644 "${pkgdir}/usr/bin/onelab.py" "${pkgdir}/usr/lib/python3.5/site-packages/onelab.py"
   rm "${pkgdir}/usr/bin/onelab.py"

   install -D -m644 "${srcdir}/${pkgname}-${pkgver}-source/utils/icons/solid_128x128.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

   desktop-file-install --dir="${pkgdir}/usr/share/applications" \
    	"${srcdir}/${pkgname}.desktop"

   install -D -m 644 "${srcdir}/${pkgname}-${pkgver}-source/doc/LICENSE.txt" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE.txt"
   install -D -m 644 "${srcdir}/${pkgname}-${pkgver}-source/doc/CREDITS.txt" "${pkgdir}/usr/share/licenses/$pkgname/CREDITS.txt"
   install -D -m644 $srcdir/gmsh.completion $pkgdir/etc/bash_completion.d/gmsh

   rm -rf ${pkgdir}/usr/share/doc
}
