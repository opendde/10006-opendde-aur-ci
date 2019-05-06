# Maintainer: ValHue <vhuelamo at gmail dot com>
#
# Contributor: satanselbow <igdfpm at gmail dot com>
# Contributor: Artem Sereda <overmind88 at gmail dot com>
#
pkgname="flacon"
pkgver="5.4.0"
pkgrel="1"
pkgdesc="An Audio File Encoder. Extracts audio tracks from an audio CD image to separate tracks."
arch=('i686' 'x86_64')
url="https://flacon.github.io/"
license=('LGPL2.1')
makedepends=('cmake' 'icu' 'qt5-tools')
depends=('hicolor-icon-theme' 'qt5-base' 'uchardet' 'ffmpeg')
optdepends=('flac: For FLAC support'
            'vorbis-tools: For OGG support'
            'mac: For APE support'
            'wavpack: For WavPack support'
            'ttaenc: For TrueAudio support'
            'lame: For MP3 support'
            'mp3gain: For MP3 Replay Gain support'
            'opus-tools: For OPUS support'
            'vorbisgain: For OGG Replay Gain support'
)
conflicts=('flacon-git')
provides=("${pkgname}")
source=("https://github.com/${pkgname}/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('000eacf4528906dfe0adc1c21aedcb57bf4300e56e37150173d3a23acc8fe19f')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    mkdir build

    cd build
    cmake .. -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}/build"
    install -d ${pkgdir}/usr/share/licenses/${pkgname}
    install -m 644 ../LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    make DESTDIR="${pkgdir}" install
}

# vim:set ts=4 sw=4 et syn=sh ft=sh:
