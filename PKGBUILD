# Maintainer: Michael DeGuzis <mdeguzis@gmail.com>

pkgname=mrboom
pkgver=4.8
pkgrel=1
pkgdesc="Mr.Boom is a 8 players Bomberman clone"
arch=('i686' 'x86_64')
conflicts=('mrboom')
provides=('mrboom')
url="http://mrboom.mumblecore.org"
license=('GPL2')
makedepends=(
			 'git'
			 'libmodplug'
			 'minizip'
			 'sdl2'
			 'sdl2_mixer'
			)
source=("mrboom::git+https://github.com/Javanaise/mrboom-libretro#tag=${pkgver}"
		'mrboom.desktop'
		'mrboom.svg')
md5sums=(
		 'SKIP'
		 '780a2c3ad5ecd62870d31fd584ab2802'
		 'dcfe4201b7e8a347ee7fc4de6f90c427'
		)

build() {
  
  cd "$srcdir/$pkgname"
  make PREFIX=/usr mrboom LIBSDL2=1

}

package() {

  cd "$srcdir/$pkgname"

  # Install main binary
  install -d "$pkgdir/usr/bin"
  install -d "$pkgdir/usr/man"
  install -d "$pkgdir/usr/share/doc"
  make PREFIX=/usr DESTDIR="$pkgdir" install

  # supplemental files
  install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/mrboom.desktop"
  install -Dm644 "$srcdir/$pkgname.svg" "$pkgdir/usr/share/pixmaps/mrboom.svg"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname"

}
