# Contributor: Patrick Palka <patrick@parcs.ath.cx>
# Contributor: Fabio Pozzim <fabio.pozzi at anche dot no >
# Contributor: Nathan Owe <ndowens04 at gmail>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=tramp
pkgver=2.5.0
pkgrel=1
pkgdesc="emacs extension that provides transparent remote file editing"
arch=('any')
url=http://www.gnu.org/software/tramp/
license=('GPL')
makedepends=('emacs' 'texinfo')
# add texlive-core to the makedepends and comment in the last two lines
# of this PKGBUILD if you want the documentation in dvi-format
source=("ftp://ftp.gnu.org/gnu/tramp/$pkgname-$pkgver.tar.gz"{,.sig})
sha256sums=('c3ee87240f2415bef967eeef335cc39f33a79124885ca9cb57209c121fa73066'
            'SKIP')
validpgpkeys=('C9A04D6E84B6DB548F4585A2AC966DC9E3E1AECA') # Michael Albinus

prepare() {
  cd $pkgname-$pkgver/texi
  [[ -L texinfo.tex ]] || ln -s /usr/share/automake-1.15/texinfo.tex texinfo.tex
}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  mv "$pkgdir"/usr/share/info/$pkgname "$pkgdir"/usr/share/info/$pkgname-new
}

