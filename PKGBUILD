# Maintainer: Bruno Santos <brunomanuelsantos@tecnico.ulisboa.pt>

upstream_name=hawkmoth
pkgname=python-sphinx-hawkmoth
pkgver=0.3
pkgrel=2
pkgdesc='Sphinx autodoc C extension'
arch=('i686' 'x86_64')
url='https://github.com/jnikula/hawkmoth'
license=('BSD2')
depends=('python-sphinx' 'clang')
source=('https://github.com/jnikula/hawkmoth/archive/v'$pkgver'.tar.gz')
md5sums=('b72c47a44d482bc7894766ded4a779eb')

package() {
	dest=$pkgdir/usr/lib/python3.7/site-packages/$upstream_name
	mkdir -p $dest
	cp -r $srcdir/$upstream_name-$pkgver/$upstream_name/* $dest
}
