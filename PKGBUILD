# Maintainer: Matt/ilikenwf <parwok@gmail.com>
# based on firefox-dev
# Contributor: <jnbek1972 at gmail dot com>
# Contributor: <raku at rakutiki.tv>
pkgname=waterfox-classic-git
pkgver=56.3+4e300fc5cebf
pkgrel=1
pkgdesc="64-Bit optimized Firefox fork, no data collection, allows unsigned extensions"
arch=('i686' 'x86_64')
license=('MPL')
url="https://www.waterfoxproject.org/"
depends=('gtk2' 'gtk3' 'mozilla-common' 'libxt' 'startup-notification'
         'dbus-glib' 'alsa-lib' 'ffmpeg' 'desktop-file-utils' 'hicolor-icon-theme'
         'libvpx' 'icu' 'libevent' 'nss' 'hunspell' 'sqlite' 'ttf-font')
makedepends=('unzip' 'zip' 'diffutils' 'python2' 'yasm' 'mesa' 'imake' 'gconf'
             'xorg-server-xvfb' 'libpulse' 'inetutils' 'autoconf2.13' 'clang' 'llvm' 'cargo')
provides=("waterfox=$pkgver")
conflicts=('waterfox' 'waterfox-bin' 'waterfox-git')
install=waterfox-classic.install
options=('!emptydirs' '!makeflags' '!strip')
source=(git://github.com/MrAlex94/Waterfox#branch=classic
        mozconfig
        waterfox-classic.desktop
        vendor.js)
sha512sums=('SKIP'
            'd5e30e4bcabc7c609d3d5e4defb4a466fd457099f4a4cad986694396f7ec16936d79e06ee9465de070fd98e5f5be562b8c2cb475e3dc669e30f585318ab66751'
            'de2ae1fa6d515da03026277ff30ee23935922ed26baa296334fbc088da9e924f0755dd123150c26a3b272f03198d0b283371852e0e1b9f3f6ff80cbbf1846dee'
            'd927e5e882115c780aa0d45034cb1652eaa191d95c15013639f9172ae734245caae070018465d73fdf86a01601d08c9e65f28468621422d799fe8451e6175cb7')
            
# don't compress the package - we're just going to uncompress during install in a moment
PKGEXT='.pkg.tar'   
 
pkgver() {
	cd Waterfox
	echo $(cat browser/config/version.txt)"+"$(git rev-parse --short HEAD)
}

prepare() {
  cd Waterfox

  cp ../mozconfig .mozconfig

  # lcrmf breaks stuff
  sed -i 's/ \-lcrmf//g' "${srcdir}/Waterfox/old-configure.in"

  mkdir -p "$srcdir/path"
}

build() {
  cd Waterfox

  export PATH="$srcdir/path:$PATH"
  export PYTHON="/usr/bin/python2"

  make -j -f client.mk build
}

package() {
  cd Waterfox
  mkdir -p "$pkgdir"
  DESTDIR="$pkgdir" make -f client.mk install

  install -Dm644 ../vendor.js "$pkgdir/opt/waterfox-classic/browser/defaults/preferences/vendor.js"

  for i in 16 32 48; do
      install -Dm644 "$srcdir/Waterfox/obj-x86_64-pc-linux-gnu/dist/waterfox/browser/chrome/icons/default/default$i.png" \
        "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/waterfox-classic.png"
  done

  install -Dm644 "$srcdir/Waterfox/obj-x86_64-pc-linux-gnu/dist/waterfox/browser/chrome/icons/default/default128.png" \
    "$pkgdir/usr/share/icons/hicolor/64x64/apps/waterfox-classic.png"
  install -Dm644 "$srcdir/Waterfox/obj-x86_64-pc-linux-gnu/dist/waterfox/browser/chrome/icons/default/default128.png" \
    "$pkgdir/usr/share/icons/hicolor/128x128/apps/waterfox-classic.png"
  install -Dm644 browser/branding/unofficial/content/about-logo.png \
    "$pkgdir/usr/share/icons/hicolor/192x192/apps/waterfox-classic.png"
  install -Dm644 browser/branding/unofficial/content/about-logo@2x.png \
    "$pkgdir/usr/share/icons/hicolor/384x384/apps/waterfox-classic.png"

  install -Dm644 ../waterfox-classic.desktop \
    "$pkgdir/usr/share/applications/waterfox-classic.desktop"

  # Use system-provided dictionaries
  rm -rf "$pkgdir"/opt/waterfox-classic/{dictionaries,hyphenation}
  ln -s /usr/share/hunspell "$pkgdir/opt/waterfox-classic"
  ln -s /usr/share/hyphen "$pkgdir/opt/waterfox-classic"
}

