# Maintainer: Jingbei Li <i@jingbei.lli>
pkgname='kaldi-sctk'
_pkgname='kaldi-master'
pkgdesc='Speech recognition research toolkit'
pkgver=2.4.10
pkgrel=1
makedepends=('git' 'wget' 'python' 'python2' 'subversion')
depends=('perl')
arch=('x86_64' 'i686')
url='https://github.com/kaldi-asr/kaldi'
license=('APACHE')
source=("https://github.com/kaldi-asr/kaldi/archive/master.zip")
sha256sums=('SKIP')

build () {
	cd $srcdir/$_pkgname/tools
	sed \
		-e '/^sclite_compiled/s/ sctk_configured//' \
		-i Makefile
	make sctk_configured
	sed '/^DEFS/s/ -Dsize_t=unsigned//' -i sctk/src/sclite/makefile
	make sclite
	return
}

package () {
	mkdir -p $pkgdir/opt/$pkgname/tools/sctk-$pkgver
	cd $pkgdir/opt/$pkgname/tools
	ln -s sctk-$pkgver sctk
	cp -r $srcdir/$_pkgname/tools/sctk-$pkgver/bin sctk-$pkgver
}
