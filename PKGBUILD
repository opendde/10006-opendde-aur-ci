# Maintainer : Daniel Bermond < gmail-com: danielbermond >
# Contributor: John Jenkins <twodopeshaggy@gmail.com>

pkgname=flif
pkgver=0.3
pkgrel=6
pkgdesc='Free Lossless Image Format'
arch=('x86_64')
url='https://github.com/FLIF-hub/FLIF/'
license=('LGPL3' 'Apache')
depends=('gcc-libs' 'libpng' 'sdl2')
optdepends=(
    # official repositories:
        'imagemagick: for gif2flif tool'
    # AUR:
        'apng-utils: for apng2flif tool'
)
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/FLIF-hub/FLIF/archive/v${pkgver}.tar.gz"
        'flif-use-build-flags.patch'
        'flif-remove-apt-get-references-from-tools.patch')
sha256sums=('aa02a62974d78f8109cff21ecb6d805f1d23b05b2db7189cfdf1f0d97ff89498'
            'd8cdb93f4f1e63487d65d23c1c96bf79acff1277532cbcfd88ca05932655d871'
            'c516d92d4724e319af79bb1ac5d3dde81dac359fd4a02af1ee71239a49d58710')

prepare() {
    cd "FLIF-${pkgver}"
    
    # use build flags
    patch -Np1 -i "${srcdir}/flif-use-build-flags.patch"
    
    # remove apt-get references from installed tools
    patch -Np1 -i "${srcdir}/flif-remove-apt-get-references-from-tools.patch"
}

build() {
    cd "FLIF-${pkgver}/src"
    
    make all decoder viewflif test-interface
    
}

check() {
    cd "FLIF-${pkgver}/src"
    
    local _image
    local -a _images
    mapfile -t -d '' _images < <(find "${srcdir}/FLIF-${pkgver}/testFiles" -type f -print0)
    
    export LD_LIBRARY_PATH="${srcdir}/FLIF-${pkgver}/src"
    
    for _image in "${_images[@]}"
    do
        printf '%s\n' "  -> Testing with image '${_image##*/}'..."
        ./test-interface "$_image"
    done
}

package() {
    cd "FLIF-${pkgver}/src"
    
    make PREFIX="${pkgdir}/usr" install{,-dev,-decoder,-viewflif}
}
