# Maintainer: jdn06 <jdn06.jdn06@outlook.fr>

pkgname=pyromaths
pkgver=18.9.2
pkgrel=1
pkgdesc="French program to create mathematical exercises and models, cli version"
arch=(any)
license=('GPL3')
depends=('python-lxml' 'texlive-pstricks' 'texlive-latexextra' 'texlive-fontsextra' 'texlive-pictures')
makedepends=('python-setuptools')
optdepends=()

conflicts=(pyromaths-git)

source=(https://files.pythonhosted.org/packages/cf/85/30902fa429bf491eeddc877ae7d26377e402445b89828fe319a552a96564/$pkgname-$pkgver.tar.gz)
sha256sums=('21c572c3eb6b940b9121a76f8c4f60ed3258b10ec5eee490c2d274aa529957f3')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/"
}

