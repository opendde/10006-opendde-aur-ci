# Maintainer: loathingkernel <loathingkernel _a_ gmail _d_ com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: Eduardo Romero <eduardo@archlinux.org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>

pkgname=wine-ge-custom
_srctag=6.16-GE-1
pkgver=${_srctag//-/.}
pkgrel=1

#_winever=${pkgver%.*}
_winever=$pkgver
_pkgbasever=${pkgver/rc/-rc}

source=(wine-ge-custom::git+https://github.com/GloriousEggroll/wine-ge-custom#tag=$_srctag
        wine-gloriouseggroll::git+https://github.com/GloriousEggroll/wine.git
        wine-ge-custom-more_8x5_res.patch
        wine-ge-custom-wmclass.patch
        30-win32-aliases.conf
        wine-binfmt.conf)
sha512sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '6e54ece7ec7022b3c9d94ad64bdf1017338da16c618966e8baf398e6f18f80f7b0576edf1d1da47ed77b96d577e4cbb2bb0156b0b11c183a0accf22654b0a2bb'
            'bdde7ae015d8a98ba55e84b86dc05aca1d4f8de85be7e4bd6187054bfe4ac83b5a20538945b63fb073caab78022141e9545685e4e3698c97ff173cf30859e285')
validpgpkeys=(5AC1A08B03BD7A313E0A955AF5E6E9EEB9461DD7
              DA23579A74D4AD9AF9D3F945CEFAC8EAAF17519D)

pkgdesc="A compatibility layer for running Windows programs - GloriousEggroll branch"
url="https://github.com/GloriousEggroll/wine-ge-custom"
arch=(x86_64 x86_64_v3)
options=(!staticlibs !lto)
license=(LGPL)

depends=(
  attr             lib32-attr
  fontconfig       lib32-fontconfig
  lcms2            lib32-lcms2
  libxml2          lib32-libxml2
  libxcursor       lib32-libxcursor
  libxrandr        lib32-libxrandr
  libxdamage       lib32-libxdamage
  libxi            lib32-libxi
  gettext          lib32-gettext
  freetype2        lib32-freetype2
  glu              lib32-glu
  libsm            lib32-libsm
  gcc-libs         lib32-gcc-libs
  libpcap          lib32-libpcap
  faudio           lib32-faudio
  desktop-file-utils
)

makedepends=(autoconf bison perl fontforge flex mingw-w64-gcc git
  giflib                lib32-giflib
  libpng                lib32-libpng
  gnutls                lib32-gnutls
  libxinerama           lib32-libxinerama
  libxcomposite         lib32-libxcomposite
  libxmu                lib32-libxmu
  libxxf86vm            lib32-libxxf86vm
  libldap               lib32-libldap
  mpg123                lib32-mpg123
  openal                lib32-openal
  v4l-utils             lib32-v4l-utils
  alsa-lib              lib32-alsa-lib
  libxcomposite         lib32-libxcomposite
  mesa                  lib32-mesa
  mesa-libgl            lib32-mesa-libgl
  opencl-icd-loader     lib32-opencl-icd-loader
  libxslt               lib32-libxslt
  libpulse              lib32-libpulse
  libva                 lib32-libva
  gtk3                  lib32-gtk3
  gst-plugins-base-libs lib32-gst-plugins-base-libs
  vulkan-icd-loader     lib32-vulkan-icd-loader
  sdl2                  lib32-sdl2
  vkd3d                 lib32-vkd3d
  libcups               lib32-libcups
  sane
  libgphoto2
  gsm
  ffmpeg
  samba
  opencl-headers
)

optdepends=(
  giflib                lib32-giflib
  libpng                lib32-libpng
  libldap               lib32-libldap
  gnutls                lib32-gnutls
  mpg123                lib32-mpg123
  openal                lib32-openal
  v4l-utils             lib32-v4l-utils
  libpulse              lib32-libpulse
  alsa-plugins          lib32-alsa-plugins
  alsa-lib              lib32-alsa-lib
  libjpeg-turbo         lib32-libjpeg-turbo
  libxcomposite         lib32-libxcomposite
  libxinerama           lib32-libxinerama
  opencl-icd-loader     lib32-opencl-icd-loader
  libxslt               lib32-libxslt
  libva                 lib32-libva
  gtk3                  lib32-gtk3
  gst-plugins-base-libs lib32-gst-plugins-base-libs
  vulkan-icd-loader     lib32-vulkan-icd-loader
  sdl2                  lib32-sdl2
  vkd3d                 lib32-vkd3d
  sane
  libgphoto2
  gsm
  ffmpeg
  cups
  samba           dosbox
)

provides=("wine=$pkgver" "wine-wow64=$pkgver")
conflicts=('wine' 'wine-wow64')
install=wine.install

prepare() {

  pushd $pkgname
  git submodule init wine
  git config submodule.wine.url "$srcdir"/wine-gloriouseggroll
  git submodule update wine
  pushd wine
  patch -p1 -i "$srcdir"/wine-ge-custom-more_8x5_res.patch
  patch -p1 -i "$srcdir"/wine-ge-custom-wmclass.patch
  dlls/winevulkan/make_vulkan
  tools/make_requests
  autoreconf -f
  popd
  popd

  export CFLAGS="-O3 -march=nocona -mtune=core-avx2 -pipe"
  export CXXFLAGS="-O3 -march=nocona -mtune=core-avx2 -pipe"
  # Doesn't compile without remove these flags as of 4.10
  export CFLAGS="${CFLAGS/-fno-plt/}"
  export CXXFLAGS="${CXXFLAGS/-fno-plt/}"
  export LDFLAGS="${LDFLAGS/,-z,now/}"
  # MingW Wine builds fail with relro
  export LDFLAGS="${LDFLAGS/,-z,relro/}"
  # Disable AVX instead of using 02, same as dxvk, the rest are from Proton
  export CFLAGS+=" -mno-avx -mfpmath=sse -fwrapv -fno-strict-aliasing -gdwarf-2 -gstrict-dwarf"
  export CXXFLAGS+=" -mno-avx -mfpmath=sse -fwrapv -fno-strict-aliasing -gdwarf-2 -gstrict-dwarf -std=c++17"

  export CROSSCFLAGS="$CFLAGS"
  export CROSSCXXFLAGS="$CXXFLAGS"
  export CROSSLDFLAGS="$LDFGFLAGS -Wl,--file-alignment,4096"

  sed 's|OpenCL/opencl.h|CL/opencl.h|g' -i $pkgname/wine/configure*

  # Get rid of old build dirs
  rm -rf $pkgname-{32,64}-build
  mkdir $pkgname-{32,64}-build
}

build() {
  cd "$srcdir"

  msg2 "Building Wine-64..."

  cd "$srcdir/$pkgname-64-build"
  ../$pkgname/wine/configure \
    --prefix=/usr \
    --libdir=/usr/lib \
    --with-x \
    --with-faudio \
    --with-gstreamer \
    --with-mingw \
    --with-alsa \
    --without-oss \
    --disable-winemenubuilder \
    --disable-win16 \
    --disable-tests \
    --enable-win64 \
    --with-xattr

  make

  msg2 "Building Wine-32..."

  export CFLAGS+=" -mstackrealign"
  export CXXFLAGS+=" -mstackrealign"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  cd "$srcdir/$pkgname-32-build"
  ../$pkgname/wine/configure \
    --prefix=/usr \
    --with-x \
    --with-faudio \
    --with-gstreamer \
    --with-mingw \
    --with-alsa \
    --without-oss \
    --disable-winemenubuilder \
    --disable-win16 \
    --disable-tests \
    --with-xattr \
    --libdir=/usr/lib32 \
    --with-wine64="$srcdir/$pkgname-64-build"

  make
}

package() {
  msg2 "Packaging Wine-32..."
  cd "$srcdir/$pkgname-32-build"

  make prefix="$pkgdir/usr" \
    libdir="$pkgdir/usr/lib32" \
    dlldir="$pkgdir/usr/lib32/wine" install

  msg2 "Packaging Wine-64..."
  cd "$srcdir/$pkgname-64-build"
  make prefix="$pkgdir/usr" \
    libdir="$pkgdir/usr/lib" \
    dlldir="$pkgdir/usr/lib/wine" install

  # Font aliasing settings for Win32 applications
  install -d "$pkgdir"/usr/share/fontconfig/conf.{avail,default}
  install -m644 "$srcdir/30-win32-aliases.conf" "$pkgdir/usr/share/fontconfig/conf.avail"
  ln -s ../conf.avail/30-win32-aliases.conf "$pkgdir/usr/share/fontconfig/conf.default/30-win32-aliases.conf"
  install -Dm 644 "$srcdir/wine-binfmt.conf" "$pkgdir/usr/lib/binfmt.d/wine.conf"

  i686-w64-mingw32-strip --strip-unneeded "$pkgdir"/usr/lib32/wine/i386-windows/*.{dll,exe}
  x86_64-w64-mingw32-strip --strip-unneeded "$pkgdir"/usr/lib/wine/x86_64-windows/*.{dll,exe}
}

# vim:set ts=8 sts=2 sw=2 et:
