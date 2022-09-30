# Maintainer:
pkgname=eprosima-fast-dds-statistics-backend
pkgver=0.7.1
pkgrel=1
pkgdesc='eProsima Fast DDS Statistics Backend is a C++ library that provides collection and procession the statistics measurements reported by Fast DDS Statistics Module.'
arch=('x86_64')
url='https://github.com/eProsima/Fast-DDS-statistics-backend'
license=('Apache')
makedepends=('ninja' 'cmake')
depends=('tinyxml' 'asio')  # for documentation add: 'doxygen' 'python' 'python-pip' 'python-virtualenv' 'python-sphinx' 'python-breathe' 'python-sphinxcontrib-spelling' 'python-doc8' 'imagemagick'
provides=('eprosima-fast-dds-statistics-backend')

_build_directory=build
_install_directory=/usr

source=(
	"https://github.com/eProsima/Fast-DDS-statistics-backend/archive/refs/tags/v${pkgver}.tar.gz"
)

sha512sums=(
	"94ea0fba5840a39d25490631049a8243ae00f92ecdd052c0897348ee003c58455c3aa7fc6e118f056db00e06a65588c577dcc59bf7ab9f5e0d1542c8257eb338"
)

prepare() {
	build_type=Release

	cmake -G Ninja \
		-S "${srcdir}"/Fast-DDS-statistics-backend-${pkgver} \
		-B "${srcdir}"/${_build_directory} \
		-DCMAKE_BUILD_TYPE=${build_type} \
		-DCMAKE_CONFIGURATION_TYPES:STRING=${build_type} \
		-DCMAKE_INSTALL_PREFIX:PATH=${_install_directory} \
		-DBUILD_SHARED_LIBS=ON \
		-DCOMPILE_EXAMPLES=OFF \
		-DBUILD_TESTS=OFF \
		-DBUILD_LIBRARY_TESTS=ON \
		-DBUILD_DOCUMENTATION=OFF
}

build() {
	cd "${srcdir}"/${_build_directory}
	ninja
}

package() {
	cd "${srcdir}"/${_build_directory}
	DESTDIR="${pkgdir}" ninja install

	mkdir -p "${pkgdir}"/usr/share/licenses/eprosima/fastdds_statistics_backend
	mv "${pkgdir}"/usr/share/fastdds_statistics_backend/LICENSE "${pkgdir}"/usr/share/licenses/eprosima/fastdds_statistics_backend/LICENSE
	rmdir "${pkgdir}"/usr/share/fastdds_statistics_backend
}
