# Contributor: Joel Schaerer <joel.schaerer@laposte.net>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=textext-git
pkgver=20180206
pkgrel=1
pkgdesc="An inkscape extension which lets you add LaTeX equations to your drawings"
arch=('any')
license=('custom:BSD')
url="https://bitbucket.org/pitgarbe/textext"
provides=('textext')
conflicts=('textext')
makedepends=('mercurial')
depends=('inkscape' 'python2' 'texlive-core')
optdepends=('pygtk' 'python2-lxml' 'pdf2svg' 'pstoedit' 'ghostscript' 'imagemagick6')
source=("textext::git+https://github.com/textext/textext.git")
md5sums=('SKIP')

prepare() {
  cd  textext/
  sed -i '1s|python\>|python2|' *.py
}

pkgver() {
  cd textext
  echo $(git log -1 --format="%cd" --date=short | sed 's|-||g')
}

package() {
  cd textext/
  install -d "$pkgdir"/usr/share/inkscape/extensions
  for _i in asktext.py default_packages.tex latexlogparser.py textext.{inx,py} typesetter.py win_app_paths.py
  do install ${_i} "$pkgdir"/usr/share/inkscape/extensions/$_i
  done
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  install LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
}


