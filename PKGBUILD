# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com> 
# Contributor: Slithery <aur [at] slithery [dot] uk>

pkgname=linode-cli
pkgver=2.15.0
pkgrel=1
pkgdesc="Linode API wrapper"
arch=('any')
url="https://github.com/linode/linode-cli"
license=('BSD')
makedepends=('python-wheel' 
	     'python2-wheel')
depends=('python-colorclass' 
	 'python2-colorclass' 
	 'python-terminaltables' 
	 'python2-terminaltables' 
	 'python-requests' 
	 'python2-requests' 
	 'python-yaml' 
	 'python2-yaml' 
	 'python2-enum34')
replaces=('linode-cli-dev')
install="${pkgname}".install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/linode/linode-cli/archive/${pkgver}.tar.gz"
	'enum34-extra-requires.patch')
sha256sums=('acc94592f87f9e694cd91b7ae380c737fdde18db6e4536419930050a73c67f7e'
            '3c05e163748ec607c3f6d62587e04911af2e593e25635c7acef39cd2d03f9f2e')

prepare() {
  cd "${pkgname}-${pkgver}" 
  patch --strip=2 --input="${srcdir}/enum34-extra-requires.patch"
}

build() {
  cd "${pkgname}-${pkgver}" 
  make build
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
