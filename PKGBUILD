# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]
pkgbase=vdr-softhdcuvid
pkgname=(vdr-softhdcuvid vdr-softhdvaapi vdr-softhddrm)
pkgver=3.0.1.r20.g4dbf2dc
_gitver=4dbf2dcc84245f66e7aff94e2080a52d8cb38cfa
_vdrapi=2.4.1
pkgrel=1
pkgdesc="VDR output plugin with CUDA and Opengl"
url="https://github.com/jojo61/vdr-plugin-softhdcuvid"
arch=('x86_64')
license=('AGPL3')
makedepends=('ffmpeg' 'freeglut' 'glew' 'mesa' "vdr-api=${_vdrapi}" 'xcb-util-wm' 'xorg-server' 'nvidia>=410.48' 'libplacebo>=1.7.0' 'git' 'glm' 'glu' 'vulkan-headers' 'ffnvcodec-headers')
_plugname=${pkgname//vdr-/}
source=("vdr-plugin-${_plugname}::git+https://github.com/jojo61/vdr-plugin-softhdcuvid#commit=$_gitver"
        "50-$_plugname.conf")
sha512sums=('SKIP'
         '0b336e5d0c18e5a875389c52d498ce81db0a407c6a93e1e72e0d0faec41d2165b80e91e9787465bb2cb9923ca65e6ce50e4a086f0d26410059899fef2bbe87b0')

pkgver() {
  cd "${srcdir}/vdr-plugin-${_plugname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

prepare() {
  cd "${srcdir}/vdr-plugin-${_plugname}"

  # Disable OSS. Arch Linux doesn't ship OSS
  sed -i '/OSS /d' Makefile

  # Enable libplacebo
  sed -i 's/LIBPLACEBO=0/LIBPLACEBO=1/' Makefile
}

build() {
  cd "${srcdir}/vdr-plugin-${_plugname}"
  make CUVID=1 clean
  make CUVID=1
  make VAAPI=1 clean
  make VAAPI=1
  make DRM=1 clean
  make DRM=1
}

package_vdr-softhdcuvid() {
  depends=('ffmpeg' 'freeglut' 'glew' 'mesa' "vdr-api=${_vdrapi}" 'xcb-util-wm' 'xorg-server' 'nvidia>=410.48' 'libplacebo>=1.7.0')
  optdepends=('vdr-xorg: Recommended way to start X.org server together with VDR')
  backup=("etc/vdr/conf.avail/50-$_plugname.conf")

  cd "${srcdir}/vdr-plugin-${_plugname}"
  make CUVID=1 DESTDIR="${pkgdir}" install

  install -Dm644 "$srcdir/50-$_plugname.conf" "$pkgdir/etc/vdr/conf.avail/50-softhdcuvid.conf"
}

package_vdr-softhdvaapi() {
  depends=('ffmpeg' 'freeglut' 'glew' 'mesa' "vdr-api=${_vdrapi}" 'xcb-util-wm' 'xorg-server' 'libplacebo>=1.7.0')
  optdepends=('vdr-xorg: Recommended way to start X.org server together with VDR')
  backup=("etc/vdr/conf.avail/50-softhdvaapi.conf")

  cd "${srcdir}/vdr-plugin-${_plugname}"
  make VAAPI=1 DESTDIR="${pkgdir}" install

  install -Dm644 "$srcdir/50-$_plugname.conf" "$pkgdir/etc/vdr/conf.avail/50-softhdvaapi.conf"
  sed -i 's/softhdcuvid/softhdvaapi/' "$pkgdir/etc/vdr/conf.avail/50-softhdvaapi.conf"
}

package_vdr-softhddrm() {
  depends=('ffmpeg' 'freeglut' 'glew' 'mesa' "vdr-api=${_vdrapi}" 'xcb-util-wm' 'xorg-server' 'libplacebo>=1.7.0')
  backup=("etc/vdr/conf.avail/50-softhddrm.conf")

  cd "${srcdir}/vdr-plugin-${_plugname}"
  make DRM=1 DESTDIR="${pkgdir}" install

  install -Dm644 "$srcdir/50-$_plugname.conf" "$pkgdir/etc/vdr/conf.avail/50-softhddrm.conf"
  sed -i 's/softhdcuvid/softhddrm/' "$pkgdir/etc/vdr/conf.avail/50-softhddrm.conf"
}
