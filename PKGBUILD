# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=ffmpeg-full-git
pkgver=4.5.r101969.g6c65e49990
pkgrel=1
pkgdesc='Complete solution to record, convert and stream audio and video (all possible features including libfdk-aac; git version)'
arch=('x86_64')
url='https://www.ffmpeg.org/'
license=('custom: nonfree and unredistributable')
depends=(
    # official repositories:
        'alsa-lib' 'avisynthplus' 'bzip2' 'frei0r-plugins' 'libgcrypt' 'gmp' 'gnutls'
        'ladspa' 'libass' 'aom' 'aribb24' 'libbluray' 'libbs2b' 'libcaca' 'celt'
        'libcdio-paranoia' 'codec2' 'dav1d' 'libdc1394' 'libavc1394' 'libfdk-aac'
        'fontconfig' 'freetype2' 'fribidi' 'glslang' 'spirv-tools' 'libgme' 'gsm'
        'libiec61883' 'libilbc' 'jack' 'kvazaar' 'libmodplug' 'lame'
        'opencore-amr' 'openjpeg2' 'opus' 'libpulse' 'librabbitmq-c' 'rav1e' 'librsvg'
        'rubberband' 'rtmpdump' 'smbclient' 'snappy' 'libsoxr' 'speex' 'srt' 'libssh'
        'svt-hevc' 'svt-av1' 'svt-vp9' 'tensorflow' 'tesseract' 'libtheora' 'twolame'
        'v4l-utils' 'vid.stab' 'vmaf' 'libvorbis' 'libvpx' 'libwebp' 'x264' 'x265'
        'libxcb' 'xvidcore' 'libxml2' 'zimg' 'zeromq' 'zvbi' 'lv2' 'lilv' 'xz'
        'libmysofa' 'openal' 'ocl-icd' 'libgl' 'sndio' 'sdl2' 'vapoursynth'
        'vulkan-icd-loader' 'libxv' 'libx11'  'libxext' 'zlib' 'cuda'
        'libomxil-bellagio' 'libdrm' 'intel-media-sdk' 'libva' 'libvdpau'
    # AUR:
        'chromaprint-fftw' 'davs2' 'flite1-patched' 'libklvanc-git' 'openh264'
        'libopenmpt-svn' 'librist' 'shine' 'uavs3d-git' 'vo-amrwbenc' 'xavs'
        'xavs2' 'pocketsphinx' 'rockchip-mpp' 'lensfun-git'
)
makedepends=(
    # official repositories:
        'git' 'nasm' 'opencl-headers' 'vulkan-headers' 'ffnvcodec-headers' 'clang'
        'amf-headers'
    # AUR:
        'decklink-sdk'
)
provides=('libavcodec.so' 'libavdevice.so' 'libavfilter.so' 'libavformat.so'
          'libavutil.so' 'libpostproc.so' 'libavresample.so' 'libswscale.so'
          'libswresample.so' 'ffmpeg' 'ffmpeg-full' 'ffmpeg-git')
conflicts=('ffmpeg')
_svt_hevc_ver='33ca9aa8a2a2d28022d3fc03704e99ce01828376'
source=('git+https://git.ffmpeg.org/ffmpeg.git'
        '010-ffmpeg-fix-vmaf-model-path.patch'
        '015-ffmpeg-cuda11-fix.patch'
        "020-ffmpeg-add-svt-hevc-g${_svt_hevc_ver:0:7}.patch"::"https://raw.githubusercontent.com/OpenVisualCloud/SVT-HEVC/${_svt_hevc_ver}/ffmpeg_plugin/0001-lavc-svt_hevc-add-libsvt-hevc-encoder-wrapper.patch"
        "030-ffmpeg-add-svt-hevc-docs-g${_svt_hevc_ver:0:7}.patch"::"https://raw.githubusercontent.com/OpenVisualCloud/SVT-HEVC/${_svt_hevc_ver}/ffmpeg_plugin/0002-doc-Add-libsvt_hevc-encoder-docs.patch"
        '040-ffmpeg-add-svt-vp9.patch'
        'LICENSE')
sha256sums=('SKIP'
            '52778c70d9fe6e3a10941b99b96ac7749cec325dc1b9ee11ab75332b5ff68e50'
            'e096996903d4e19348fabe9c61923678cbadf57299cd03809c9e06065d6ffbe2'
            '740dc9838aa47daa9f9b107178e53e384344f4c6f90865bd7e3af189257da544'
            '1499e419dda72b1604dc5e3959668f3843292ff56bfba78734e31510ba576de0'
            'ab62715392cb1aee475a95bbe4d4205552fe23e5dd50b85ca7be72a8fcd9fbfe'
            '04a7176400907fd7db0d69116b99de49e582a6e176b3bfb36a03e50a4cb26a36')

prepare() {
    rm -f ffmpeg/libavcodec/libsvt_{hevc,vp9}.c
    sed -i 's/general.texi/general_contents.texi/g' "030-ffmpeg-add-svt-hevc-docs-g${_svt_hevc_ver:0:7}.patch"
    patch -d ffmpeg -Np1 -i "${srcdir}/010-ffmpeg-fix-vmaf-model-path.patch"
    patch -d ffmpeg -Np1 -i "${srcdir}/015-ffmpeg-cuda11-fix.patch"
    patch -d ffmpeg -Np1 -i "${srcdir}/020-ffmpeg-add-svt-hevc-g${_svt_hevc_ver:0:7}.patch"
    patch -d ffmpeg -Np1 -i "${srcdir}/030-ffmpeg-add-svt-hevc-docs-g${_svt_hevc_ver:0:7}.patch"
    patch -d ffmpeg -Np1 -i "${srcdir}/040-ffmpeg-add-svt-vp9.patch"
}

pkgver() {
    printf '%s.r%s.g%s' "$(git -C ffmpeg describe --tags --long | awk -F'-' '{ sub(/^n/, "", $1); print $1 }')" \
                        "$(git -C ffmpeg describe --tags --match 'N' | awk -F'-' '{ print $2 }')" \
                        "$(git -C ffmpeg rev-parse --short HEAD)"
}

build() {
    cd ffmpeg
    printf '%s\n' '  -> Running ffmpeg configure script...'
    
    ./configure \
        --prefix='/usr' \
        --extra-cflags='-I/opt/cuda/include -I/usr/include/tensorflow' \
        --extra-ldflags='-L/opt/cuda/lib64' \
        --enable-lto \
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
        --enable-libglslang \
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
        --disable-libopenvino \
        --enable-libopus \
        --enable-libpulse \
        --enable-librabbitmq \
        --enable-librav1e \
        --enable-librist \
        --enable-librsvg \
        --enable-librubberband \
        --enable-librtmp  \
        --enable-libshine \
        --enable-libsmbclient \
        --enable-libsnappy \
        --enable-libsoxr \
        --enable-libspeex \
        --enable-libsrt \
        --enable-libssh \
        --enable-libsvthevc \
        --enable-libsvtav1 \
        --enable-libtensorflow \
        --enable-libtesseract \
        --enable-libtheora \
        --disable-libtls \
        --enable-libtwolame \
        --enable-libuavs3d \
        --enable-libv4l2 \
        --enable-libvidstab \
        --enable-libvmaf \
        --enable-libvo-amrwbenc \
        --enable-libvorbis \
        --enable-libvpx \
        --enable-libsvtvp9 \
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
        --enable-vulkan \
        --enable-xlib \
        --enable-zlib \
        \
        --enable-amf \
        --enable-cuda-nvcc \
        --enable-cuda-llvm \
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
    make -C ffmpeg DESTDIR="$pkgdir" install
    install -D -m755 ffmpeg/tools/qt-faststart -t "${pkgdir}/usr/bin"
    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
