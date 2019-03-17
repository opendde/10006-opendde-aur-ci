# Maintainer:  Giovanni 'ItachiSan' Santini <giovannisantini93@yahoo.it>
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>
# Contributor: Pieter Goetschalckx <3.14.e.ter <at> gmail <dot> com>

pkgname=franz
_pkgver=5.0.0
pkgver=${_pkgver//-/_}
pkgrel=1
# Due to the previous "_beta" naming
epoch=1
pkgdesc='Free messaging app for services like WhatsApp, Slack, Messenger and many more.'
arch=(x86_64 i686)
url='https://meetfranz.com'
license=(Apache)
depends=(electron)
makedepends=(npm python2 git)
source=("$pkgname-$pkgver.tar.gz::https://github.com/meetfranz/$pkgname/archive/v$_pkgver.tar.gz"
        'franz.desktop'
        'franz.sh')
sha512sums=('459c40cb95e52aa63334d5e880f146a1158a4f046ab4c943169333e46990cb809bd8094fda440033a245a437c0a5f96b088c5455bbfbe8f8a0605edee5ca6fa3'
            'ef7c06558f60259dd29ead644327a0030c2c26637e51e3ec27a05542efd4752d68a3f4322973f6a90d6658686abce12700a3ad57aff9e517d0c907c952d7a034'
            '8584507cfc2736f4736637925536b2c06063c59cd943346717633564ae88b64c5eea294c8897f1250812478ed493f54a470501e98e99d084a2ff012dff9671f8')

prepare() {
  # Prepare Python 2 for later
  mkdir python2_path
  ln -s `which python2` python2_path/python

  # Small patching
  cd $pkgname-$_pkgver

  # Prevent franz from being launched in dev mode
  sed -i "s|export const isDevMode = .*|export const isDevMode = false;|g" \
    src/environment.js
  sed -i "s|import isDevMode from 'electron-is-dev'|export const isDevMode = false|g" \
    src/index.js

  # Adjust the electron version to use when building
  electron_version="`curl -s https://git.archlinux.org/svntogit/community.git/plain/trunk/PKGBUILD?h=packages/electron | \
                     grep pkgver= | cut -d '=' -f 2`"
  sed -i "s|\(\s\+\"electron\":\).*,|\1 \"$electron_version\",|" package.json
}

build() {
  cd $pkgname-$_pkgver

  # Better configuration for npm cache and calling installed binaries
  export npm_config_cache="$srcdir"/npm_cache
  export PATH="$srcdir/$pkgname-$_pkgver/node_modules/.bin:$srcdir/python2_path:$PATH"

  npm  install
  gulp build
  electron-builder --linux dir
}

package() {
  cd $pkgname-$_pkgver

  # Install the .asar files
  install -dm 755 "$pkgdir"/usr/lib/$pkgname
  cp -r --no-preserve=ownership --preserve=mode out/linux-unpacked/resources "$pkgdir"/usr/lib/$pkgname/

  # Install icon
  install -Dm 644 "$srcdir"/franz.desktop "$pkgdir"/usr/share/applications/franz.desktop
  install -Dm 644 build-helpers/images/icon.png "$pkgdir"/usr/share/icons/franz.png

  # Install run script
  install -Dm 755 "$srcdir"/franz.sh "$pkgdir"/usr/bin/franz
}

