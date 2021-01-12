pkgname=rygel-git
_pkgname=rygel
pkgver=0.40.0+14+g8cdee188
pkgrel=1
epoch=1
pkgdesc="UPnP AV MediaServer and MediaRenderer"
url="https://wiki.gnome.org/Projects/Rygel"
arch=(x86_64)
license=(LGPL)
depends=('gupnp' 'gupnp-av' 'gupnp-dlna' 'libgee' 'gtk3' 'libunistring' 'tracker3'
         'libmediaart' 'gst-editing-services')
makedepends=('vala' 'gobject-introspection' 'git' 'meson')
optdepends=('gst-plugins-base: Extra media codecs'
            'gst-plugins-good: Extra media codecs'
            'gst-plugins-bad: Extra media codecs'
            'gst-plugins-ugly: Extra media codecs'
            'gst-libav: Extra media codecs'
            'tracker3-miners: Share indexed media files')
provides=('rygel')
conflicts=('rygel')
backup=(etc/rygel.conf)
source=("git+https://gitlab.gnome.org/GNOME/rygel.git")
b2sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/^RYGEL//;s/^rygel-//;s/_/./g;s/-/+/g'
}

build() {
  arch-meson $_pkgname build \
    -D plugins=external,gst-launch,lms,media-export,mpris,playbin,ruih,tracker3
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
