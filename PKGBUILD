# Maintainer:  Philip Sequeira <phsequei@gmail.com>
# Contributor: Rudolf Polzer <divVerent@xonotic.org>
# Contributor: Bartłomiej Piotrowski <nospam@bpiotrowski.pl>
# Contributor: Eivind Uggedal <eivind@uggedal.com>

_opt_features=(

  # Disabled by default, need to be enabled every build:

  #dvd
  #cd
  #smb
  #libarchive

  # Lua is automatically detected, so you don't need to enable these if you
  # already have it installed. If you have both lua52 and luajit installed, mpv
  # will use the former. Uncommenting luajit below will tell mpv to use that
  # even if lua52 is also installed.

  #lua
  #luajit

  # The rest of these are autodetected, and are just provided to set
  # dependencies the first time you build. If you have the dependencies
  # installed, subsequent builds will pick them up automatically.

  #x11
  #wayland

  #vulkan
  #shaderc # preferred SPIR-V compiler; only available as -git from AUR

  #uchardet
  #rubberband

  # Features disabled by default, but don't require any extra dependencies on an
  # Arch system: (should these just be default?)

  #dvbin

)

# Note: The configure script will automatically enable most optional features it
# finds support for on your system. The dependencies of the built package will
# be updated based on dynamic libraries, but if you want to avoid linking
# against something you have installed, you'll have to disable it in the
# configure below.

pkgname=mpv-git
_gitname=mpv
pkgver=0.27.0_322_g0b8b64fba3_dirty
pkgrel=1
pkgdesc='Video player based on MPlayer/mplayer2 (git version)'
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
license=('GPL')
url='https://mpv.io'
_undetected_depends=('hicolor-icon-theme')
depends=('ffmpeg' "${_undetected_depends[@]}")
optdepends=('youtube-dl: for --ytdl')
makedepends=('git' 'python-docutils')
provides=('mpv')
conflicts=('mpv')
options=('!emptydirs')
install=mpv.install
source=('git+https://github.com/mpv-player/mpv'
        'allow-upstream-ffmpeg.patch'
        'find-deps.py')
md5sums=('SKIP'
         'dcc4e3bd6722b120d13d0dc9b6e6a791'
         'ffb774b13decbefc62908dda0332046b')
sha256sums=('SKIP'
            '93f92ac06e815d2eaedacb161b57e2d68086566bf2c9942dd6fc0ad16dc71272'
            'ce974e160347202e0dc63f6a7a5a89e52d2cc1db2d000c661fddb9dc1d007c02')

_opt_extra_flags=()

for feature in "${_opt_features[@]}"; do
  case "$feature" in
    dvd)
      depends+=('libdvdnav')
      _opt_extra_flags+=('--enable-dvdread' '--enable-dvdnav')
      ;;
    cd)
      depends+=('libcdio-paranoia')
      _opt_extra_flags+=('--enable-cdda')
      ;;
    smb)
      depends+=('smbclient')
      _opt_extra_flags+=('--enable-libsmbclient')
      ;;
    libarchive)
      depends+=('libarchive')
      _opt_extra_flags+=('--enable-libarchive')
      ;;
    lua)
      depends+=('lua52')
      _opt_extra_flags+=('--lua=52arch')
      ;;
    luajit)
      depends+=('luajit')
      _opt_extra_flags+=('--lua=luajit')
      ;;
    x11)
      depends+=('libxinerama' 'libxrandr' 'libxss')
      ;;
    wayland)
      depends+=('wayland' 'libxkbcommon')
      ;;
    vulkan)
      makedepends+=('vulkan-headers')
      depends+=('vulkan-icd-loader')
      ;;
    shaderc)
      #depends+=('shaderc')
      depends+=('shaderc-git')
      ;;
    uchardet|rubberband)
      depends+=("$feature")
      ;;
    dvbin)
      _opt_extra_flags+=("--enable-$feature")
      ;;
    *)
      echo "ERROR: Unknown feature option: $feature" >&2
      exit 1
  esac
done

pkgver() {
  cd "$srcdir/$_gitname"
  ./version.sh | sed s/-/_/g
}

prepare() {
  cd "$srcdir/$_gitname"
  ./bootstrap.py

  git apply "$srcdir/allow-upstream-ffmpeg.patch"
}

build() {
  cd "$srcdir/$_gitname"

  CFLAGS="$CFLAGS -I/usr/include/samba-4.0"

  ./waf configure --prefix=/usr \
        --confdir=/etc/mpv \
        --enable-zsh-comp \
        --enable-libmpv-shared \
        "${_opt_extra_flags[@]}"

  ./waf build
}

package() {
  cd "$srcdir/$_gitname"
  ./waf install --destdir="$pkgdir"

  # Update dependencies automatically based on dynamic libraries
  _detected_depends=($("$srcdir"/find-deps.py "$pkgdir"/usr/{bin/mpv,lib/libmpv.so}))
  echo 'Auto-detected dependencies:'
  echo "${_detected_depends[@]}" | fold -s -w 79 | sed 's/^/ /'
  depends=("${_detected_depends[@]}" "${_undetected_depends[@]}")
}
