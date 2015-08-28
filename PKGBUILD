# Maintainer: Figue <ffigue at gmail>
# Contributor: Figue <ffigue at gmail>
# Contributor (Parabola): fauno <fauno@kiwwwi.com.ar>
# Thank you very much to the older contributors:
# Contributor: evr <evanroman at gmail>
# Contributor: Muhammad 'MJ' Jassim <UnbreakableMJ@gmail.com> 

pkgname=icecat
pkgver=31.8.0
_pkgver=31.8.0-gnu1
_pkgverbase=${pkgver%%.*}
pkgrel=2
pkgdesc="GNU version of the Firefox browser."
arch=(i686 x86_64)
url="http://www.gnu.org/software/gnuzilla/"
license=('GPL' 'MPL' 'LGPL')
depends=('gtk2' 'mozilla-common' 'libxt' 'startup-notification' 'mime-types'
         'dbus-glib' 'alsa-lib' 'desktop-file-utils' 'hicolor-icon-theme'
         'libvpx' 'icu' 'libevent' 'nss' 'hunspell' 'sqlite' 'pango' 'freetype2' 'libxft' 'libx11')

makedepends=('unzip' 'zip' 'diffutils' 'python2' 'yasm' 'mesa' 'imake'
             'libpulse' 'gst-plugins-base-libs' 'inetutils')
optdepends=('networkmanager: Location detection via available WiFi networks'
            'gst-plugins-good: h.264 video'
            'gst-libav: h.264 video'
            'upower: Battery API')

install=icecat.install
source=(https://ftp.gnu.org/gnu/gnuzilla/${pkgver}/${pkgname}-${_pkgver}.tar.bz2{,.sig}
#source=(https://mirrors.kernel.org/gnu/gnuzilla/${pkgver}/${pkgname}-${_pkgver}.tar.bz2      ## Good mirror
        icecat-CVE-2015-4473-partial.patch
        icecat-CVE-2015-4482.patch
        icecat-CVE-2015-4488.patch
        icecat-CVE-2015-4489.patch
        icecat-CVE-2015-4491.patch
        icecat-CVE-2015-4492.patch
        icecat-CVE-2015-4495.patch
        mozconfig
        icecat.desktop
        icecat-safe.desktop
        vendor.js
        fixing_nullptr_31.7.0.patch
        freetype26.patch)

sha256sums=('370087d0adadf8b1c1e6a9920e26488a8902b9dc461d305f258fddb26a129d87'
            'SKIP'
            '2c569b073f03450fec0d2c9ea0a735ffb91df5bf7fa0595a3ea55e41935bae5a'
            'd05621004ec24f72cb14696977e0f75e091bb44203139f089643e055401fa9b4'
            'f963b4dd4582e0a79aed41cf7c148ccc2dbf65e6e518ba6736e12ba746ff62c5'
            'eedb11bacc946d0e449883de269b8c19e7fc754037e18ddc72f7c65219f88482'
            '05be2eb909ea21df6d4be2aec1ac910604953522c00447a78e056f46300c57c6'
            'c83d604ddedf6ba5da41bd4a2581413df0c5a4ef285b5dbef37a2a1d17e7356b'
            '28ad5a04c6e0f12ef7b43e6e12c7a1f82f2583282c62128d135b24305626f387'
            '91a675ffde751aac15c83401dc8842a055df0fe3949b6a0b304882608e6a4de2'
            'c44eab35f71dd3028a74632463710d674b2e8a0682e5e887535e3233a3b7bbb3'
            '190577ad917bccfc89a9bcafbc331521f551b6f54e190bb6216eada48dcb1303'
            '4b50e9aec03432e21b44d18c4c97b2630bace606b033f7d556c9d3e3eb0f4fa4'
            'd57d0e4d5bc66323388e8f3c9999ed443abfd304a28a1696cc6f4518ed0d0f2a'
            'b9c440406644fde5097da8717f0b5e5e973d11ec4dd6d4a0570ca7094d96dc85')

validpgpkeys=(A57369A8BABC2542B5A0368C3C76EED7D7E04784) # Ruben Rodriguez (GNU IceCat releases key) <ruben@gnu.org>

prepare() {

  cd "${srcdir}/${pkgname}-${pkgver}"

  # Patches for version 31.8.0-gnu2
  patch -Np1 -i ${srcdir}/icecat-CVE-2015-4473-partial.patch
  patch -Np1 -i ${srcdir}/icecat-CVE-2015-4482.patch
  patch -Np1 -i ${srcdir}/icecat-CVE-2015-4488.patch
  patch -Np1 -i ${srcdir}/icecat-CVE-2015-4489.patch
  patch -Np1 -i ${srcdir}/icecat-CVE-2015-4491.patch
  patch -Np1 -i ${srcdir}/icecat-CVE-2015-4492.patch
  patch -Np1 -i ${srcdir}/icecat-CVE-2015-4495.patch

  # Patch to move files directly to /usr/lib/icecat. No more symlinks.
  sed -e 's;$(libdir)/$(MOZ_APP_NAME)-$(MOZ_APP_VERSION);$(libdir)/$(MOZ_APP_NAME);g' -i config/baseconfig.mk
  sed -e 's;$(libdir)/$(MOZ_APP_NAME)-devel-$(MOZ_APP_VERSION);$(libdir)/$(MOZ_APP_NAME)-devel;g' -i config/baseconfig.mk

  # Patch for GCC 5.1
  patch -Np1 -i ../fixing_nullptr_31.7.0.patch

  # https://bugzilla.mozilla.org/show_bug.cgi?id=1143411
  patch -Np1 -i ../freetype26.patch

  msg2 "Starting build..."

  cp -v ${srcdir}/mozconfig .mozconfig

  # WebRTC build tries to execute "python" and expects Python 2
  mkdir "$srcdir/path"
  ln -s /usr/bin/python2 "$srcdir/path/python"

}

build() {

  cd "${srcdir}/${pkgname}-${pkgver}"
  ICECATDIR="/usr/lib/${pkgname}" && export ICECATDIR

  # Workaround to build 31.0. Fails otherwise.
  unset CPPFLAGS

  # Default Arch flags
  if [ "${CARCH}" = 'x86_64' ]; then
    export CFLAGS="-march=x86-64 -mtune=generic -O2 -pipe -fstack-protector-strong --param=ssp-buffer-size=4"
    export CXXFLAGS="$CFLAGS"
  elif [ "${CARCH}" = 'i686' ]; then
    export CFLAGS="-march=i686 -mtune=generic -O2 -pipe -fstack-protector-strong --param=ssp-buffer-size=4"
    export CXXFLAGS="$CFLAGS"
  fi

  export PATH="$srcdir/path:$PATH"
  export LDFLAGS="$LDFLAGS -Wl,-rpath,$ICECATDIR"
  export MOZ_MAKE_FLAGS="$MAKEFLAGS"
  export PYTHON=python2

  make -f client.mk build
#  ./configure --with-l10n-base="${srcdir}/${pkgname}-${pkgver}"/l10n -std=gnu89
#  make

}

package () {

  cd "${srcdir}/${pkgname}-${pkgver}"

  make -f client.mk DESTDIR="${pkgdir}" install
#  make DESTDIR="${pkgdir}" install

  msg2 "Finishing..."
  install -m755 -d ${pkgdir}/usr/share/applications
  install -m755 -d ${pkgdir}/usr/share/pixmaps

  for i in 16 32 48; do
      install -Dm644 ${srcdir}/${pkgname}-${pkgver}/browser/branding/official/default${i}.png \
      "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/icecat.png"
  done
  install -Dm644 ${srcdir}/${pkgname}-${pkgver}/browser/branding/official/default48.png ${pkgdir}/usr/share/pixmaps/icecat.png
  install -Dm644 ${srcdir}/icecat.desktop ${pkgdir}/usr/share/applications/
  install -Dm644 ${srcdir}/icecat-safe.desktop ${pkgdir}/usr/share/applications/

  # implement vendor.js setting the locale to match the os don't disable our languages extensions
  # https://projects.archlinux.org/svntogit/packages.git/commit/trunk/PKGBUILD?h=packages/firefox&id=281a95c2cca0db88904603d7808936f52797a690
  install -Dm644 "${srcdir}"/vendor.js "${pkgdir}${ICECATDIR}/browser/defaults/preferences/vendor.js"

  # We don't want the development stuff
  rm -rv "$pkgdir"/usr/{include,lib/icecat-devel,share/idl}
}

