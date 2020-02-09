# Maintainer: Ben Widawsky <ben@bwidawsk.net>
# Contributor: Rob McCathie <korrode at gmail>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: Paul Mattal <paul@archlinux.org>

_name=ffmpeg
pkgname=ffmpeg-libfdk_aac
pkgver=4.2.3
pkgrel=1
epoch=1
pkgdesc='Complete solution to record, convert and stream audio and video (Same as official package except with libfdk-aac support)'
arch=(x86_64)
url=https://ffmpeg.org/
license=(GPL3 custom:libfdk-aac)
depends=(
  alsa-lib
  aom
  bzip2
  fontconfig
  fribidi
  gmp
# gnutls - https://aur.archlinux.org/packages/ffmpeg-libfdk_aac/#comment-722966
  gsm
  jack
  lame
  libass.so
  libavc1394
  libbluray.so
  libdav1d.so
  libdrm
  libfreetype.so
  libiec61883
  libmfx
  libmodplug
  libomxil-bellagio
  libpulse
  libraw1394
  libsoxr
  libssh
  libtheora
  libva.so
  libva-drm.so
  libva-x11.so
  libvdpau
  libvidstab.so
  libvorbisenc.so
  libvorbis.so
  libvpx.so
  libwebp
  libx11
  libx264.so
  libx265.so
  libxcb
  libxext
  libxml2
  libxv
  libxvidcore.so
  opencore-amr
  openjpeg2
  openssl # https://aur.archlinux.org/packages/ffmpeg-libfdk_aac/#comment-722966
  opus
  sdl2
  speex
  v4l-utils
  xz
  zlib
  libfdk-aac
)
makedepends=(
  ffnvcodec-headers
  git
  ladspa
  nasm
)
optdepends=(
  'intel-media-sdk: Intel QuickSync support'
  'ladspa: LADSPA filters'
)
provides=(
  libavcodec.so
  libavdevice.so
  libavfilter.so
  libavformat.so
  libavutil.so
  libpostproc.so
  libswresample.so
  libswscale.so
  "ffmpeg=$pkgver"
)
conflicts=("$_name")
source=(git+https://git.ffmpeg.org/ffmpeg.git#tag=192d1d34eb3668fa27f433e96036340e1e5077a0)
sha256sums=('SKIP')
pkgver() {
  cd ffmpeg

  git describe --tags | sed 's/^n//'
}

prepare() {
  cd ffmpeg

  git cherry-pick -n dc0806dd25882f41f6085c8356712f95fded56c7
}
build() {
  cd ffmpeg

  ./configure \
    --prefix=/usr \
    --disable-debug \
    --disable-static \
    --disable-stripping \
    --enable-fontconfig \
    --enable-gmp \
    --enable-gpl \
    --enable-ladspa \
    --enable-libaom \
    --enable-libass \
    --enable-libbluray \
    --enable-libdav1d \
    --enable-libdrm \
    --enable-libfreetype \
    --enable-libfribidi \
    --enable-libgsm \
    --enable-libiec61883 \
    --enable-libjack \
    --enable-libmfx \
    --enable-libmodplug \
    --enable-libmp3lame \
    --enable-libopencore_amrnb \
    --enable-libopencore_amrwb \
    --enable-libopenjpeg \
    --enable-libopus \
    --enable-libpulse \
    --enable-libsoxr \
    --enable-libspeex \
    --enable-libssh \
    --enable-libtheora \
    --enable-libv4l2 \
    --enable-libvidstab \
    --enable-libvorbis \
    --enable-libvpx \
    --enable-libwebp \
    --enable-libx264 \
    --enable-libx265 \
    --enable-libxcb \
    --enable-libxml2 \
    --enable-libxvid \
    --enable-nvdec \
    --enable-nvenc \
    --enable-omx \
    --enable-openssl \
    --enable-shared \
    --enable-version3 \
    --enable-libfdk_aac \
    --enable-nonfree
#   --enable-gnutls  https://aur.archlinux.org/packages/ffmpeg-libfdk_aac/#comment-722966

  make
  make tools/qt-faststart
  make doc/ff{mpeg,play}.1

  cp /usr/share/licenses/libfdk-aac/NOTICE .
}

package() {
  make DESTDIR="${pkgdir}" -C ffmpeg install install-man
  install -Dm 755 ffmpeg/tools/qt-faststart "${pkgdir}"/usr/bin/

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  install -m 0644 ffmpeg/NOTICE "$pkgdir/usr/share/licenses/$pkgname/NOTICE"
}

# vim: ts=2 sw=2 et:
