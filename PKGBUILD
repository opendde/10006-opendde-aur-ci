# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgbase=libopenmpt-svn
pkgname=('libopenmpt-svn' 'libopenmpt-doc-svn')
pkgver=0.6.r14144
pkgrel=1
pkgdesc='Library to decode tracked music files (modules) into a raw PCM audio stream (svn version)'
arch=('x86_64')
url='https://lib.openmpt.org/libopenmpt/'
license=('BSD')
makedepends=('subversion' 'doxygen' 'flac' 'help2man' 'libpulse' 'libsndfile'
             'libvorbis' 'mpg123' 'portaudio' 'sdl2' 'zlib')
source=('svn+https://source.openmpt.org/svn/openmpt/trunk/OpenMPT/'
        '010-libopenmpt-fix-doc-install-dir.patch')
sha256sums=('SKIP'
            'd670f3133ff0aa6adb42abef7000ab13693b07cfbf37d39cff66eb56b45085cd')

_options=(
    'CONFIG=gcc'
    'STATIC_LIB=0'
    'EXAMPLES=0'
    'OPTIMIZE_LTO=1'
    'MODERN=1'
    'PREFIX=/usr')

prepare() {
    patch -d OpenMPT -Np1 -i "${srcdir}/010-libopenmpt-fix-doc-install-dir.patch"
}

pkgver() {
    printf '%s.%s.r%s' \
        "$(awk '/#define OPENMPT_API_VERSION_MAJOR/ { print $NF }' OpenMPT/libopenmpt/libopenmpt_version.h)" \
        "$(awk '/#define OPENMPT_API_VERSION_MINOR/ { print $NF }' OpenMPT/libopenmpt/libopenmpt_version.h)" \
        "$(svnversion OpenMPT | tr -d 'A-z')"
}

build() {
    make -C OpenMPT "${_options[@]}" all doc
}

check() {
    make -C OpenMPT "${_options[@]}" check
}

package_libopenmpt-svn() {
    depends=('libvorbis' 'mpg123' 'zlib')
    optdepends=('flac: for openmpt123 player'
                'libpulse: for openmpt123 player'
                'libsndfile: for openmpt123 player'
                'portaudio: for openmpt123 player'
                'sdl2: for openmpt123 player')
    provides=('libopenmpt' 'openmpt123' 'openmpt123-svn')
    conflicts=('libopenmpt' 'openmpt123')
    
    make -C OpenMPT "${_options[@]}" DESTDIR="$pkgdir" install
    install -D -m644 OpenMPT/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    mv "${pkgdir}/usr/share/doc" .
}

package_libopenmpt-doc-svn() {
    pkgdesc="$(sed 's/\((svn\)/(documentation) \1/' <<< "$pkgdesc")"
    arch=('any')
    provides=('libopenmpt-doc')
    conflicts=('libopenmpt-doc')
    
    make -C OpenMPT "${_options[@]}" DESTDIR="$pkgdir" install-doc
    mv doc/libopenmpt/* "${pkgdir}/usr/share/doc/libopenmpt"
    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -s ../../doc/libopenmpt/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    rm -d doc/{libopenmpt,}
}
