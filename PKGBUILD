# Maintainer: robertfoster
# Contributor: Bleuzen <supgesu@gmail.com>
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>
# Contributor: Wellington <wellingtonwallace@gmail.com>

pkgname=easyeffects-git
pkgver=6.0.0.r0.g2ee3f0b7
pkgrel=1
pkgdesc='Audio Effects for Pipewire applications'
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url='https://github.com/wwmm/easyeffects'
license=('GPL3')
depends=('gtkmm-4.0' 'glibmm-2.68' 'pipewire' 'lilv' 'lv2' 'libsigc++-3.0' 'libsndfile' 'libsamplerate' 'zita-convolver' 
         'libebur128' 'rnnoise' 'rubberband' 'fftw' 'libbs2b' 'speexdsp' 'nlohmann-json')
makedepends=('meson' 'git' 'itstool' 'appstream-glib')
optdepends=('calf: limiter, compressor exciter, bass enhancer and others'
            'lsp-plugins: equalizer, delay'
            'zam-plugins: maximizer'
            'yelp: in-app help')
conflicts=("${pkgname%%-git}")
provides=("${pkgname%%-git}")
source=("${pkgname%%-git}::git+${url}")
sha512sums=('SKIP')

pkgver() {
  cd "${pkgname%%-git}"
  printf "%s" "$(git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')"
}

build() {
  arch-meson "${pkgname%%-git}" build
  meson compile -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
}
