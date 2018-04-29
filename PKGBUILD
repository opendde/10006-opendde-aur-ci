# Maintainer: Pierre Franco <pierre dot franco at ensimag dot grenoble dash inp dot fr>
# Based on wine-staging PKGBUILD

#Additional patches:
# -Gallium Nine support
# -Keybind patch reversion
# -Wbemprox videocontroller query fix v2 (see https://bugs.winehq.org/show_bug.cgi?id=38879 )
# -Steam patch, Crossover Hack version (see https://bugs.winehq.org/show_bug.cgi?id=39403 )
# -Linked lists perfomances improvements
# -Wine-PBA (disabled by default)

pkgname=wine-gaming-nine
pkgver=3.7
pkgrel=1

_pkgbasever=${pkgver/rc/-rc}

_stagingversion="$pkgver"
_d3d9version="3.7"
_pbarevision="8f20f0718a47e3773f0f3f30c475516378191c67"

_stagingdir="wine-staging-$_stagingversion"
_d3d9dir="wine-d3d9-patches-wine-d3d9-$_d3d9version"
_pbadir="wine-pba-$_pbarevision/patches"

source=(
	https://dl.winehq.org/wine/source/3.x/wine-$_pkgbasever.tar.xz
	https://github.com/wine-staging/wine-staging/archive/v$_stagingversion.tar.gz
	https://github.com/sarnex/wine-d3d9-patches/archive/wine-d3d9-$_d3d9version.tar.gz
	https://github.com/acomminos/wine-pba/archive/$_pbarevision.tar.gz
	harmony-fix.patch
	30-win32-aliases.conf
	wine-binfmt.conf
	keybindings.patch
	steam.patch
	wbemprox_query_v2.patch
	wine-list.h-linked-list-cache-line-prefetching.patch
)
sha512sums=(
	'a699418574dd8f407c064421cf6cdfe3923562c8adf9a7749e716f3853291eab05358ea64f0217c303c26c0f8f59d2116024b7b6978f9a52a055147e689a8694'
	'4a00b7c61121798b6c4e918aadeb71865e359f6471035b9ed33ae242f3fe70f1977b1c0b3628fb244b5ba4942d771d2ee797bcc087d38192fcd9325e1886ed14'
	'9a02e40bda9c26001857355ddfb1ba68afb518158260b0904c5aaef3991e19587dcc107cc34b01b9fbda7e710be488384b020bbf8d56632cce787ffb299bc3f3'
	'5ca7651d5e0b147f8d1d47ce6bf225cd89048f3987b8744a6ca30a56586240b210581e5502f99b0a2b7f161ba8b359c1bd7f2ed7c4ac1d54d5ee69dd90b00d0d'
	'b86edf07bfc560f403fdfd5a71f97930ee2a4c3f76c92cc1a0dbb2e107be9db3bed3a727a0430d8a049583c63dd11f5d4567fb7aa69b193997c6da241acc4f2e'
	'6e54ece7ec7022b3c9d94ad64bdf1017338da16c618966e8baf398e6f18f80f7b0576edf1d1da47ed77b96d577e4cbb2bb0156b0b11c183a0accf22654b0a2bb'
	'bdde7ae015d8a98ba55e84b86dc05aca1d4f8de85be7e4bd6187054bfe4ac83b5a20538945b63fb073caab78022141e9545685e4e3698c97ff173cf30859e285'
	'88a017239dd9a58735795e41a12a3480afe260d9747ab2997db26196bdb551cb7e7591596278a8c67c35343bd9f8bf0560f88d3dd10bfd65681f9d2c6c287c84'
	'ca24cc86a74cc8af8e23a34da9231778f56a7e2cff215bb956898d73f6945410f0eaabae542a5fd68f83456fb8f56b60e0abe2a710f6b190a01f84817ab3676c'
	'904a6d5578c75633f9c8293a939d4ff67627b85b0ffcc9b6c2af5280314c7670d52c1c0c441bb6231508337a12e72abb620ca5ac5da5d45ffaa8f25fdddbb43d'
	'abeef97c54f3dbdb49b737a5966c8a435c9235a4c2c6da151503ea1c14fa1889a8f35a5f80daa6188d367298716f8a64db4714d19be5e1203dc43239431f7ed2'
)

pkgdesc="Based off wine-staging, including the gallium-nine patches and some more hacks"
url="http://www.winehq.com"
arch=(x86_64)
options=(staticlibs)
license=(LGPL)

depends=(
  fontconfig      lib32-fontconfig
  lcms2           lib32-lcms2
  libxml2         lib32-libxml2
  libxcursor      lib32-libxcursor
  libxrandr       lib32-libxrandr
  libxdamage      lib32-libxdamage
  libxi           lib32-libxi
  gettext         lib32-gettext
  freetype2       lib32-freetype2
  glu             lib32-glu
  libsm           lib32-libsm
  gcc-libs        lib32-gcc-libs
  libpcap         lib32-libpcap
  desktop-file-utils
)
makedepends=(autoconf ncurses bison perl fontforge flex
  'gcc>=4.5.0-2'
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
  libpulse              lib32-libpulse
  alsa-lib              lib32-alsa-lib
  libxcomposite         lib32-libxcomposite
  mesa                  lib32-mesa
  mesa-libgl            lib32-mesa-libgl
  opencl-icd-loader     lib32-opencl-icd-loader
  libxslt               lib32-libxslt
  gst-plugins-base-libs lib32-gst-plugins-base-libs
  gtk3                  lib32-gtk3
  vulkan-icd-loader     lib32-vulkan-icd-loader
  samba
  opencl-headers
  xorgproto
  pkg-config
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
  ncurses               lib32-ncurses
  opencl-icd-loader     lib32-opencl-icd-loader
  libxslt               lib32-libxslt
  gst-plugins-base-libs lib32-gst-plugins-base-libs
  vulkan-icd-loader     lib32-vulkan-icd-loader
  cups
  samba                 dosbox
)
provides=("wine=$pkgver" "wine-wow64=$pkgver" "wine-staging=$pkgver")
conflicts=('wine' 'wine-wow64' 'wine-staging')
makedepends=(${makedepends[@]} ${depends[@]})
install=wine.install

_pbaprepare() {
  for _f in $(ls $_pbadir); do
    patch -d $pkgname -Np1 < $_pbadir/$_f
  done
}

prepare() {
  # Allow ccache to work
  mv wine-$_pkgbasever $pkgname

  # https://bugs.winehq.org/show_bug.cgi?id=43530
  export CFLAGS="${CFLAGS/-fno-plt/}"
  export LDFLAGS="${LDFLAGS/,-z,now/}"

  patch -d $pkgname -Np1 < harmony-fix.patch

  patch -d $pkgname -Np1 < steam.patch
  patch -d $pkgname -Np1 < wine-list.h-linked-list-cache-line-prefetching.patch
  patch -d $pkgname -Np1 < wbemprox_query_v2.patch

  patch -d $pkgname -Np1 -R < keybindings.patch

  $_stagingdir/patches/patchinstall.sh DESTDIR=$pkgname --all

  patch -d $pkgname -Np1 < $_d3d9dir/staging-helper.patch
  patch -d $pkgname -Np1 < $_d3d9dir/wine-d3d9.patch

  # Uncomment if you want wine-pba optimizations
  #_pbaprepare

  autoreconf -f "$pkgname"

  sed 's|OpenCL/opencl.h|CL/opencl.h|g' -i $pkgname/configure*

  # Get rid of old build dirs
  rm -rf $pkgname-{32,64}-build
  mkdir $pkgname-32-build
}

build() {
  cd "$srcdir"

  msg2 "Building Wine-64..."

  mkdir $pkgname-64-build
  cd "$srcdir/$pkgname-64-build"
  ../$pkgname/configure \
    --prefix=/usr \
    --libdir=/usr/lib \
    --with-x \
    --with-gstreamer \
    --enable-win64 \
    --disable-tests \
    --with-d3d9-nine

  make

  _wine32opts=(
    --libdir=/usr/lib32
    --with-wine64="$srcdir/$pkgname-64-build"
  )

  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  msg2 "Building Wine-32..."
  cd "$srcdir/$pkgname-32-build"
  ../$pkgname/configure \
    --prefix=/usr \
    --with-x \
    --with-gstreamer \
    --disable-tests \
    --with-d3d9-nine \
    "${_wine32opts[@]}"

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
  install -d "$pkgdir"/etc/fonts/conf.{avail,d}
  install -m644 "$srcdir/30-win32-aliases.conf" "$pkgdir/etc/fonts/conf.avail"
  ln -s ../conf.avail/30-win32-aliases.conf "$pkgdir/etc/fonts/conf.d/30-win32-aliases.conf"
  install -Dm 644 "$srcdir/wine-binfmt.conf" "$pkgdir/usr/lib/binfmt.d/wine.conf"
}

# vim:set ts=8 sts=2 sw=2 et:
