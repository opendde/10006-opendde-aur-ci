# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgbase=xineliboutput
pkgname=(vdr-xineliboutput xineliboutput-frontends xineliboutput-xineplug)
pkgver=2.1.0
_gitver=ba6aae8c11944f7d11b5d290d7905a010aba3944
_vdrapi=2.4.1
pkgrel=2
url="http://www.sourceforge.net/projects/xineliboutput"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
makedepends=('avahi' 'dbus-glib' 'git' 'glu' 'libcec' 'libextractor' 'libxrandr' 'mesa' "vdr-api=${_vdrapi}" 'xine-lib')
source=("$pkgbase::git://git.code.sf.net/p/xineliboutput/git#commit=$_gitver"
        'xineliboutput_fix_vdrversion_check.diff'
        'xineliboutput-glvnd-1.2-compat.patch'
        "50-$pkgbase.conf")
md5sums=('SKIP'
         'd1f1c591b9f927fd0b86e7ff19c09951'
         'b659774446056f4c3410437314dc7b22'
         'c3b2b26732606b4f95ca95cea6ce2084')

pkgver() {
  cd "${srcdir}/$pkgbase"
  git describe --tags | sed "s/$pkgbase.//g;s/_/./g;s/-/./g"
}

prepare() {
  cd "${srcdir}/$pkgbase"
  patch -p1 -i "$srcdir/xineliboutput_fix_vdrversion_check.diff"
  patch -p1 -i "$srcdir/xineliboutput-glvnd-1.2-compat.patch"
}

build() {
  cd "${srcdir}/$pkgbase"
  ./configure
  make
}

package_vdr-xineliboutput() {
  pkgdesc="X11 and Linux framebuffer front-end for VDR"
  depends=('avahi' 'libextractor' 'libbluray' "vdr-api=${_vdrapi}")
  optdepends=('xineliboutput-xineplug: local output device'
              'xineliboutput-frontends: remote output device')
  backup=("etc/vdr/conf.avail/50-$pkgbase.conf"
          "var/lib/vdr/plugins/$pkgbase/allowed_hosts.conf")
  cd "${srcdir}/$pkgbase"

  mkdir -p "$pkgdir/usr/lib/vdr/plugins"
  make DESTDIR="$pkgdir" install

  rm -r "$pkgdir/usr/bin"
  rm -r "$pkgdir/usr/lib/xine"
  install -Dm644 examples/allowed_hosts.conf "$pkgdir/var/lib/vdr/plugins/$pkgbase/allowed_hosts.conf"
  install -Dm644 "$srcdir/50-$pkgbase.conf" "$pkgdir/etc/vdr/conf.avail/50-$pkgbase.conf"

  chown -R 666:666 "$pkgdir/var/lib/vdr"
}

package_xineliboutput-frontends() {
  pkgdesc="Xineliboutput remote frontends (vdr-fbfe and vdr-sxfe)"
  depends=('libcec' 'xineliboutput-xineplug')
  cd "${srcdir}/$pkgbase"

  mkdir -p "$pkgdir/usr/lib/vdr/plugins"
  make DESTDIR="$pkgdir" install
  rm -r "$pkgdir/usr/lib" "$pkgdir/usr/share"
}

package_xineliboutput-xineplug() {
  pkgdesc="Neccessary xine plugins for remote frontends or local VDR output"
  depends=('dbus-glib' 'libextractor' 'libbluray' 'libxrandr' 'mesa' 'xine-lib')
  optdepends=('nvidia: Required for VDPAU decoding'
              'xorg-server: Required for software decoding')
  cd "${srcdir}/$pkgbase"

  mkdir -p "$pkgdir/usr/lib/vdr/plugins"
  make DESTDIR="$pkgdir" install
  rm -r "$pkgdir/usr/bin" "$pkgdir/usr/lib/vdr" "$pkgdir/usr/share"
}
