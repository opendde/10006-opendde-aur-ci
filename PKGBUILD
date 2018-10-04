# Maintainer: max.bra <max dot bra at alice dot it>

pkgname=hub-kids
pkgver=1.0
pkgrel=1
pkgdesc="La piattaforma facile, gratuita e innovativa per la didattica digitale."
arch=('x86_64')
url="https://www.hubscuola.it/download-app"
license=('unknown')
depends=('sdl2' 'unzip')
optdepends=(
'chromium: a modern browser for the application to work'
'firefox: a modern browser for the application to work'
'google-chrome: a modern browser for the application to work'
'evince: a pdf viewer'
'epdfview: a pdf viewer'
'qpdfview: a pdf viewer'
'mupdf: a pdf viewer'
)
options=(!strip)

_debname=hubkids-1.0_amd64.deb

source=(http://www.mondadorieducation.it/media/contenuti/appdilettura/kidslinux.zip)
md5sums=('4497dfe4b6e2516c11e3ae1480a01c25')

prepare() {
  cd "$srcdir"
  msg2 "Decompressing Debian package..."
  ar xv "${_debname}" > /dev/null
  tar -xf data.tar.xz > /dev/null

  find ./{etc,usr} -type d -exec chmod 755 '{}' \;
}

package() {
  cd "$srcdir"
  cp -dpr --no-preserve=ownership {opt,usr} "$pkgdir"
}
