# Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>
# Contributor: Nerdy Espeon <nerdyespeon@gmail.com>
# Contributor: Kirill A. Shutemov <kirill+arch@shutemov.name>

pkgname=dwarftherapist-git
epoch=1
pkgver=33.0.0_r0_g72e768f
pkgrel=1
pkgdesc="Heavily modified version of the original Dwarf Therapist."
url="https://github.com/splintermind/Dwarf-Therapist"
arch=('x86_64' 'i686')
license=('MIT')
depends=('qt5-declarative' 'hicolor-icon-theme')
makedepends=('git' 'texlive-latexextra')
install="dwarftherapist.install"
source=($pkgname::git+"https://github.com/splintermind/Dwarf-Therapist.git#branch=DF2016"
       'dwarftherapist.desktop'
       'dwarftherapist.install')
md5sums=('SKIP'
         '32c80fd6e3b86900c1677b4e2859b07b'
         'caae1175c3bb8104bdc9e3014e648e57')

pkgver() {
  cd $pkgname
  _curtag="$(git rev-list --tags --max-count=1)"
  _tagver="$(git describe --tags $_curtag | sed 's:^v::')"
  _commits="$(git log v${_tagver}..HEAD --oneline | wc -l)"
  _sha="$(git rev-parse --short HEAD)"
  printf "%s_r%s_g%s" $_tagver $_commits $_sha | sed 's:-:_:g'
}

build() {
  cd $pkgname
  qmake -qt=5 PREFIX=/usr
  make
}

package() {
  cd $pkgname
  make INSTALL_ROOT="$pkgdir" install
  rm "$pkgdir/usr/bin/dwarftherapist"
  mv "$pkgdir/usr/bin/DwarfTherapist" "$pkgdir/usr/bin/dwarftherapist"
  install -Dm644 "$srcdir/dwarftherapist.desktop" \
    "$pkgdir"/usr/share/applications/dwarftherapist.desktop
  install -Dm644 resources/img/hammer.png \
    "$pkgdir"/usr/share/icons/hicolor/128x128/apps/dwarftherapist.png
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "doc/Dwarf Therapist.pdf" \
    "$pkgdir/usr/share/doc/dwarftherapist/Dwarf Therapist.pdf"
}

# vim:set ts=2 sw=2 et:
