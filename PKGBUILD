# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=latex-tuda-ci
_pkgname=tuda_latex_templates
pkgver=3.10
pkgrel=1
pkgdesc='TUDa-CI for LaTeX from Technische Universität Darmstadt'
arch=('any')
url='https://github.com/tudace/tuda_latex_templates'
license=('custom')
depends=('latex-tuda-ci-logos')
makedepends=('texlive-core' 'texlive-bin' 'texlive-publishers' 'texlive-latexextra' 'texlive-fontsextra'
              'texlive-bibtexextra' 'texlive-pictures' 'texlive-langcyrillic' 'biber' 'zip')
replaces=('latex-tuddesign' 'latex-tuddesign-thesis' 'latex-tuddesign-fonts')
source=("https://github.com/tudace/${_pkgname}/archive/v${pkgver}/${pkgver}-${_pkgname}.tar.gz")
b2sums=('13b182b0ef646d4c27a91f32d2248d1e0d5c364e0fac20ccd2bdd72e33196e6903473ab73b8eb413c11ee83f1eca4f51a30022efb4179858ae5025e67f34ece9')

prepare() {
  chmod +x ${_pkgname}-${pkgver}/{addlicense,prepare_tuda}.sh
}

build() {
  cd ${_pkgname}-${pkgver}
  export TEXINPUTS=".:${srcdir}/${_pkgname}-${pkgver}/tex:${TEXINPUTS}"
  ./addlicense.sh
  ./prepare_tuda.sh
}

package() {
  cd ${_pkgname}-${pkgver}
  install -Dm644 LICENSE_info "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
  install -dm755 "${pkgdir}"/usr/share/
  cp -r texmf "${pkgdir}"/usr/share/
}
