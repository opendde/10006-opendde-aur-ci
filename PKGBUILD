# Maintainer: Gabriel B. Casella <gbc921@gmail.com>
# Contributor: Rafael Beraldo <rafaelluisberaldo@gmail.com>

pkgname=abntex2
pkgver=1.9.6
pkgrel=1
pkgdesc="a LaTeX class for writing ABNT-compliant documents"
arch=('i686' 'x86_64')
url="https://github.com/abntex/abntex2"
license=('LPPL')
depends=('texlive-core')
source=("http://dl.bintray.com/laurocesar/generic/${pkgname}.tds-${pkgver}.tar.gz")
conflicts=('texlive-publishers')
sha1sums=('044c074cb263bb7a9cb51f3ce394a15264064190')

install=abntex2.install

package() {
  install -dm755 "${pkgdir}/usr/share/texmf-dist/"

  for subdir in tex doc bibtex ; do
    cp -r "${srcdir}/${subdir}" "${pkgdir}/usr/share/texmf-dist/"
  done
}

# vim:set ts=2 sw=2 et:
