# Maintainer: Llewelyn Trahaearn <WoefulDerelict at GMail dot com>
# Contributor: falkTX <falktx at gmail dot com>
pkgname=cadence
pkgver=0.8.1
pkgrel=2
pkgdesc="JACK Audio Toolbox"
arch=('i686' 'x86_64')
url="http://kxstudio.sf.net/cadence"
license=('GPL2')
depends=('python-pyqt4' 'python-dbus' 'jack' 'qt4')
optdepends=(
  'a2jmidid: ALSA to Jack MIDI bridge'
  'pulseaudio: pulseaudio to jack bridge'
  'python-rdflib: LADSPA-RDF support in Carla'
  'zita-ajbridge: ALSA to Jack bridge'
  'jack_capture: recording via Cadence-Render'
  'ladish: session management via Claudia'
)
provides=('cadence')
conflicts=('cadence')
install=${pkgname}.install
source=("https://downloads.sourceforge.net/project/kxstudio/Releases/${pkgname}/Cadence-${pkgver}-src.tar.bz2")
sha512sums=('333a8532859cfa4ca61446b6b136baa7930d2a9d1acbb55e2ee296998604c0e8e3effd5e21fe3154caf8ae6534190a0f592b070b671164ccfd647567ba2cc33f')

build() {
  cd "${srcdir}/Cadence-${pkgver}"
  make
}

package() {
  cd "${srcdir}/Cadence-${pkgver}"
  make DESTDIR="${pkgdir}" PREFIX=/usr install
}
