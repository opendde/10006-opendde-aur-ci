# Maintainer Torsten Keßler <t dot kessler at posteo dot de>

pkgname=rocsolver
pkgver=5.3.0
pkgrel=1
pkgdesc='Subset of LAPACK functionality on the ROCm platform'
arch=('x86_64')
url='https://rocsolver.readthedocs.io/en/latest/'
license=('BSD 2-Clause')
depends=('hip' 'rocblas')
makedepends=('rocm-cmake' 'python-pyaml')
_git='https://github.com/ROCmSoftwarePlatform/rocSOLVER'
source=("$pkgname-$pkgver.tar.gz::$_git/archive/rocm-$pkgver.tar.gz"
        "$pkgname-$pkgver-fmt.tar.gz::https://github.com/fmtlib/fmt/archive/refs/tags/9.1.0.tar.gz"
        "hip-fmt.patch::https://github.com/fmtlib/fmt/commit/0b0f7cfbfcebd021c910078003d413354bd843e2.patch")
sha256sums=('4569f860d240d50e94e77d498050f5cafe5ad11daddaead3e7e9eaa1957878a7'
            '5dea48d1fcddc3ec571ce2058e13910a0d4a6bab4cc09a809d8b1dd1c88ae6f2'
            'SKIP')
options=(!lto)
_dirname="$(basename "$_git")-$(basename "${source[0]}" .tar.gz)"
_fmtname="fmt-$(basename "${source[1]}" .tar.gz)"

prepare() {
    cd "$_fmtname"
    patch -Np1 -i "$srcdir/hip-fmt.patch"
}

build() {
    # fmt as of version 9.1.0 does not work with HIP, see
    # https://github.com/fmtlib/fmt/issues/3005
    # To fix this we need to apply a workaround from a later commit
    # https://github.com/fmtlib/fmt/commit/0b0f7cfbfcebd021c910078003d413354bd843e2
    # Thus we need to locally build fmt from source with the patch applied.
    # rocsolver supports a header-only build with fmt so it is not a runtime dependency.
    cmake \
      -Wno-dev \
      -B fmt-build \
      -S "$_fmtname" \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DFMT_DOC=OFF \
      -DFMT_TEST=OFF
    cmake --build fmt-build
    DESTDIR="$srcdir/fmt-local" cmake --install fmt-build

    # -fcf-protection is not supported by HIP, see
    # https://docs.amd.com/bundle/ROCm-Compiler-Reference-Guide-v5.3/page/Appendix_A.html
    CXXFLAGS="${CXXFLAGS} -fcf-protection=none" \
    cmake \
      -Wno-dev \
      -B build \
      -S "$_dirname" \
      -DCMAKE_CXX_COMPILER=/opt/rocm/bin/hipcc \
      -DCMAKE_PREFIX_PATH="$srcdir/fmt-local/usr/lib/cmake/fmt" \
      -DCMAKE_INSTALL_PREFIX=/opt/rocm \
      -DROCSOLVER_EMBED_FMT=ON
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build

    echo "/opt/rocm/$pkgname/lib" > "$pkgname.conf"
    install -Dm644 "$pkgname.conf" "$pkgdir/etc/ld.so.conf.d/$pkgname.conf"

    install -Dm644 "$_dirname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
