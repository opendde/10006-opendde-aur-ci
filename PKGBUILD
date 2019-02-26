# Maintainer: Thomas Weißschuh <thomas t-8ch de>

pkgname=mpdris2
pkgver=0.8
pkgrel=1
pkgdesc="MPRIS2 support for MPD"
url="https://github.com/eonpatapon/mpDris2"
arch=('any')
license=('GPL3')
depends=('python-dbus' 'python-gobject2' 'python-mpd2')
makedepends=('intltool')
optdepends=(
  'mutagen: read covers from music files'
  'python-notify: notifications on track change'
)
source=("https://github.com/eonpatapon/mpDris2/archive/${pkgver}.tar.gz")

build() {
  cd "${srcdir}/mpDris2-${pkgver}"
  ./autogen.sh --prefix=/usr --sysconfdir=/etc
  make
  #sed -i "1s/python/python2/" "src/mpDris2"
}

package() {
  cd "${srcdir}/mpDris2-${pkgver}"
  make DESTDIR="$pkgdir" install
}

sha256sums=('b6b15c1fdddf16a6d74485ad09f56ed353a317e149c37475c00a279186da4391')
