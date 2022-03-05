# Maintainer: loathingkernel <loathingkernel @at gmail .dot com>

pkgname=dxvk-mingw
pkgver=1.10
_asyncver=1.10
pkgrel=1
pkgdesc='Vulkan-based implementation of D3D9, D3D10 and D3D11 for Linux / Wine, MingW version'
arch=('x86_64')
url="https://github.com/doitsujin/dxvk"
license=('zlib/libpng')
depends=('vulkan-icd-loader' 'lib32-vulkan-icd-loader' 'bash')
makedepends=('ninja' 'meson>=0.43' 'glslang' 'git' 'mingw-w64-gcc')
provides=('dxvk' 'd9vk' "dxvk=$pkgver")
conflicts=('dxvk' 'd9vk')
options=(!lto !staticlibs)
source=(
    "git+https://github.com/doitsujin/dxvk.git#tag=v$pkgver"
    "dxvk-async-${_asyncver}.patch::https://raw.githubusercontent.com/Sporif/dxvk-async/${_asyncver}/dxvk-async.patch"
    "dxvk-async-conf.patch"
    "dxvk-extraopts.patch"
    "setup_dxvk"
)

prepare() {
    cd dxvk

    # Uncomment to enable dxvk async patch.
    # Enable at your own risk. If you don't know what it is,
    # and its implications, leave it as is. You have been warned.
    # I am not liable if anything happens to you by using it.
    #patch -p1 -i "$srcdir"/dxvk-async-${_asyncver}.patch
    #patch -p1 -i "$srcdir"/dxvk-async-conf.patch

    # Filter known bad flags before applying optimizations
    # Filter fstack-protector{ ,-all,-strong} flag for MingW.
    # https://github.com/Joshua-Ashton/d9vk/issues/476
    CFLAGS="${CFLAGS// -fstack-protector*([\-all|\-strong])/}"
    CXXFLAGS="${CXXFLAGS// -fstack-protector*([\-all|\-strong])/}"
    # Doesn't compile with these flags in MingW so remove them.
    # They are also filtered in Wine PKGBUILDs so remove them
    # for winelib versions too.
    CFLAGS="${CFLAGS/ -fno-plt/}"
    CXXFLAGS="${CXXFLAGS/ -fno-plt/}"
    LDFLAGS="${LDFLAGS/,-z,now/}"
    LDFLAGS="${LDFLAGS/,-z,relro/}"

    # By default export FLAGS used by proton and ignore makepkg
    # This overrides FLAGS from makepkg.conf, if you comment these you are on your own
    # If you want the "best" possible optimizations for your system you can use
    # `-march=native` and remove the `-mtune=core-avx2` option.
    # `-O2` is adjusted to `-O3` since AVX is disabled
    export CFLAGS="-O3 -march=nocona -mtune=core-avx2 -pipe"
    export CXXFLAGS="-O3 -march=nocona -mtune=core-avx2 -pipe"
    export LDFLAGS="-Wl,-O1,--sort-common,--as-needed"

    # Uncomment to enable extra optimizations
    # Patch crossfiles with extra optimizations from makepkg.conf
    patch -p1 -i "$srcdir"/dxvk-extraopts.patch
    local cross_cflags="$CFLAGS"
    local cross_cxxflags="$CXXFLAGS"
    local cross_ldflags="$LDFLAGS"

    # If using -march=native and the CPU supports AVX, launching a d3d9
    # game can cause an Unhandled exception. The cause seems to be the
    # combination of AVX instructions and tree vectorization (implied by O3),
    # all tested archictures from sandybridge to haswell are affected.
    # Disabling AVX (and AVX2 as a side-effect).
    # Since Wine 5.16 AVX is supported. Testing showed 32bit applications
    # crashing with AVX regardless, but 64bit applications worked just fine.
    # So disable AVX only for the 32bit binaries and AVX2 for the 64bit.
    # AVX2 seems to degrade performance. So disregard the above.
    # Relevant Wine issues
    # https://bugs.winehq.org/show_bug.cgi?id=45289
    # https://bugs.winehq.org/show_bug.cgi?id=43516
    cross_cflags+=" -mno-avx2"
    cross_cxxflags+=" -mno-avx2"

    # These flags are taken from Proton, I don't know if there are issues with Arch wine.
    cross_cflags+=" -mfpmath=sse -fwrapv -fno-strict-aliasing -gdwarf-2 -gstrict-dwarf"
    cross_cxxflags+=" -mfpmath=sse -fwrapv -fno-strict-aliasing -gdwarf-2 -gstrict-dwarf -std=c++17"
    cross_ldflags+=" -Wl,--file-alignment,4096"

    sed -i build-win64.txt \
        -e "s|@CARGS@|\'${cross_cflags// /\',\'}\'|g" \
        -e "s|@CXXARGS@|\'${cross_cxxflags// /\',\'}\'|g" \
        -e "s|@LDARGS@|\'${cross_ldflags// /\',\'}\'|g"

    cross_cflags+=" -mstackrealign -mno-avx"
    cross_cxxflags+=" -mstackrealign -mno-avx"
    sed -i build-win32.txt \
        -e "s|@CARGS@|\'${cross_cflags// /\',\'}\'|g" \
        -e "s|@CXXARGS@|\'${cross_cxxflags// /\',\'}\'|g" \
        -e "s|@LDARGS@|\'${cross_ldflags// /\',\'}\'|g"
}

build() {
    meson dxvk "build/x64" \
        --cross-file dxvk/build-win64.txt \
        --prefix "/usr/share/dxvk/x64" \
        --bindir "" --libdir "" \
        --buildtype "plain" \
        --strip \
        -Denable_tests=false
    ninja -C "build/x64" -v

    meson dxvk "build/x32" \
        --cross-file dxvk/build-win32.txt \
        --prefix "/usr/share/dxvk/x32" \
        --bindir "" --libdir "" \
        --buildtype "plain" \
        --strip \
        -Denable_tests=false
    ninja -C "build/x32" -v
}

package() {
    DESTDIR="$pkgdir" ninja -C "build/x32" install
    DESTDIR="$pkgdir" ninja -C "build/x64" install
    install -Dm 755 -t "$pkgdir/usr/share/dxvk" dxvk/setup_dxvk.sh
    install -Dm 644 -t "$pkgdir/usr/share/doc/dxvk" dxvk/dxvk.conf
    install -Dm 644 -t "$pkgdir/usr/share/$pkgname" dxvk/LICENSE
    install -Dm 755 -t "$pkgdir/usr/bin" setup_dxvk
}

sha256sums=('SKIP'
            'e6f042cdfd1d20d3bad0e5732696d453efde0502beacc3788e2af3568eeacd68'
            'c9c2f02bce1e1e93d511aff73484208456835d4d7601a36ab4524939472fc401'
            'bcc15521e4c7f966a0192a1dabb7fb4935b33db39344ab5b861f9d81486f1362'
            'b2413cabd8cca56e2d308ef5513edf1c7f909036ed2ccfeae17536a0e864dc96')
