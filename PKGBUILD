# Maintainer: Mauro Santos <registo.mailling@gmail.com>

pkgname='hunspell-pt_pt-preao'
_pkgname='hunspell-pt_PT-preao'
pkgver=20201212
pkgrel=1
pkgdesc="Portuguese (European, pre-orthographic agreement) hunspell dictionaries"
arch=('any')
url="http://natura.di.uminho.pt/download/sources/Dictionaries/hunspell/"
license=('GPL' 'LGPL' 'MPL')
optdepends=('hunspell:	the spell checking libraries and apps')
source=("http://natura.di.uminho.pt/download/sources/Dictionaries/hunspell/$_pkgname-$pkgver.tar.gz")
sha256sums=('7434e33c3d7cfc287171dc434fdf2ea4986f41578e32ad191331f3430afea222')

package() {
  cd $srcdir/$_pkgname-$pkgver
  install -dm755 $pkgdir/usr/share/hunspell
  install -m644 pt_PT-preao.* $pkgdir/usr/share/hunspell

  # the symlinks
  install -dm755 $pkgdir/usr/share/myspell/dicts
  pushd $pkgdir/usr/share/myspell/dicts
    for file in $pkgdir/usr/share/hunspell/*; do
      ln -sv /usr/share/hunspell/$(basename ${file}) .
    done
  popd

  # docs
  install -dm755 $pkgdir/usr/share/doc/$pkgname
  install -m644 README_pt_PT.txt $pkgdir/usr/share/doc/$pkgname

  # licences
  install -dm755 $pkgdir/usr/share/licenses/$pkgname/
  install -m644 COPYING $pkgdir/usr/share/licenses/$pkgname
}
