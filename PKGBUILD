# Maintainer: gardenapple <gardenapple@posteo.net>
# Contributor: katt <magunasu.b97@gmail.com>
# Contributor: merlock <mlmatlock@gmail.com>

pkgname=fahcontrol-gtk3-git
pkgver=r183.f8cee6d
pkgrel=1
pkgdesc='Graphical monitor and control utility for the Folding@home client (python3/GTK3 fork)'
url='https://foldingathome.org'
arch=('any')
license=('GPL3')
depends=('python' 'python-gobject' 'python-six' 'gtk3')
makedepends=('python-setuptools' 'git')
optdepends=('fahviewer: 3D simulation viewer')
provides=('fahcontrol')
conflicts=('fahcontrol')
#changelog="src/${pkgname}/CHANGELOG.md"
source=("${pkgname}::git+https://github.com/cdberkstresser/fah-control.git"
        'fix-python-3.10.patch')
sha256sums=('SKIP'
            'ca8c09a5b58582d7af8443be5e9653d6ebac2e0e9df387fc51c2e88c822f64db')

prepare() {
	cd "$pkgname"
	patch -p1 < "${srcdir}/fix-python-3.10.patch"
}

pkgver() {
	cd "$pkgname"

	# Number of revisions since beginning of the history: 
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$pkgname"
	python setup.py build
}

package() {
	cd "$pkgname"

	python setup.py install --root="$pkgdir" --optimize=1 --skip-build

	install -Dm644 FAHControl.desktop -t "${pkgdir}/usr/share/applications"
}
