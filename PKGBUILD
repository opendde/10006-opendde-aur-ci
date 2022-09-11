# Maintainer: su226 <thesu226 at outlook dot com>
# Contributor: twa022 <twa022 at gmail dot com>

_pkgname=gimp
pkgname=${_pkgname}-devel-noconflict
pkgver=2.99.12
pkgrel=1
pkgdesc="GNU Image Manipulation Program (Development version, doesn't conflict with gimp 2.0)"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://www.gimp.org/"
license=('GPL' 'LGPL')
depends=('gtk3' 'lcms2' 'libwmf' 'icu' 'enchant' 'libgexiv2' 'librsvg' 'desktop-file-utils'
         'libexif' 'libgudev' 'openjpeg2' 'poppler-glib' 'poppler-data' 'openexr' 'mypaint-brushes1'
         'babl>=0.1.78' 'gegl>=0.4.36' 'cairo' 'python-gobject' 'appstream-glib' 'libxmu' 'graphviz')
makedepends=('appstream' 'intltool' 'libxslt' 'glib-networking'
             'alsa-lib' 'curl' 'ghostscript' 'libxpm'
             'libheif' 'libwebp' 'libmng' 'iso-codes' 'aalib' 'zlib' 'libjxl'
             'gjs'  'luajit' 'meson' 'gobject-introspection'
             'gi-docgen' 'xorg-server-xvfb' 'vala' 'highway' 'yelp-tools')
checkdepends=('xorg-server-xvfb')
optdepends=('gutenprint: for sophisticated printing only as gimp has built-in cups print support'
            'alsa-lib: for MIDI event controller module'
            'curl: for URI support'
            'ghostscript: for postscript support'
            'libxpm: XPM support'
            'libheif: HEIF support'
            'libjxl: JPEG XL support'
            'libwebp: WebP support'
            'libmng: MNG support'
            'iso-codes: Language support'
            'aalib: ASCII art support'
            'zlib: Compression routines'
            'gjs: JavaScript scripting support'
            'luajit: LUA scripting support'
            'lua51-lgi: LUA scripting support')
provides=("${_pkgname}=${pkgver}")
source=(https://download.gimp.org/pub/gimp/v${pkgver%.*}/${_pkgname}-${pkgver}.tar.xz
        linux.gpl
        file-heif.diff)
sha256sums=('7ba1b032ea520d540e4acad3da16d8637fe693743fdb36e0121775eea569f6a3'
            '1003bbf5fc292d0d63be44562f46506f7b2ca5729770da9d38d3bb2e8a2f36b3'
            '4996eedcf6d8238c21c52c70ac4b3027f007b2a2a8f1eab9a0caaee6989dcc35')
build() {
  local _dir="${_pkgname}-${pkgver}"
  # fix builing with libheif 1.13.0+
  # see https://gitlab.gnome.org/GNOME/gimp/-/issues/8570
  patch "$_dir/plug-ins/common/file-heif.c" < file-heif.diff
  arch-meson "$_dir" build \
    -Dgi-docgen=enabled \
    -Dg-ir-doc=true
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
  install -Dm 644 "${srcdir}/linux.gpl" "${pkgdir}/usr/share/gimp/2.99/palettes/Linux.gpl"
  mv "${pkgdir}/usr/share/icons/hicolor/16x16/apps/gimp.png" "${pkgdir}/usr/share/icons/hicolor/16x16/apps/gimp-2.99.png"
  mv "${pkgdir}/usr/share/icons/hicolor/22x22/apps/gimp.png" "${pkgdir}/usr/share/icons/hicolor/22x22/apps/gimp-2.99.png"
  mv "${pkgdir}/usr/share/icons/hicolor/24x24/apps/gimp.png" "${pkgdir}/usr/share/icons/hicolor/24x24/apps/gimp-2.99.png"
  mv "${pkgdir}/usr/share/icons/hicolor/32x32/apps/gimp.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/gimp-2.99.png"
  mv "${pkgdir}/usr/share/icons/hicolor/48x48/apps/gimp.png" "${pkgdir}/usr/share/icons/hicolor/48x48/apps/gimp-2.99.png"
  mv "${pkgdir}/usr/share/icons/hicolor/64x64/apps/gimp.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/gimp-2.99.png"
  mv "${pkgdir}/usr/share/icons/hicolor/256x256/apps/gimp.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/gimp-2.99.png"
  mv "${pkgdir}/usr/share/icons/hicolor/scalable/apps/gimp.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/gimp-2.99.svg"
  mv "${pkgdir}/usr/share/metainfo/org.gimp.GIMP.appdata.xml" "${pkgdir}/usr/share/metainfo/org.gimp.GIMP-2.99.appdata.xml"
  sed -i 's/org.gimp.GIMP/org.gimp.GIMP-2.99/g' "${pkgdir}/usr/share/metainfo/org.gimp.GIMP-2.99.appdata.xml"
  sed -i 's/gimp.desktop/gimp-2.99.desktop/g' "${pkgdir}/usr/share/metainfo/org.gimp.GIMP-2.99.appdata.xml"
  mv "${pkgdir}/usr/share/applications/gimp.desktop" "${pkgdir}/usr/share/applications/gimp-2.99.desktop"
  sed -i 's/^\(Name.*\)/\1 (devel)/g' "${pkgdir}/usr/share/applications/gimp-2.99.desktop"
  sed -i 's/Icon=gimp/Icon=gimp-2.99/g' "${pkgdir}/usr/share/applications/gimp-2.99.desktop"
  rm "${pkgdir}/usr/share/man/man1/gimp-console.1"
  rm "${pkgdir}/usr/share/man/man1/gimp.1"
  rm "${pkgdir}/usr/share/man/man1/gimptool.1"
  rm "${pkgdir}/usr/share/man/man5/gimprc.5"
}
