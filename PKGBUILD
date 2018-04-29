# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgbase=python-tatsu
pkgname=(python-tatsu python2-tatsu)
pkgver=4.2.5
pkgrel=1
pkgdesc="A tool that takes grammars in a variation of EBNF as input, and outputs memoizing (Packrat) PEG parsers in Python"
arch=('any')
url="https://github.com/neogeny/TatSu"
license=('custom: BSD')
makedepends=('python-setuptools'
             'python2-setuptools')
source=($pkgname-$pkgver.tar.gz::"https://github.com/neogeny/TatSu/archive/v$pkgver.tar.gz")
sha256sums=('5d31af50b87760816e2703ea6ea91e744190317aec8cb5093fb4d9a9b7f00d61')

prepare() {
  # copy folder, so we can cleanly build for both python versions
  cp -rup TatSu-$pkgver TatSu-$pkgver-py2
}

# package for python 3
package_python-tatsu() {
  depends=('python')
  pkgdesc+=" (python3 version)"

  cd TatSu-$pkgver

  python setup.py install --root="$pkgdir/" --optimize=1

  rm -rf "$pkgdir"/usr/lib/python3.*/site-packages/test

  install -Dm644 README.rst "$pkgdir"/usr/share/doc/$pkgname/README.rst
  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
}

# package for python 2
package_python2-tatsu() {
  depends=('python2')
  pkgdesc+=" (python2 version)"

  cd TatSu-$pkgver-py2

  python2 setup.py install --root="$pkgdir/" --optimize=1

  rm -rf "$pkgdir"/usr/lib/python2.*/site-packages/test

  install -Dm644 README.rst "$pkgdir"/usr/share/doc/$pkgname/README.rst
  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt

  # non-conflicting executable names
  mv "$pkgdir"/usr/bin/tatsu "$pkgdir"/usr/bin/tatsu-py2
  mv "$pkgdir"/usr/bin/g2e "$pkgdir"/usr/bin/g2e-py2
}
