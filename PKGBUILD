# Maintainer: peippo <christoph+aur@christophfink.com>

pkgname=python-av
_name=${pkgname#python-}
pkgdesc="Pythonic bindings for FFmpeg"
url="https://docs.mikeboers.com/pyav/"

pkgver=9.0.0
pkgrel=1

arch=("x86_64" "i686")
license=("BSD")

makedepends=(
    "cython"
    "python-google-api-core"
    "python-setuptools"
    "pkgconf"
)
depends=(
    "python"
    "ffmpeg4.4"
)

source=(
    "https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
    "01-build-with-ffmpeg4.4.patch"
)
sha256sums=(
    "785b7434542e24dff32e6d78764ccd998bb1c85a48a602a2b5c8ee0d7676fbd8"
    "46f75e0b9c22409d0935063aca5a7b6d8f22559abcd0691d783e351862f11c25"
)

prepare() {
    cd "${srcdir}"/${_name}-${pkgver}
    patch --forward --strip=1 --input="${srcdir}/01-build-with-ffmpeg4.4.patch"
}

build() {
    cd "${srcdir}"/${_name}-${pkgver}
    python setup.py build_ext --inplace
    python setup.py build
}

# test suite currently fails: https://github.com/PyAV-Org/PyAV/issues/876
# check() {
#     cd "${srcdir}"/${_name}-${pkgver}
#     PYTHONPATH="$PWD/build/lib.linux-$CARCH-${python_version}" python ./setup.py pytest
# }

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/python-av/LICENSE"
}
