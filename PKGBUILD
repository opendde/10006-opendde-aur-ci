# Maintainer: Torsten Keßler <t dot kessler at posteo dot de>
pkgname=rocm-hip-sdk
pkgver=4.5.0
pkgrel=1
pkgdesc="Develop applications using HIP and libraries for AMD platforms"
arch=('x86_64')
url="https://rocm-documentation.readthedocs.io/en/latest/"
license=()
depends=('rocm-core' 'rocm-hip-runtime' 'rocm-hip-libraries'
        'hipcub' 'rocfft' 'rocrand' 'hipblas' 'rocsparse' 'rocprim'
        'rccl' 'hipfort' 'rocalution' 'rocthrust' 'hipsparse' 'hipfft')
makedepends=()
source=()
sha256sums=()
_magic_bit=56

package() {
	mkdir -p "${pkgdir}/opt/rocm/.info"
	echo "${pkgver}-${pkgrel}-$_magic_bit" > "${pkgdir}/opt/rocm/.info/version-hip-sdk"
}
