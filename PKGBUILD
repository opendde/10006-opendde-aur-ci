# Contributor: Patrick Palka <patrick@parcs.ath.cx>
# Contributor: Fabio Pozzim <fabio.pozzi at anche dot no >
# Contributor: Nathan Owe <ndowens04 at gmail>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=tramp
pkgver=2.3.4
pkgrel=1
pkgdesc="emacs extension that provides transparent remote file editing"
arch=('any')
url=http://www.gnu.org/software/tramp/
license=('GPL')
makedepends=('emacs' 'texinfo')
# add texlive-core to the makedepends and comment in the last two lines
# of this PKGBUILD if you want the documentation in dvi-format
source=("ftp://ftp.gnu.org/gnu/tramp/$pkgname-$pkgver.tar.gz"{,.sig})
sha256sums=('1d755d1c46eedad7e8682d98f45629504ff802dd7006f18120a7b80de14c898b'
            'SKIP')
validpgpkeys=('C9A04D6E84B6DB548F4585A2AC966DC9E3E1AECA') # Michael Albinus

prepare() {
  cd $pkgname-$pkgver/texi
  [[ -L texinfo.tex ]] || ln -s /usr/share/automake-1.15/texinfo.tex texinfo.tex
}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --with-contrib 
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  mv $pkgdir/usr/share/info/$pkgname $pkgdir/usr/share/info/$pkgname-new
}

