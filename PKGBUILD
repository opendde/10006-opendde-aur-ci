# Maintainer: robertfoster
# Contributor: Bleuzen <supgesu@gmail.com>
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>
# Contributor: Wellington <wellingtonwallace@gmail.com>

pkgbase=pulseeffects-git
pkgname=("${pkgbase}" "gst-plugins-${pkgbase}")
pkgver=5.0.0.r12.gd18451b3
pkgrel=1
pkgdesc='Audio Effects for Pipewire applications'
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url='https://github.com/wwmm/pulseeffects'
license=('GPL3')
makedepends=('appstream-glib' 'boost' 'itstool' 'meson'
  'pipewire' 'rnnoise' 'rubberband' 'zam-plugins')
source=("${pkgbase%%-git}::git+https://github.com/wwmm/pulseeffects.git")
sha512sums=('SKIP')

pkgver() {
  cd "${pkgbase%%-git}"
  printf "%s" "$(git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')"
}

build() {
  arch-meson ${pkgbase%%-git} build
  meson compile -C build
}

package_pulseeffects-git() {
  pkgdesc="Audio Effects for Pipewire Applications"
  depends=('boost-libs' 'calf' 'glibmm' 'gst-plugin-gtk' 'gst-plugins-bad'
    'gst-plugins-pulseeffects' 'gstreamer' 'gtk3' 'gtkmm3' 'libsigc++'
    'lilv' 'lsp-plugins' 'pipewire' 'pipewire-pulse' 'yelp')
  optdepends=('rubberband: pitch shifting'
    'zam-plugins: maximizer')
  conflicts=('pulseeffects')
  provides=('pulseeffects')

  DESTDIR="${pkgdir}" meson install -C build
  mv "${pkgdir}/usr/lib" .
}

package_gst-plugins-pulseeffects-git() {
  pkgdesc="Audio Effects for Pulseaudio Applications - gstreamer plugins"
  depends=('gst-plugins-base' 'gstreamer' 'libebur128' 'rnnoise'
    'libsamplerate' 'libsndfile' 'zita-convolver')
  conflicts=('gst-plugins-pulseeffects')
  provides=('gst-plugins-pulseeffects')

  install -d "${pkgdir}/usr"
  mv lib "${pkgdir}/usr"
}
