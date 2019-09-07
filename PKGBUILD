# Maintainer: Alexandros Theodotou <alex at zrythm dot org>
pkgname=zrythm
pkgver=0.6.323
pkgrel=1
pkgdesc='a highly automated and intuitive digital audio workstation'
arch=('x86_64' 'i686')
url="https://www.zrythm.org"
license=('AGPL3')
depends=('gtk3' 'lilv' 'libx11' 'jack' 'libsndfile'
  'libyaml'  'libsamplerate' 'alsa-lib' 'fftw')
makedepends=(
  'python' 'gettext' 'sed'
  'meson' 'ninja' 'help2man' 'python-sphinx'
  'ladspa' 'lv2')
optdepends=('portaudio: portaudio backend'
            'qt5-base: for embedding qt5 plugin UIs')
conflicts=('zrythm-git')
#source=("https://download.savannah.nongnu.org/releases/$pkgname/$pkgname-$pkgver.tar.xz"{,.asc})
source=("https://download-mirror.savannah.nongnu.org/releases/$pkgname/$pkgname-$pkgver.tar.xz"{,.asc})
sha256sums=('2a1f454039808632057c271b3b3609f235baec8c678ee64c9c53c81276f01570'
            'SKIP')
validpgpkeys=('48132384AD3DF7D86E254B83022EAE42313D70F3')

build() {
  cd "$pkgname-$pkgver"
  meson build --prefix=/usr -Denable_tests=true -Duser_manual=true -Dmanpage=true
  ninja -C build
}

check() {
  cd "$pkgname-$pkgver"
  ninja -C build test
}

package() {
  cd "$pkgname-$pkgver"
  install -vDm 644 AUTHORS CONTRIBUTING.md CHANGELOG.md README.md THANKS TRANSLATORS \
    -t "${pkgdir}/usr/share/doc/${pkgname}/"
  DESTDIR="${pkgdir}/" ninja -C build install
}
