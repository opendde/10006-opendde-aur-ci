# Maintainer: Lukas K. <lu at 0x83 dot eu>

pkgname=seqdiag
pkgver=0.9.5
pkgrel=2
pkgdesc="simple sequence-diagram image generator"
arch=("any")
url="http://blockdiag.com/en/seqdiag/index.html"
license=('apache')
depends=('python' 'python-webcolors' 'blockdiag' 'funcparserlib')
source=("https://bitbucket.org/blockdiag/$pkgname/get/$pkgver.tar.gz")
md5sums=("f63560275d4c267cc4a32b1d248d7146")

package() {
  cd "$srcdir/blockdiag-$pkgname-"*
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
