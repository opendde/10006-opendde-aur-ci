# Maintainer: Andrés J. Díaz <ajdiaz@ajdiaz.me>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Andrew Stubbs <andrew.stubbs@gmail.com>

_npmname=thumbsup
_npmver=2.14.0
pkgname=nodejs-thumbsup # All lowercase
pkgver=${_npmver//-/}
pkgrel=1
pkgdesc="Photo / video gallery generator"
arch=(any)
url="https://github.com/thumbsup/thumbsup#readme"
license=()
depends=('nodejs' 'npm' 'perl-image-exiftool' 'graphicsmagick')
optdepends=('ffmpeg: for video support')
makedepends=('git')
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha256sums=('2a82213a851b049539a819b39c3177cd252e2f2f2741bd31e36910b7566c781a')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm update
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
