# Maintainer: Daniel Bermond < gmail-com: danielbermond >

_svt_hevc_ver='1.4.0'
_svt_av1_ver='0.6.0'
_svt_vp9_ver='ce245894c6fc1c5d1439c41a7dda8d6dc61784c4'

pkgname=ffmpeg-full-git
pkgver=4.3.r94694.g95780f4dcb
pkgrel=1
pkgdesc='Complete solution to record, convert and stream audio and video (all possible features including nvenc, qsv and libfdk-aac; git version)'
arch=('x86_64')
url='https://www.ffmpeg.org/'
license=('custom: nonfree and unredistributable')
depends=(
    # official repositories:
        'glibc' 'alsa-lib' 'jack' 'libpng'
        'bzip2' 'frei0r-plugins' 'libgcrypt' 'gmp' 'gnutls' 'ladspa' 'libass' 'aom'
        'aribb24' 'libbluray' 'libbs2b' 'libcaca' 'celt' 'libcdio-paranoia' 'dav1d'
        'libdc1394' 'libavc1394' 'libfdk-aac' 'fontconfig' 'freetype2' 'fribidi'
        'libgme' 'gsm' 'libiec61883' 'lensfun' 'libmodplug' 'lame' 'opencore-amr'
        'openjpeg2' 'opus' 'pulseaudio' 'librsvg' 'rubberband' 'rtmpdump' 'snappy'
        'libsoxr' 'speex' 'srt' 'libssh' 'tensorflow' 'tesseract' 'libtheora'
        'twolame' 'v4l-utils' 'vid.stab' 'libvorbis' 'libvpx' 'wavpack' 'libwebp'
        'libx264.so'  'x265' 'libxcb' 'xvidcore' 'libxml2' 'zimg' 'zeromq' 'zvbi'
        'lv2' 'lilv' 'xz' 'openal' 'ocl-icd' 'libgl' 'sndio' 'sdl2' 'vapoursynth'
        'libxv' 'libx11'  'libxext' 'zlib' 'cuda' 'libomxil-bellagio' 'libva'
        'libdrm' 'libvdpau'
    # AUR:
        'chromaprint-fftw' 'codec2' 'davs2' 'flite1-patched' 'libilbc'
        'libklvanc-git' 'kvazaar' 'openh264' 'libopenmpt-svn' 'shine' 'vo-amrwbenc'
        'xavs' 'xavs2' 'libmysofa' 'pocketsphinx' 'intel-media-sdk' 'rockchip-mpp'
        'intel-svt-hevc' 'intel-svt-av1' 'svt-vp9-git'
)
makedepends=(
    # official repositories:
        'git' 'nasm' 'opencl-headers' 'ffnvcodec-headers'
    # AUR:
        'vmaf' 'blackmagic-decklink-sdk' 'amf-headers-git'
)
provides=('libavcodec.so' 'libavdevice.so' 'libavfilter.so' 'libavformat.so'
          'libavutil.so' 'libpostproc.so' 'libavresample.so' 'libswscale.so'
          'libswresample.so' 'ffmpeg' 'ffmpeg-full' 'ffmpeg-git')
conflicts=('ffmpeg')
source=('git+https://git.ffmpeg.org/ffmpeg.git'
        "ffmpeg-full-git-add-intel-svt-hevc-${_svt_hevc_ver}.patch"::"https://raw.githubusercontent.com/OpenVisualCloud/SVT-HEVC/v${_svt_hevc_ver}/ffmpeg_plugin/0001-lavc-svt_hevc-add-libsvt-hevc-encoder-wrapper.patch"
        "ffmpeg-full-git-add-intel-svt-hevc-docs.patch"
        "ffmpeg-full-git-add-intel-svt-av1-${_svt_av1_ver}.patch"::"https://raw.githubusercontent.com/OpenVisualCloud/SVT-AV1/v${_svt_av1_ver}/ffmpeg_plugin/0001-Add-ability-for-ffmpeg-to-run-svt-av1-with-svt-hevc.patch"
        "ffmpeg-full-git-add-intel-svt-vp9-g${_svt_vp9_ver:0:7}.patch"::"https://raw.githubusercontent.com/OpenVisualCloud/SVT-VP9/${_svt_vp9_ver}/ffmpeg_plugin/0001-Add-ability-for-ffmpeg-to-run-svt-vp9-with-svt-hevc-av1.patch"
        'LICENSE')
sha256sums=('SKIP'
            'd9bd8345ff994c26d5174759d460c723e92012139e29dd015fe83537e29a9554'
            '1b3708496be453267be9699753c110ae171024db140e6a8d7fd68ac61845334b'
            '102a70c5c453875f5806ce02cc83fdc74e53c078cf5be2657f3dd1dd4438868c'
            '7690a4f6bdc4a57e35c7ff5b6e87f2fe6d056d452eff9e767eaccff41832f4d7'
            '04a7176400907fd7db0d69116b99de49e582a6e176b3bfb36a03e50a4cb26a36')

prepare() {
    cd ffmpeg
    
    # add intel-svt support for hevc, av1 and vp9
    git apply --index "${srcdir}/ffmpeg-full-git-add-intel-svt-hevc-${_svt_hevc_ver}.patch"
    git apply --index "${srcdir}/ffmpeg-full-git-add-intel-svt-hevc-docs.patch"
    git apply --index "${srcdir}/ffmpeg-full-git-add-intel-svt-av1-${_svt_av1_ver}.patch"
    git apply --index "${srcdir}/ffmpeg-full-git-add-intel-svt-vp9-g${_svt_vp9_ver:0:7}.patch"
}

pkgver() {
    cd ffmpeg
    
    local _version
    local _revision
    local _shorthash
    
    _version="$(  git describe  --tags --long      | awk -F'-' '{ sub(/^n/, "", $1); print $1 }')"
    _revision="$( git describe  --tags --match 'N' | awk -F'-' '{ print $2 }')"
    _shorthash="$(git rev-parse --short HEAD)"
    
    printf '%s.r%s.g%s' "$_version" "$_revision" "$_shorthash"
}

build() {
    cd ffmpeg
    
    local _ldflags='-L/opt/cuda/lib64'
    
    export PKG_CONFIG_PATH="${PKG_CONFIG_PATH:+${PKG_CONFIG_PATH}:}/opt/intel/mediasdk/lib64/pkgconfig"
    
    # set path of -lcuda on systems with legacy nvidia-340xx drivers
    # (libcuda.so.x, required by --enable-cuda-nvcc)
    if pacman -Qs '^nvidia-340xx-utils' >/dev/null 2>&1
    then
        _ldflags+=' -L/usr/lib/nvidia'
    fi
    
    printf '%s\n' '  -> Running ffmpeg configure script...'
    
    ./configure \
        --prefix='/usr' \
        --extra-cflags='-I/opt/cuda/include -I/usr/include/tensorflow' \
        --extra-ldflags="$_ldflags" \
        \
        --disable-rpath \
        --enable-gpl \
        --enable-version3 \
        --enable-nonfree \
        --enable-shared \
        --disable-static \
        --disable-stripping \
        --enable-gray \
        --enable-avresample \
        \
        --enable-alsa \
        --enable-avisynth \
        --enable-bzlib \
        --enable-chromaprint \
        --enable-frei0r \
        --enable-gcrypt \
        --enable-gmp \
        --enable-gnutls \
        --enable-iconv \
        --enable-ladspa \
        --enable-libaom \
        --enable-libaribb24 \
        --enable-libass \
        --enable-libbluray \
        --enable-libbs2b \
        --enable-libcaca \
        --enable-libcelt \
        --enable-libcdio \
        --enable-libcodec2 \
        --enable-libdav1d \
        --enable-libdavs2 \
        --enable-libdc1394 \
        --enable-libfdk-aac \
        --enable-libflite \
        --enable-fontconfig \
        --enable-libfreetype \
        --enable-libfribidi \
        --enable-libgme \
        --enable-libgsm \
        --enable-libiec61883 \
        --enable-libilbc \
        --enable-libjack \
        --enable-libklvanc \
        --enable-libkvazaar \
        --enable-liblensfun \
        --enable-libmodplug \
        --enable-libmp3lame \
        --enable-libopencore-amrnb \
        --enable-libopencore-amrwb \
        --disable-libopencv \
        --enable-libopenh264 \
        --enable-libopenjpeg \
        --enable-libopenmpt \
        --enable-libopus \
        --enable-libpulse \
        --enable-librsvg \
        --enable-librubberband \
        --enable-librtmp  \
        --enable-libshine \
        --disable-libsmbclient \
        --enable-libsnappy \
        --enable-libsoxr \
        --enable-libspeex \
        --enable-libsrt \
        --enable-libssh \
        --enable-libsvthevc \
        --enable-libsvtav1 \
        --enable-libsvtvp9 \
        --enable-libtensorflow \
        --enable-libtesseract \
        --enable-libtheora \
        --disable-libtls \
        --enable-libtwolame \
        --enable-libv4l2 \
        --enable-libvidstab \
        --enable-libvmaf \
        --enable-libvo-amrwbenc \
        --enable-libvorbis \
        --enable-libvpx \
        --enable-libwavpack \
        --enable-libwebp \
        --enable-libx264 \
        --enable-libx265 \
        --enable-libxavs \
        --enable-libxavs2 \
        --enable-libxcb \
        --enable-libxcb-shm \
        --enable-libxcb-xfixes \
        --enable-libxcb-shape \
        --enable-libxvid \
        --enable-libxml2 \
        --enable-libzimg \
        --enable-libzmq \
        --enable-libzvbi \
        --enable-lv2 \
        --enable-lzma \
        --enable-decklink \
        --disable-mbedtls \
        --enable-libmysofa \
        --enable-openal \
        --enable-opencl \
        --enable-opengl \
        --disable-openssl \
        --enable-pocketsphinx \
        --enable-sndio \
        --enable-sdl2 \
        --enable-vapoursynth \
        --enable-xlib \
        --enable-zlib \
        \
        --enable-amf \
        --enable-cuda-nvcc \
        --enable-cuvid \
        --enable-ffnvcodec \
        --enable-libdrm \
        --enable-libmfx \
        --enable-libnpp \
        --enable-nvdec \
        --enable-nvenc \
        --enable-omx \
        --enable-rkmpp \
        --enable-v4l2-m2m \
        --enable-vaapi \
        --enable-vdpau
        
    make
    make tools/qt-faststart
}

package() {
    cd ffmpeg
    
    make DESTDIR="$pkgdir" install
    
    install -D -m755 tools/qt-faststart  -t "${pkgdir}/usr/bin"
    install -D -m644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
