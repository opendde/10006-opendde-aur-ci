# Maintainer: amiguet <contact at matthieuamiguet dot ch>
# Contributor: speps <spepser at aur dot archlinux dot org> 

pkgname=python2-pyo
pkgver=0.8.8
pkgrel=1
pkgdesc="A Python module written in C to help digital signal processing script creation."
arch=('i686' 'x86_64')
url="http://ajaxsoundstudio.com/software/pyo/"
license=('GPL')
depends=('python2' 'portmidi' 'portaudio' 'liblo')
optdepends=('wxpython: wxWidgets GUI')
provides=("pyo=$pkgver" "python-pyo=$pkgver")
conflicts=('pyo' 'python-pyo')
source=("http://ajaxsoundstudio.com/downloads/pyo_$pkgver-src.tar.bz2"
	"http://ajaxsoundstudio.com/downloads/pyo_$pkgver-doc.tar.bz2")
md5sums=('777d55c49238c8fd8d4c1e7823fc15ee'
         'ddf686ec6fae8e3c862d38b49d22195e')

build() {
  cd "$srcdir/pyo_$pkgver-src"

  export PYTHON=python2
  python2 setup.py build --use-double --use-jack
}

package() {
  cd "$srcdir/pyo_$pkgver-src"
  python2 setup.py install --use-double \
                           --use-jack \
                           --root="$pkgdir/"

  # examples
  install -d "$pkgdir/usr/share/pyo"
  cp -a examples "$pkgdir/usr/share/pyo"

  # docs
  install -d "$pkgdir/usr/share/doc/pyo"
  cp -a ../pyo_$pkgver-doc/* "$pkgdir/usr/share/doc/pyo"

  # python2 fix
  sed -i "s|env python|&2|g" `grep -rl "env python" "$pkgdir"`
}
