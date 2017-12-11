# Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>
# Contributor: Jack L. Frost <fbt@fleshless.org>
# Contributor: Corelli <corelli AT sent DOT com>
# Contributor: BartÅ‚omiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: intelfx <intelfx100 [at] gmail [dot] com>
# Contributor: Behem0th <grantipak@gmail.com> 
# Contributor: zman0900 <zman0900@gmail.com>

pkgname=freshplayerplugin
pkgver=0.3.8
pkgrel=1
pkgdesc='PPAPI-host NPAPI-plugin adapter.'
arch=('i686' 'x86_64')
url='https://github.com/i-rinat/freshplayerplugin'
license=('MIT')
depends=('alsa-lib' 'cairo' 'ffmpeg' 'freetype2' 'glib2' 'icu' 'jack'
         'libevent' 'libgl' 'libsoxr' 'libva' 'libvdpau' 'libx11'
         'libxcursor' 'libxrandr' 'libxrender' 'openssl' 'pango'
         'v4l-utils' 'pepper-flash')
makedepends=('libdrm' 'cmake' 'ragel')
source=($pkgname-$pkgver.tar.gz::"${url}/archive/v${pkgver}.tar.gz")
sha1sums=('b2fd7b47f5896eb25acc1cd0aa9ea428c6743828')

build() {
  cd "${pkgname}-${pkgver}"

  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  install -Dm644 data/freshwrapper.conf.example "${pkgdir}/usr/share/${pkgname}/freshwrapper.conf.example"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

