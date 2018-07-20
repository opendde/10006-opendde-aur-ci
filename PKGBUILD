# Maintainer: pingplug <pingplug@foxmail.com>
# Contributor: Schala Zeal <schalaalexiazeal@gmail.com>

_commit=a03d16a850253eae321be4bd2d134a9c6a1ed6ce  # tags/1.42.2^0
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgname=mingw-w64-pango
pkgver=1.42.2
pkgrel=1
pkgdesc="A library for layout and rendering of text (mingw-w64)"
arch=('any')
url="http://www.pango.org"
license=('LGPL')
depends=('mingw-w64-harfbuzz'
         'mingw-w64-fribidi'
         'mingw-w64-fontconfig'
         'mingw-w64-freetype2'
         'mingw-w64-cairo')
optdepends=('mingw-w64-libthai: libthai support')
makedepends=('gtk-doc'
             'gobject-introspection'
             'mingw-w64-meson'
             'mingw-w64-wine'
             'git')
options=('!strip' 'staticlibs' '!buildflags')
source=("git+https://gitlab.gnome.org/GNOME/pango.git#commit=${_commit}")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/pango"
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd "${srcdir}/pango"

  # disable help2man when cross building
  sed -i "s/^if help2man.found()/if help2man.found() and not meson.is_cross_build()/g" utils/meson.build
}

build() {
  export NEED_WINE=1
  cd "${srcdir}/pango"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-meson \
      --buildtype=release \
      --default-library=both \
      -D 'enable_docs=false' \
      -D 'gir=false' \
      ..
    ninja
    popd
  done
}

package() {
  export NEED_WINE=1
  for _arch in ${_architectures}; do
    cd "${srcdir}/pango/build-${_arch}"
    DESTDIR="${pkgdir}" ninja install
    rm -r "${pkgdir}/usr/${_arch}/lib/installed-tests"
    rm -r "${pkgdir}/usr/${_arch}/share"
    find "${pkgdir}/usr/${_arch}" -name '*.exe' -exec ${_arch}-strip {} \;
    find "${pkgdir}/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "${pkgdir}/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs ${_arch}-strip -g
  done
}

# vim:set ts=2 sw=2 et:
