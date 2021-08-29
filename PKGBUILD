# Maintainer Torsten Keßler <t dot kessler at posteo dot de>
pkgname=rocm-dbgapi
pkgver=4.3.1
pkgrel=1
pkgdesc="Support library necessary for a debugger of AMD's GPUs"
arch=('x86_64')
url='https://github.com/ROCm-Developer-Tools/ROCdbgapi'
license=('MIT')
depends=('comgr' 'hsa-rocr')
makedepends=('cmake' 'rocm-cmake' 'git' 'doxygen' 'texlive-latexextra')
source=("$pkgname-$pkgver.tar.gz::$url/archive/rocm-$pkgver.tar.gz"
        'gcc11-limits.patch::https://patch-diff.githubusercontent.com/raw/ROCm-Developer-Tools/ROCdbgapi/pull/2.patch')
sha256sums=('dddf2549ad6bb806f7e5d5a5336f5a00fe87a124f2a778be18ec4dc41f891912'
            'd0482525967dc9b0e6e99ef4052e7810872c285c4768987adfcf71399ff87f8b')
_dirname=$(basename "$url")-$(basename "${source[0]}" ".tar.gz")

prepare() {
    cd "$_dirname"
    patch -Np1 -i "$srcdir/gcc11-limits.patch"
}

build() {
    cmake   -Wno-dev -B build \
            -S "$_dirname" \
            -DCMAKE_INSTALL_PREFIX=/opt/rocm

    make -C build doc all
}

package() {
    DESTDIR="$pkgdir" make -C build install
    install -Dm644 "$srcdir/$_dirname/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
