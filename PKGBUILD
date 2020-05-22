# Maintainer: Parker Reed <parker.l.reed@gmail.com>
# Generate new listing of cores: 
# pacaur -s libretro | sed 's/aur\///' | sed 'N;s/\n/ /' | awk '{print $1}'
# This package tracks the latest source code on GitHub
# Clone specific tags:

# Cloning specific tags:
#source=("git+https://github.com/libretro/RetroArch.git#tag=v${pkgver}"
#        'git+https://github.com/KhronosGroup/glslang.git#commit=a4a4d5e'
#        'git+https://github.com/KhronosGroup/SPIRV-Cross.git#commit=5c24d99')

pkgname=retroarch-git
pkgver=1.8.7.r89.7cbb79277d
pkgrel=1
#epoch=1
_gitname=RetroArch
pkgdesc='Reference frontend for the libretro API (Git-latest)'
arch=('i686' 'x86_64')
conflicts=('retroarch')
provides=('retroarch')
url='http://www.libretro.com/'
license=('GPL')
groups=('libretro')
depends=('alsa-lib' 'gcc-libs' 'glibc' 'libdrm' 'libgl' 'libpulse' 'libusb'
         'libx11' 'libxcb' 'libxext' 'libxinerama' 'libxkbcommon' 'libxv'
         'libxxf86vm' 'mesa' 'openal' 'sdl2' 'wayland' 'zlib'
         'libass.so' 'libavcodec.so' 'libavformat.so' 'libavutil.so'
         'libfreetype.so' 'libswresample.so' 'libswscale.so' 'libudev.so'
	 'nvidia-cg-toolkit')
makedepends=('git' 'vulkan-icd-loader')
install=$pkgname.install
optdepends=('libretro-overlays-git: Collection of overlays'
	    'libretro-shaders-all-git: Collection of shaders'
	    'retroarch-assets-xmb: XMB menu assets'
	    'retroarch-autoconfig-udev-git: udev joypad autoconfig (git latest)'
	    'xdg-utils-git: Includes updated screensaver suspend fixes'
	    'qt5-base: For the new WIMP interface')
backup=('etc/retroarch.cfg')
source=('git+https://github.com/libretro/RetroArch.git'
        'git+https://github.com/KhronosGroup/glslang.git'
        'git+https://github.com/KhronosGroup/SPIRV-Cross.git')
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

pkgver() {

  cd $_gitname
  printf "%s" "$(git describe --first-parent --long --tags | sed 's/v//g;s/\([^-]*-\)g/r\1/;s/-/./g')"

}

prepare() {

  cd $_gitname

  git submodule init deps/{glslang/glslang,SPIRV-Cross}
  git config submodule.glslang.url ../glslang
  git config submodule.SPIRV-Cross.url ../SPIRV-Cross
  git submodule update deps/{glslang/glslang,SPIRV-Cross}

}

build() {

  cd $_gitname

  ./configure \
    --prefix='/usr' \
    --disable-jack \
    --disable-oss 
  make clean
  make
  make -C gfx/video_filters

}

package() {

  cd RetroArch

  make DESTDIR="${pkgdir}" install

  install -dm 755 "${pkgdir}"/usr/lib/retroarch/filters/{audio,video}
  install -m 644 gfx/video_filters/*.{filt,so} "${pkgdir}"/usr/lib/retroarch/filters/video/

}

# vim: ts=2 sw=2 et:
