# Mantainer: Dave Kleinschmidt <gmail.com: dave.f.kleinschmidt>
# Contributor: <gmail.com: jese.jaara>

pkgname=pandoc-fignos
pkgver=1.4.2
pkgrel=1
pkgdesc="Figure number filter for pandoc"
url="https://github.com/tomduck/pandoc-fignos"
depends=('pandoc-xnos>=0.15.0')
license=('GPL')
arch=('any')
source=("https://github.com/tomduck/pandoc-fignos/archive/${pkgver}.tar.gz")
md5sums=('724717d33931ac13d8cfa10adb085e2f')

build() {
    cd "$srcdir/pandoc-fignos-${pkgver}"
    python setup.py build
}

package() {
    cd "$srcdir/pandoc-fignos-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1 
}
