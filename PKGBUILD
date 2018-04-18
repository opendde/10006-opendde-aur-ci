# Maintainer: Andreas Bilke <abilke at cosy dot sbg dot ac dot at>
# Contributor: Myles English <myles at rockhead dot biz>
# Contributor: Lucas H. Gabrielli <heitzmann at gmail dot com>
pkgname=petsc
pkgver=3.9.0
pkgrel=1
_config=linux-c-opt
# if --with-debugging=yes is set then PETSC_ARCH is automatically set to
#"linux-c-debug" for some things, so the _config should be changed too
#_config=linux-c-debug
pkgdesc="Portable, extensible toolkit for scientific computation"
arch=('i686' 'x86_64')
url="https://www.mcs.anl.gov/petsc/"
license=('BSD')
options=(staticlibs)
depends=('python2' 'openmpi' 'boost' 'lapack')
makedepends=('gcc' 'gcc-fortran' 'cmake')
optdepends=('trilinos: support for trilinos'
		'ptscotch: support for ptscotch parallel graph partitioning library'
		'parmetis: support for parmetis parallel graph partitioning library'
		'metis:		 support for metis graph partitioning library'
		'pastix:	 support for the pastix solver'
		'superlu:  support for the superlu sparse solver'
		'hdf5:		 support for the parallel version of hdf5'
		'mumps:		 support for the mumps sparse solver'
		'fftw:		 support for the fftw fast Fourier transform'
		)
install=petsc.install
source=(http://ftp.mcs.anl.gov/pub/petsc/release-snapshots/${pkgname}-${pkgver/_/-}.tar.gz
				test_optdepends.sh)
sha256sums=('dcbcab1f321667be1c6e5f8e7b4ee8670bb09e372e51f1ea6471464519d54b2d'
						'c7b0d839c43bbae0405b8b007588debcd0da526e9a999c5933278d347a0900e2')


_install_dir=/opt/petsc/${_config}
_petsc_arch="arch-${_config}"

# to avoid: "make[2]: *** No rule to make target `libptesmumps.a', needed by `main_esmumps'.	Stop."
export MAKEFLAGS="-j1"

prepare() {
	_build_dir="${srcdir}/${pkgname}-${pkgver/_/-}"

	# force using python2
	find ${srcdir} -name "*" -type f -exec \
	sed -i 's#\(/usr/bin/env \|/usr/bin/\)python[2-3]*#\1python2#' {} \;

	# install external libraries in _build_dir instead of the prefix
	sed -i 's/self.publicInstall		= 1/self.publicInstall		= 0/' ${_build_dir}/config/BuildSystem/config/package.py
}

build() {
	_build_dir="${srcdir}/${pkgname}-${pkgver/_/-}"

	cd ${_build_dir}

	unset PETSC_ARCH
	export PETSC_DIR=${_build_dir}

	CONFOPTS="--with-shared-libraries=1 --COPTFLAGS=-O3 --CXXOPTFLAGS=-O3"

	# test for the optional dependencies for petsc
	CONFOPTS="${CONFOPTS} $(sh ${srcdir}/test_optdepends.sh)"

	# to enable use of type()
	#CONFOPTS="${CONFOPTS} --with-fortran-datatypes --FOPTFLAGS=-O2"

	echo ${CONFOPTS}
	python2 ./configure \
		--prefix=${_install_dir} \
		--PETSC_ARCH=${_petsc_arch} \
		${CONFOPTS}

	make ${MAKEFLAGS} PETSC_DIR=${_build_dir} PETSC_ARCH=${_petsc_arch} all
}

check() {
	_build_dir="${srcdir}/${pkgname}-${pkgver/_/-}"
	cd ${_build_dir}

		make test
}

package() {
	_build_dir="${srcdir}/${pkgname}-${pkgver/_/-}"
	#_dest_dir="${pkgdir}${_install_dir}"

	cd ${_build_dir}
	echo "make ${MAKEFLAGS} PETSC_DIR=${_build_dir} DESTDIR=${pkgdir} install"
	export PETSC_DIR=${_build_dir}
	make ${MAKEFLAGS} PETSC_DIR=${_build_dir} DESTDIR=${pkgdir} install	 # > /dev/null

	export PETSC_DIR=${_install_dir}

	# Note: the hyperlinks between documentation, tutorials and examples are
	# not perfect yet

	# documentation
	mkdir -p ${pkgdir}/usr/share/doc/$pkgname/
	cp -r ${_build_dir}/docs ${pkgdir}/usr/share/doc/$pkgname/

	# tutorials
	#cp -r ${_build_dir}/tutorials ${pkgdir}/usr/share/doc/$pkgname/

	# src for tutorials
	cp -r ${_build_dir}/src ${pkgdir}/usr/share/doc/$pkgname/

	# html versions of header files
	mkdir -p ${pkgdir}/usr/share/doc/$pkgname/include
	cp -r ${_build_dir}/include/*.html ${pkgdir}/usr/share/doc/$pkgname/include/

	# install licence (even though there is no such word as licenses)
	mkdir -p ${pkgdir}/usr/share/licenses/petsc
	cp ${_build_dir}/docs/copyright.html ${pkgdir}/usr/share/licenses/$pkgname/

	mkdir -p ${pkgdir}/etc/profile.d
	echo "export PETSC_DIR=${_install_dir}" > ${pkgdir}/etc/profile.d/petsc.sh
	chmod +x ${pkgdir}/etc/profile.d/petsc.sh

	# show where the shared libraries are
	install -d -m755 "${pkgdir}"/etc/ld.so.conf.d/
	echo "${_install_dir}/lib" > "${pkgdir}"/etc/ld.so.conf.d/petsc.conf
}
