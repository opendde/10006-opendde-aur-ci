# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=sfeed
pkgver=1.2
pkgrel=1
pkgdesc='RSS and Atom parser'
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url='https://codemadness.org/sfeed-simple-feed-parser.html'
_url_source='https://codemadness.org/releases/sfeed'
license=('ISC')
depends=('sh' 'ncurses')
optdepends=('curl: sfeed_update script'
    'xclip: used by sfeed_curses for yanking the URL or enclosure'
    'xdg-utils: for xdg-open, used by sfeed_curses as a plumber by default'
    'awk: used by the sfeed_content and sfeed_markread script'
    'lynx: used by the sfeed_content script to convert HTML content'
)
provides=('sfeed-curses')
conflicts=('sfeed-curses')
source=("${_url_source}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('7d3cdaf8dcc6582f6655330f82f8a57ca37c4b9c84ff995b09b7b7fb9fe58b58')

build() {
  # To change the theme for sfeed_curses you can set SFEED_THEME. See the themes directory for the theme names.
  make SFEED_CPPFLAGS="-D_DEFAULT_SOURCE" SFEED_THEME="mono" -C "${pkgname}-${pkgver}"
}

package() {
  make DESTDIR="${pkgdir}" PREFIX='/usr' MANPREFIX='/usr/share/man' -C "${pkgname}-${pkgver}" install
  install -Dvm644 "${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
