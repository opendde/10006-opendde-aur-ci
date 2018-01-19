# Maintainer: Eisfreak7 <eisfreak7@gmail.com>
# modified version of the khard-git package by David Runge <dave@sleepmap.de>

pkgname=khard
pkgver=0.12.1
pkgrel=2
pkgdesc="Console CardDAV client"
license=("GPL3")
url="https://github.com/scheibler/khard"
depends=('python-configobj' 'python-vobject' 'python-atomicwrites' 'python-ruamel-yaml' 'python-unidecode')
makedepends=('python-setuptools')
optdepends=('vdirsyncer: Synchronization of address books with a DAV server.')
            # Apparently there is no python3 alternative yet
            # If you depend on it, look (https://github.com/scheibler/khard)[here] for a
            # guide to install it anyway.
            # 'python2-caldavclientlibrary-svn: Create and remove address books on the DAV server using davcontroller utility.'
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
md5sums=('9a810bfce0c27cc5dfbd7210a5745e1a')
install="${pkgname}.install"
provides=('khard' 'davcontroller')
conflicts=('khard')
arch=('any')
options=(!emptydirs)

package() {
	cd "$srcdir/$pkgname-$pkgver"

	python setup.py install --root="$pkgdir"
	install -Dm 644 misc/khard/khard.conf.example "${pkgdir}/usr/share/doc/khard/khard.conf.example"
	install -Dm 644 misc/zsh/_khard "${pkgdir}/usr/share/zsh/site-functions/_khard"
	install -Dm 644 AUTHORS "${pkgdir}/usr/share/doc/khard/AUTHORS"
	install -Dm 644 CHANGES "${pkgdir}/usr/share/doc/khard/CHANGES"
	install -Dm 644 README.md "${pkgdir}/usr/share/doc/khard/README.md"
}
