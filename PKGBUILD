# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgbase=easyrpg-tools-git
pkgname=(easyrpg-tools-git xyz-thumbnailer-git)
pkgver=r129.9f3fcc3
pkgrel=1
pkgdesc="EasyRPG tools for RPG Maker 2000/2003 files (development version)"
arch=('i686' 'x86_64')
url="https://easyrpg.org/tools/"
license=('MIT' 'GPL3' 'custom')
makedepends=('git' 'gcc-libs' 'liblcf-git' 'sdl2_image' 'libpng' 'zlib')
source=(${pkgname%-*}::"git+https://github.com/EasyRPG/Tools.git")
md5sums=('SKIP')

pkgver() {
  cd ${pkgname%-*}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${pkgname%-*}

  ./bootstrap
  ./configure --prefix=/usr
  make
}

package_easyrpg-tools-git() {
  depends=('gcc-libs' 'liblcf-git' 'sdl2_image' 'libpng' 'zlib')
  provides=('lmu2png' 'png2xyz' 'xyz2png' 'xyzcrush' 'gencache')

  cd ${pkgname%-*}

  make DESTDIR="$pkgdir" install

  # license
  install -Dm0644 lmu2png/COPYING "$pkgdir"/usr/share/licenses/$pkgname/lmu2png-COPYING
}

package_xyz-thumbnailer-git() {
  pkgdesc="Thumbnailer for XYZ images (development version)"
  depends=('xyz2png' 'shared-mime-info' 'sh')
  arch=('any')
  license=('MIT')

  cd easyrpg-tools/xyz-thumbnailer/linux

  make PREFIX=/usr DESTDIR="$pkgdir" install
}
