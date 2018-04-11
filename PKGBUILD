# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgbase=wxwidgets-light
pkgname=('wxbase-light'
         'wxgtk2-light'
         'wxgtk3-light'
         'wxcommon-light'
         )
pkgver=3.0.4
pkgrel=2
pkgdesc="wxWidgets suite for Base and GTK2 and GTK3 toolkits (GNOME/GStreamer free!)"
arch=('x86_64')
url='http://wxwidgets.org'
license=('custom:wxWindows')
makedepends=('git'
             'glu'
             'bash'
             'gtk2'
             'gtk3'
             'libsm'
             'libgl'
             'libnotify'
             )
source=("wxwidgets::git+https://github.com/wxWidgets/wxWidgets.git#tag=v${pkgver}"
        'make-abicheck-non-fatal.patch'
        )
sha256sums=('SKIP'
            '46a1bb97d69163547da13d5e23a4c73e68de27ee601da5d2fb5bc5c417931453'
            )

prepare() {
  mkdir -p build-{base,gtk{2,3}}

  cd wxwidgets

  # C++ ABI check is too strict and breaks with GCC 5.1
  # https://bugzilla.redhat.com/show_bug.cgi?id=1200611
  patch -Np1 -i "${srcdir}/make-abicheck-non-fatal.patch"
}

build() {
  msg2 "Build WxBASE"
  cd "${srcdir}/build-base"
  ../wxwidgets/configure \
    --prefix=/usr \
    --libdir=/usr/lib \
    --with-regex=builtin \
    --disable-{precomp-headers,gui}

  make
  make -C ../wxwidgets/locale allmo

  msg2 "Build WxGTK2"
  cd "${srcdir}/build-gtk2"
  ../wxwidgets/configure \
    --prefix=/usr \
    --libdir=/usr/lib \
    --with-gtk=2 \
    --with-lib{jpeg,png,tiff,xpm}=sys \
    --with-regex=builtin \
    --with-{opengl,sdl} \
    --enable-graphics_ctx \
    --without-gnomevfs \
    --disable-{gtktest,sdltest,precomp-headers,mediactrl,webview}

  make
  make -C ../wxwidgets/locale allmo

  msg2 "Build WxGTK3"
  cd "${srcdir}/build-gtk3"
  ../wxwidgets/configure \
    --prefix=/usr \
    --libdir=/usr/lib \
    --with-gtk=3 \
    --with-lib{jpeg,png,tiff,xpm}=sys \
    --with-regex=builtin \
    --with-{opengl,sdl} \
    --enable-graphics_ctx \
    --without-gnomevfs \
    --disable-{gtktest,sdltest,precomp-headers,mediactrl,webview}

  make
  make -C ../wxwidgets/locale allmo
}

package_wxbase-light() {
  pkgdesc="wxWidgets Base (GNOME/GStreamer free!)"
  depends=('bash'
           'expat'
           'zlib'
           )
  provides=('wxbase')
  conflicts=('wxbase')
  options=('!emptydirs')

  make -C build-base DESTDIR="${pkgdir}" install

  mv "${pkgdir}/usr/bin/wx-config" "${pkgdir}/usr/bin/wx-config-base"
  rm -fr "${pkgdir}/usr/include"
  rm -fr "${pkgdir}/usr/share"

  install -Dm644 wxwidgets/docs/licence.txt "${pkgdir}/usr/share/licenses/wxbase-light/LICENSE"
}

package_wxgtk2-light() {
  pkgdesc="wxWidgets GTK2 Toolkit (GNOME/GStreamer free!)"
  depends=('wxcommon-light'
           'libgl'
           'gtk2'
           'libsm'
           'sdl2'
           'libnotify'
           )
  provides=('wxgtk'
            'wxgtk2'
            )
  conflicts=('wxgtk'
             'wxgtk2'
             )
  options=('!emptydirs')

  make -C build-gtk2 DESTDIR="${pkgdir}" install

  cp -P "${pkgdir}/usr/bin/wx-config" "${pkgdir}/usr/bin/wx-config-gtk2"
  rm -fr "${pkgdir}/usr/bin/"wxrc{,-3.0}
  rm -fr "${pkgdir}/usr/include"
  rm -fr "${pkgdir}/usr/lib/"*baseu*
  rm -fr "${pkgdir}/usr/share"

  install -Dm644 wxwidgets/docs/licence.txt "${pkgdir}/usr/share/licenses/wxgtk2-light/LICENSE"
}

package_wxgtk3-light() {
  pkgdesc="wxWidgets GTK3 Toolkit (GNOME/GStreamer free!)"
  depends=('wxcommon-light'
           'gtk3'
           'libsm'
           'sdl2'
           'libnotify'
           )
  provides=('wxgtk3')
  conflicts=('wxgtk3')
  options=('!emptydirs')

  make -C build-gtk3 DESTDIR="${pkgdir}" install

  mv "${pkgdir}/usr/bin/wx-config" "${pkgdir}/usr/bin/wx-config-gtk3"
  rm -fr "${pkgdir}/usr/bin/"wxrc{,-3.0}
  rm -fr "${pkgdir}/usr/include"
  rm -fr "${pkgdir}/usr/lib/"*baseu*
  rm -fr "${pkgdir}/usr/share"

  install -Dm644 wxwidgets/docs/licence.txt "${pkgdir}/usr/share/licenses/wxgtk3-light/LICENSE"
}

package_wxcommon-light() {
  pkgdesc="wxWidgets common (GNOME/GStreamer free!)"
  depends=('wxbase-light')
  provides=('wxcommon'
            'wxgtk-common'
            )
  conflicts=('wxcommon'
             'wxgtk-common'
             )
  options=('!emptydirs')

  make -C build-gtk2 DESTDIR="${pkgdir}" install
  make -C build-gtk3 DESTDIR="${pkgdir}" install
  make -C build-base DESTDIR="${pkgdir}" install

  rm -fr "${pkgdir}/usr/bin/wx-config"
  rm -fr "${pkgdir}/usr/lib"

  install -Dm644 wxwidgets/docs/licence.txt "${pkgdir}/usr/share/licenses/wxcommon-light/LICENSE"
}
