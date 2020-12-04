# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgbase=libjpeg-xl
pkgname=('libjpeg-xl' 'libjpeg-xl-doc')
pkgver=0.1
pkgrel=1
pkgdesc='JPEG XL image format reference implementation'
arch=('x86_64')
url='https://jpeg.org/jpegxl/'
license=('Apache')
makedepends=('git' 'cmake' 'clang' 'gdk-pixbuf2' 'giflib' 'gimp' 'gperftools'
             'libjpeg-turbo' 'libpng' 'openexr' 'zlib' 'libgl' 'freeglut'
             'gtest' 'python' 'doxygen' 'graphviz')
source=("git+https://gitlab.com/wg1/jpeg-xl.git#tag=v${pkgver}"
        'git+https://github.com/google/brotli.git'
        'git+https://github.com/lvandeve/lodepng.git'
        'git+https://github.com/mm2/Little-CMS.git'
        'git+https://github.com/google/googletest'
        'git+https://github.com/google/brunsli.git'
        'git+https://github.com/webmproject/sjpeg.git'
        'git+https://skia.googlesource.com/skcms.git'
        'git+https://github.com/veluca93/IQA-optimization.git'
        'git+https://github.com/Netflix/vmaf.git'
        'git+https://github.com/thorfdbg/difftest_ng.git'
        'git+https://github.com/google/highway.git'
        '010-libjpeg-xl-fix-highway-build.patch')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'f783be03afe7094e21281097da0c727a83317dad118f15d36691f7f14163efa5')

prepare() {
    git -C jpeg-xl submodule init
    git -C jpeg-xl config --local submodule.third_party/brotli.url "${srcdir}/brotli"
    git -C jpeg-xl config --local submodule.third_party/lodepng.url "${srcdir}/lodepng"
    git -C jpeg-xl config --local submodule.third_party/lcms.url "${srcdir}/Little-CMS"
    git -C jpeg-xl config --local submodule.third_party/googletest.url "${srcdir}/googletest"
    git -C jpeg-xl config --local submodule.third_party/brunsli.url "${srcdir}/brunsli"
    git -C jpeg-xl config --local submodule.third_party/sjpeg.url "${srcdir}/sjpeg"
    git -C jpeg-xl config --local submodule.third_party/skcms.url "${srcdir}/skcms"
    git -C jpeg-xl config --local submodule.third_party/mingw-std-threads.url "${srcdir}/mingw-std-threads"
    git -C jpeg-xl config --local submodule.third_party/IQA-optimization.url "${srcdir}/IQA-optimization"
    git -C jpeg-xl config --local submodule.third_party/vmaf.url "${srcdir}/vmaf"
    git -C jpeg-xl config --local submodule.third_party/difftest_ng.url "${srcdir}/difftest_ng"
    git -C jpeg-xl config --local submodule.third_party/highway.url "${srcdir}/highway"
    git -C jpeg-xl submodule update
    patch -d jpeg-xl -Np1 -i "${srcdir}/010-libjpeg-xl-fix-highway-build.patch"
}

build() {
    export CC='clang'
    export CXX='clang++'
    cmake -B build -S jpeg-xl \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DJPEGXL_ENABLE_BENCHMARK:BOOL='false' \
        -DJPEGXL_ENABLE_FUZZERS:BOOL='false' \
        -DJPEGXL_ENABLE_PLUGINS:BOOL='true' \
        -DJPEGXL_ENABLE_VIEWERS:BOOL='false' \
        -DJPEGXL_WARNINGS_AS_ERRORS:BOOL='false' \
        -DGTEST_LIBRARY:FILEPATH='/usr/lib/libgtest.so' \
        -DGTEST_MAIN_LIBRARY:FILEPATH='/usr/lib/libgtest_main.so' \
        -Wno-dev
    make -C build all doc
}

check() {
    make -C build test
}

package_libjpeg-xl() {
    depends=('gcc-libs')
    optdepends=('gdk-pixbuf2: for gdk-pixbuf plugin'
                'giflib: for CLI tools'
                'gimp: for gimp plugin'
                'gperftools: for CLI tools and gdk-pixbuf/gimp plugins'
                'libjpeg-turbo: for CLI tools'
                'libpng: for CLI tools'
                'openexr: for CLI tools')
    
    make -C build DESTDIR="$pkgdir" install
    install -D -m644 jpeg-xl/plugins/mime/image-jxl.xml -t "${pkgdir}/usr/share/mime/packages"
    rm "${pkgdir}/usr/lib/"{libhwy.a,pkgconfig/libhwy{,-test}.pc}
    rm -r "${pkgdir}/usr/include/hwy"
}

package_libjpeg-xl-doc() {
    pkgdesc+=' (documentation)'
    arch=('any')
    
    mkdir -p "${pkgdir}/usr/share/doc"
    cp -a build/html "${pkgdir}/usr/share/doc/libjpeg-xl"
}
