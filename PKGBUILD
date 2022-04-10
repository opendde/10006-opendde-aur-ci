# Maintainer: Torsten Keßler <t dot kessler at posteo dot de>
# Contributor: JP-Ellis <josh@jpellis.me>

pkgname=rocm-hip-libraries
_pkgver_major=5
_pkgver_minor=1
_pkgver_patch=1
_pkgver_magic=48
pkgver=$_pkgver_major.$_pkgver_minor.$_pkgver_patch
pkgrel=1
pkgdesc="Develop applications using HIP and libraries for AMD platforms"
arch=('x86_64')
url="https://rocm-documentation.readthedocs.io/en/latest/"
license=()
depends=('rocm-core' 'rocm-hip-runtime'
        'rocsparse' 'rccl' 'rocsolver' 'rocrand' 'rocfft' 'rocblas'
        'rocalution' 'hipblas' 'hipfft' 'hipsparse' 'hipfort')
makedepends=()
source=("${pkgname}-${pkgver}.deb::https://repo.radeon.com/rocm/apt/${pkgver}/pool/main/${pkgname:0:1}/${pkgname}/${pkgname}_${pkgver}.${_pkgver_major}$(printf '%02d' $_pkgver_minor $_pkgver_patch)-${_pkgver_magic}_amd64.deb")
sha256sums=('c711e7a72dad3ea7c6a76e3cf903c1a372d0c6248c1b7f6c65ab054055578cc2')


package() {
    tar -xf data.tar.gz
    install -Dm644 opt/rocm-${pkgver}/.info/version-hip-libraries "$pkgdir/opt/rocm/.info/version-hip-libraries"
}
