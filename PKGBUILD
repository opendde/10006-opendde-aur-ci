# Maintainer: Lukas K. <lu at 0x83 dot eu>

pkgname=seqdiag
pkgver=0.9.5
pkgrel=1
pkgdesc="simple sequence-diagram image generator"
arch=("any")
url="http://blockdiag.com/en/seqdiag/index.html"
license=('apache')
depends=('python')
source=("https://pypi.python.org/packages/source/s/seqdiag/seqdiag-0.9.5.tar.gz")
md5sums=("18b05be0467a23b7d8569a937d6de02b")

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
