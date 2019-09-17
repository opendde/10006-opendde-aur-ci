pkgname=charliecloud
pkgver=0.9.8
pkgrel=1
pkgdesc="Lightweight user-defined software stacks for high-performance computing"
arch=('any')
license=('Apache-2.0')
depends=('python')
makedepends=(
	'bash>=4.1'
	'rsync'
	'python-sphinx'
)
optdepends=(
	'docker>=17.03'
)
source=("https://github.com/hpc/charliecloud/releases/download/v${pkgver}/charliecloud-${pkgver}.tar.gz")
sha1sums=('aee1b1642812378006d5d1fc0c1de03e159c6262')
url="https://hpc.github.io/charliecloud"
options+=('!emptydirs')

_distdir="charliecloud-${pkgver}"

build() {
	cd "$srcdir/$_distdir"
	make
	make -C doc-src
}

check() {
	cd "$srcdir/$_distdir/test"
#        make test-quick
}

package() {
        cd "$srcdir/$_distdir"
        make PREFIX="/usr" DESTDIR="$pkgdir" install
}
