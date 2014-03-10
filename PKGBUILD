# Maintainer: Doug Newgard <scimmia22 at outlook dot com>
# Contributor: Ronald van Haren <ronald.archlinux.org>

_pkgname=efl
pkgname=$_pkgname-git
pkgver=1.9.99.24849.2ab6aac
pkgrel=1
pkgdesc="Enlightenment Foundation Libraries - Development version (Ecore, Eldbus, Edje, Eet, Eeze, Efreet, Eina, Eio, Embryo, Emotion, Eo, Ephysics, Ethumb, & Evas)"
arch=('i686' 'x86_64')
url="http://www.enlightenment.org"
license=('BSD' 'LGPL2.1' 'GPL2' 'custom')
depends=('bullet' 'curl' 'luajit' 'shared-mime-info' 'libxkbcommon' 'wayland' 'avahi'
         'libxcomposite' 'libxcursor' 'libxinerama' 'libxss' 'libxrandr' 'libxp'
         'libgl' 'libwebp' 'libpulse' 'libexif' 'gst-plugins-base-libs'
         'fribidi' 'harfbuzz' 'fontconfig')
  [[ ! $(pacman -T "openjpeg") ]] && depends+=('openjpeg') #jpeg2k loader is autodetected at build time
makedepends=('git' 'python2')
optdepends=('python2: compare Eina benchmarks'
            'gst-plugins-base: Access more types of video in Emotion'
            'gst-plugins-good: Access more types of video in Emotion'
            'gst-plugins-bad: Access more types of video in Emotion'
            'gst-plugins-ugly: Access more types of video in Emotion'
            'gst-libav: Access video with ffmpeg/libav in Emotion'
            'evas_generic_loaders-git: More video/graphic/icon loaders for Evas')
provides=("ecore=$pkgver" "eldbus=$pkgver" "edje=$pkgver" "eet=$pkgver" "eeze=$pkgver"
          "efreet=$pkgver" "eina=$pkgver" "eio=$pkgver" "embryo=$pkgver" "emotion=$pkgver"
          "ephysics=$pkgver" "ethumb=$pkgver" "evas=$pkgver"
          "$_pkgname=$pkgver")
conflicts=('ecore' 'edje' 'eet' 'eeze' 'efreet' 'eina' 'eio' 'embryo' 'emotion' 'ethumb' 'evas'
           "$_pkgname")
options=('debug')
install="$_pkgname.install"
source=("git://git.enlightenment.org/core/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"

  local efl_version=$(grep -m1 EFL_VERSION configure.ac | awk -F [][] '{print $2 "." $4 "." $6}')
  efl_version=$(awk -F , -v efl_version=${efl_version%.} '/^AC_INIT/ {gsub(/efl_version/, efl_version); gsub(/[\[\] -]/, ""); print $2}' configure.ac)

  printf "$efl_version.$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"

  export CFLAGS="$CFLAGS -fvisibility=hidden"
  export CXXFLAGS="$CXXFLAGS -fvisibility=hidden"

  ./autogen.sh \
    --prefix=/usr \
    --with-tests=none \
    --with-opengl=full \
    --enable-wayland \
    --enable-fb \
    --disable-tslib \
    --enable-image-loader-webp \
    --enable-systemd \
    --enable-harfbuzz \
    --enable-xinput22 \
    --enable-multisense

  make
}

package() {
  cd "$srcdir/$_pkgname"

  make -j1 DESTDIR="$pkgdir" install

# install text files
  install -Dm644 ChangeLog "$pkgdir/usr/share/doc/$_pkgname/ChangeLog"
  install -Dm644 NEWS "$pkgdir/usr/share/doc/$_pkgname/NEWS"
  install -Dm644 README "$pkgdir/usr/share/doc/$_pkgname/README"

# install license files
  install -Dm644 AUTHORS "$pkgdir/usr/share/licenses/$pkgname/AUTHORS"
  install -Dm644 COMPLIANCE "$pkgdir/usr/share/licenses/$pkgname/COMPLIANCE"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  install -Dm644 licenses/COPYING.BSD "$pkgdir/usr/share/licenses/$pkgname/COPYING.BSD"
  install -Dm644 licenses/COPYING.SMALL "$pkgdir/usr/share/licenses/$pkgname/COPYING.SMALL"
  sed -n '1,/.details/p' licenses/COPYING.LGPL > "$pkgdir/usr/share/licenses/$pkgname/COPYING.LGPL"
  ln -s ../common/GPL2/license.txt "$pkgdir/usr/share/licenses/$pkgname/COPYING.GPL"

  python2 -m compileall -q "$pkgdir"
}
