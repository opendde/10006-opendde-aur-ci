# Maintainer: jakob <grandchild@mailbox.org>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>
# Contributor: Ben <ben@benmazer.net>

_pkgname=mpd
pkgname=${_pkgname}-smbclient
pkgver=0.22.6
pkgrel=1
pkgdesc="Flexible, powerful, server-side application for playing music (with buggy smbclient plugin enabled, don't complain upstream!)"
url="https://www.musicpd.org/"
license=('GPL2')
arch=('x86_64' 'aarch64')
depends=('bzip2' 'chromaprint' 'gcc-libs' 'glibc' 'lame' 'libcdio'
'libcdio-paranoia' 'libgcrypt' 'libgme' 'libmad' 'libmms' 'libmodplug'
'libmpcdec' 'libnfs' 'libshout' 'libsidplayfp' 'libsoxr' 'openal' 'opus'
'smbclient' 'sqlite' 'wavpack' 'wildmidi' 'yajl' 'zlib' 'zziplib')
makedepends=('alsa-lib' 'audiofile' 'avahi' 'boost' 'curl' 'dbus' 'expat'
'faad2' 'ffmpeg' 'flac' 'fluidsynth' 'icu' 'jack' 'libao' 'libid3tag'
'libmikmod' 'libmpdclient' 'libogg' 'libpulse' 'libsamplerate' 'libsndfile'
'libupnp' 'liburing' 'libvorbis' 'meson' 'mpg123' 'python-sphinx'
'systemd-libs' 'twolame')
provides=('mpd')
conflicts=('mpd')
backup=("etc/${_pkgname}.conf")
source=("https://www.musicpd.org/download/${_pkgname}/${pkgver%.*}/${_pkgname}-${pkgver}.tar.xz"{,.sig}
        "${_pkgname}.conf"
        "${_pkgname}.sysusers"
        "${_pkgname}.tmpfiles")
ha512sums=('5e417204e24d11fa609740ae92bc1d796aad2d63537655f655074d829cd79cadaf1ca025171dcf5486c1e557cc946152c21e299286b1cb74cc342da2b1f41343'
            'SKIP'
            '25a823740d92da8e186916701413114142eb6ad91a172c592e68b569c8e4f50fa99580e555ccf6cd31fc4f55a09bfe0278efa46e4e76ee0fe02846292fadf3c1'
            '6e467481406279767b709ec6d5c06dbd825c0de09045c52ffa2d21d0604dcfe19b7a92bf42bed25163d66a3a0d1dbde6185a648b433eaf5eac56be90491e2e18'
            'db473db27cd68994c3ee26e78e0fb34d13126301d8861563dcc12a22d62ecb14c4ffb1e0798c6aaccdff34e73bae3fbeeff7b42606c901a2d35e278865cdf35d')
b2sums=('675b876415a343ba387e26ad800b2e562b40a5e3aaacdff31e0ec9d6ad09f0117406f82e519a08ba3187020b482dcd0434267f9e84dd13e9e1bf8565d1967c2c'
        'SKIP'
        '0969a3c477b6a3f34b44e067e515d7f306414dd14e0163584417b9d071e3cc825898219f7ff66ead7905b15429b8411304052d3b2b14a72e560bfabf9bf0adcf'
        '4ab6e415284c77802a39d0913d701fe55e56f3c22b19557661fbef77e456b5e1d151da4202695282b956602e716a7afdb994aa2fc17368b9a0d0d051d47a3afb'
        'd7b587c25dd5830c27af475a8fdd8102139d7c8fdd6f04fe23b36be030e4411582e289f575c299255ff8183096f7d47247327276f9a24641cbd032d9675b837a')
validpgpkeys=('0392335A78083894A4301C43236E8A58C6DB4512') # Max Kellermann <max@blarg.de>


prepare() {
  cd "${_pkgname}-${pkgver}"
  sed -e '/\[Service\]/a User=mpd' \
      -i "systemd/system/mpd.service.in"
}

build() {
  cd "${_pkgname}-${pkgver}"
  # NOTE: sndio conflicts with alsa
  # TODO: package adplug
  # TODO: package shine
  meson --prefix /usr \
        --libexecdir lib \
        --sbindir bin \
        --buildtype plain \
        --auto-features enabled \
        --wrap-mode nodownload \
        -D b_lto=true \
        -D b_pie=true \
        -D documentation=enabled \
        -D adplug=disabled \
        -D sndio=disabled \
        -D shine=disabled \
        -D tremor=disabled \
        -D smbclient=enabled \
        build
  ninja -C build
}

check() {
  cd "${_pkgname}-${pkgver}"
  ninja -C build test
}

package() {
  depends+=('libFLAC.so' 'libao.so' 'libasound.so' 'libaudiofile.so'
  'libavahi-client.so' 'libavahi-common.so' 'libavcodec.so' 'libavformat.so'
  'libavutil.so' 'libcurl.so' 'libdbus-1.so' 'libexpat.so' 'libfaad.so'
  'libfluidsynth.so' 'libicui18n.so' 'libicuuc.so' 'libid3tag.so' 'libjack.so'
  'libmikmod.so' 'libmpdclient.so' 'libmpg123.so' 'libogg.so' 'libpulse.so'
  'libsamplerate.so' 'libsndfile.so' 'libsystemd.so' 'libtwolame.so'
  'libupnp.so' 'liburing.so' 'libvorbis.so' 'libvorbisenc.so')
  cd "${_pkgname}-${pkgver}"
  DESTDIR="${pkgdir}" ninja -C build install
  install -vDm 644 "doc/${_pkgname}conf.example" \
    -t "${pkgdir}/usr/share/doc/${_pkgname}/"
  install -vDm 644 "../${_pkgname}.conf" -t "${pkgdir}/etc/"
  install -vDm 644 "../${_pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${_pkgname}.conf"
  install -vDm 644 "../${_pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${_pkgname}.conf"
}
