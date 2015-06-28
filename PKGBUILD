# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: megadriver <megadriver at gmx dot com>
# Contributor: Tom Willemsen <tom at ryuslash dot org>
# Contributor: Uwe <moc liamg skcuneelu <-- look what I did there>
# Contributor: Nicolas Pouillard <nicolas dot pouillard at gmail dot com>
# Contributor: Vain

pkgname=mu
pkgver=0.9.12
pkgrel=1
pkgdesc="A collection of utilities for indexing and searching Maildirs"
arch=('i686' 'x86_64')
url="http://www.djcbsoftware.nl/code/mu"
license=('GPL3')
depends=('xapian-core' 'gmime' 'sqlite3')
optdepends=('cronie: Updating index regularly')
conflicts=('mailutils')
install=$pkgname.install
source=($pkgname-$pkgver.tar.gz::https://github.com/djcb/mu/archive/v$pkgver.tar.gz)
sha256sums=('b871124fc7774a2593815f89286671a8f31d7243bb898a8ca454685599f2b9af')

prepare() {
  cd "${srcdir}"/$pkgname-$pkgver/toys/mug

  sed -i 's|MUGDIR|"/usr/share/pixmaps"|g' mug.c
}

build() {
  cd "${srcdir}"/$pkgname-$pkgver

  # msg2pdf and mug will be built only if webkitgtk is installed
  autoreconf --force --install
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver

  make DESTDIR="${pkgdir}" install
  # if msg2pdf and mug were built, install them
  # if not, remove the unneeded mug manpage
  if [ -f toys/msg2pdf/msg2pdf ]; then
    install -m755 toys/msg2pdf/msg2pdf "${pkgdir}"/usr/bin/msg2pdf
  fi
  if [ -f toys/mug/mug ]; then
    install -m755 toys/mug/mug "${pkgdir}"/usr/bin/mug
    install -Dm644 toys/mug/mug.svg "${pkgdir}"/usr/share/pixmaps/mug.svg
  else
    rm "${pkgdir}"/usr/share/man/man1/mug.1
  fi
}
