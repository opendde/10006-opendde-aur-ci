# Maintainer: bartus <aur@bartus.33mail.com>

_pkgname="mitsuba"
pkgname="${_pkgname}-git"
pkgver=v0.5.0.r160.g87efb7d
pkgrel=1
pkgdesc="Mitsuba physically based renderer."
url="http://mitsuba-renderer.org/"
license=("GPL3")
arch=("i686" "x86_64")
depends=("python" "xerces-c" "glew-1.13.0" "openexr" "libpng" "libjpeg" "qt4" "fftw" "collada-dom-mitsuba" "boost" "pcre")
makedepends=("gcc5" "eigen" "scons" "git")
provides=("mitsuba")
conflicts=("mitsuba" "mitsuba-hg")
source=("${_pkgname}::git+https://www.mitsuba-renderer.org/repos/mitsuba.git"
        "python3.5.patch")
sha256sums=('SKIP'
            '7f25d33a750466d41d24c2a9b1e0b4a679c5a4345e993f98bf9de04efde1b9e1')


pkgver() {
  cd ${_pkgname}
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}


prepare() {
    export _py3ver=`python3 --version | grep -oP '(?<= )\d\.\d'`
    cd "${_pkgname}"
    cp build/config-linux-gcc.py config.py
    ## use gcc5 as gcc6 is not supported at this time
    sed -i -e "s:g++:g++-5:g" -e "s:gcc:gcc-5:g" config.py
    ## use collada-dom-mitsuba
    sed -i -e "s:collada-dom:collada-dom-mitsuba:g" config.py
    ## use collada-dom instead of collada-dom-mitsube currrently not working (can't figure why)
    #sed -i -e "s:collada-dom:collada-dom2.4:g" -e "s:collada14dom:collada-dom2.4-dp:g" config.py
    ## update GLINCLUDE path to refere to glew-1.13.0 as mitsuba wont build with glew 2.0.0
    sed -i "/XERCESLIB/aGLINCLUDE      = ['/usr/include/glew-1.13.0']" config.py
    patch -Np1 -i ${srcdir}/python3.5.patch 
}

build() {
    cd "${_pkgname}"
    scons --jobs=$[${MAKEFLAGS/-j/} - 1]
    
}

package() {
    cd "${_pkgname}"
    	install -d \
		${pkgdir}/usr/bin \
		${pkgdir}/usr/lib \
		${pkgdir}/usr/share/mitsuba/plugins \
		${pkgdir}/usr/share/mitsuba/data/schema \
		${pkgdir}/usr/share/mitsuba/data/ior \
		${pkgdir}/usr/share/mitsuba/data/microfacet \
		${pkgdir}/usr/share/applications \
		${pkgdir}/usr/share/pixmaps \
		${pkgdir}/usr/include/mitsuba/{core,hw,render,bidir} \
		${pkgdir}/usr/lib/python2.7/lib-dynload \
		${pkgdir}/usr/lib/python${_py3ver}/lib-dynload

	install -m755 dist/mitsuba dist/mtsgui dist/mtssrv dist/mtsutil ${pkgdir}/usr/bin
	install -m755 dist/libmitsuba-core.so \
		dist/libmitsuba-hw.so \
		dist/libmitsuba-render.so \
		dist/libmitsuba-bidir.so \
		${pkgdir}/usr/lib
	install -m755 dist/plugins/* ${pkgdir}/usr/share/mitsuba/plugins
	install -m644 dist/data/schema/* ${pkgdir}/usr/share/mitsuba/data/schema
	install -m644 dist/data/ior/* ${pkgdir}/usr/share/mitsuba/data/ior
	install -m644 dist/data/microfacet/* ${pkgdir}/usr/share/mitsuba/data/microfacet
	install -m644 dist/python/2.7/mitsuba.so ${pkgdir}/usr/lib/python2.7/lib-dynload
        install -m644 dist/python/${_py3ver}/mitsuba.so ${pkgdir}/usr/lib/python${_py3ver}/lib-dynload
	install -m644 data/linux/mitsuba.desktop ${pkgdir}/usr/share/applications
	install -m644 src/mtsgui/resources/mitsuba48.png ${pkgdir}/usr/share/pixmaps
	install -m644 include/mitsuba/*.h ${pkgdir}/usr/include/mitsuba
	install -m644 include/mitsuba/core/* ${pkgdir}/usr/include/mitsuba/core
	install -m644 include/mitsuba/render/* ${pkgdir}/usr/include/mitsuba/render
	install -m644 include/mitsuba/hw/* ${pkgdir}/usr/include/mitsuba/hw
	install -m644 include/mitsuba/bidir/* ${pkgdir}/usr/include/mitsuba/bidir
}
