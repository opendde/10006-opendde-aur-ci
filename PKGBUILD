# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

# To enable the Instrumentation and Tracing Technology API (ittnotify),
# firstly install the package intel-seapi and then build intel-media-sdk-git.
# It will be autodetected by the build system, serving as a makedepend.
# Currently it will not be a mandatory makedepend.

pkgname=intel-media-sdk-git
pkgver=1.2a.r55.g22dae39
pkgrel=1
pkgdesc='API to access hardware-accelerated video decode, encode and filtering on Intel platforms with integrated graphics (git version)'
arch=('x86_64')
url='https://github.com/Intel-Media-SDK/MediaSDK/'
license=('MIT')
depends=(
    # official repositories:
        'libva'
    # AUR:
        'intel-media-driver-git'
)
makedepends=(
    # official repositories:
        'git' 'perl' 'cmake'
    # AUR:
        'git-lfs'
)
provides=('intel-media-sdk' 'libmfx')
conflicts=('intel-media-sdk' 'libmfx')

prepare() {
    # makepkg does not support cloning git-lfs repositories
    if [ -d "$pkgname" ] 
    then
        msg2 "Updating '${pkgname}' git repo..."
        cd "$pkgname"
        git pull origin
    else
        msg2 "Cloning '${pkgname}' git repo..."
        git lfs install
        git clone https://github.com/Intel-Media-SDK/MediaSDK.git "$pkgname"
        cd "$pkgname"
    fi
    
    # change plugins directory
    if ! grep -q '^set(MFX_PLUGINS_DIR[[:space:]]/usr/lib64)$' CMakeLists.txt
    then
        sed -i '20i\\' CMakeLists.txt
        sed -i '21iset(MFX_PLUGINS_DIR /usr/lib64)' CMakeLists.txt
    fi
    
    # fix ittnotify (intel-seapi) detection in the build system
    sed -i '/ITT_LIB/s/\$ENV{ITT_PATH}/$ENV{ITT_PATH}\/lib/' builder/FindVTune.cmake
}

pkgver() {
    cd "$pkgname"
    
    # git, tags available
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//;s/,//'
}

build() {
    cd "$pkgname"
    
    export MFX_HOME="$(pwd)"
    
    export ITT_PATH='/usr'
    
    perl tools/builder/build_mfx.pl \
                            --no-warn-as-error \
                            --cmake='intel64.make.release' \
                            --prefix='/usr'
                            
    make -C __cmake/intel64.make.release
}

package() {
    cd "$pkgname"
    
    make \
        -C __cmake/intel64.make.release \
        DESTDIR="$pkgdir" \
        install
        
    mv -f "${pkgdir}/usr/lib64" "${pkgdir}/usr/lib"
    
    mkdir -p "${pkgdir}/usr/"{include/mfx,lib/"$pkgname"}
    
    # includes (add 'mfx' folder for ffmpeg compatibility)
    cd "${pkgdir}/usr/include"
    for _header in *.h
    do
        cd mfx
        ln -sf ../"$_header" "$_header"
        cd ..
    done
    
    # move samples to a better place
    mv -f "${pkgdir}/usr/samples" "${pkgdir}/usr/lib/${pkgname}"
    
    # license
    cd "${srcdir}/${pkgname}"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
