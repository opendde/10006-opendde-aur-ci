# Maintainer: Devin Christensen <quixoten at gmail dot com>
pkgname=ttf-droid-sans-mono-dotted-powerline-git
pkgver=r78.97dc451
pkgrel=1
pkgdesc="Droid Sans Mono Dotted for Powerline"
arch=('any')
url=('https://github.com/powerline/fonts')
license=('custom:Apache License, Version 2.0')
depends=(fontconfig xorg-font-utils )
makedepends=('git')
conflicts=(powerline-fonts powerline-fonts-git)
install=$pkgname.install
source=('git://github.com/powerline/fonts.git')
md5sums=('SKIP')

pkgver() {
  cd fonts
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd $srcdir/fonts/DroidSansMonoDotted
  find . -iname '*.ttf' -execdir install -Dm644 {} $pkgdir/usr/share/fonts/TTF/{} \;
  install -Dm644 LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
