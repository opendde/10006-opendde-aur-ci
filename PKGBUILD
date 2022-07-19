# Maintainer: Cédric Bellegarde <cedric.bellegarde@adishatz.org>

pkgname=geary-preview
pkgver=40.0.r19.gf8c2e697a
pkgrel=1
epoch=1
pkgdesc='A lightweight email client for the GNOME desktop
Preview version by Geary maintainer:
- Thunderbird autoconfig support
- Mark messages menu state
- Reworked move messages menu
- Fixed contact search
- More options to show images
- Fixed touch support
'
arch=(x86_64)
url=https://wiki.gnome.org/Apps/Geary
license=(GPL3)
groups=(gnome-extra)
provides=(geary)
conflicts=(geary)
depends=(
  cairo
  enchant
  folks
  gcr
  gdk-pixbuf2
  glib2
  gmime3
  gnome-online-accounts
  gsound
  gspell
  gtk3
  iso-codes
  libcanberra
  libgee
  libhandy
  libnotify
  libpeas
  libsecret
  libsoup
  libstemmer
  libxml2
  libytnef
  org.freedesktop.secrets
  pango
  sqlite
  webkit2gtk
)
makedepends=(
  appstream-glib
  cmake
  git
  gobject-introspection
  meson
  vala
  yelp-tools
)
source=(git+https://gitlab.gnome.org/GNOME/geary.git)
sha256sums=(SKIP)

prepare() {
  cd geary
  git checkout gnumdk/stable
}

pkgver() {
  cd geary
  git describe --long | sed 's/^gnome-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson geary build \
    -Dprofile=release
  meson compile -C build
}

package() {
  meson install -C build \
    --destdir "${pkgdir}"
}

# vim: ts=2 sw=2 et:

