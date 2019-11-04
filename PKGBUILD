pkgname=mitogen
pkgver=0.2.9
pkgrel=1
pkgdesc="Distributed self-replicating programs in Python"
license=("BSD")
url="https://mitogen.networkgenomics.com/"
depends=('python')
makedepends=('python-setuptools')
optdepends=('ansible: for using the ansible strategy plugin')
source=("https://github.com/dw/mitogen/archive/v${pkgver}.tar.gz")
arch=('any')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

md5sums=('8e616a5baae07856c8fa145a3c55b479')
sha1sums=('2392e130bc16d1dea204d82880104ed8c4dc6943')
sha256sums=('cc68b492c58187799bec750a750a0dda3ae94071a4c5502b9a0e26a27eeba9db')
sha384sums=('29caecb78bf44663dd69fa83d9bb77d01b433b6e30ef74146c42a1ee81748bec3364aa2c12556c54ccef242485907a98')
sha512sums=('b69f2551e857dfd5619c9ce2abd205d70e776b13ba770a1f3dc29dc1e76b3d828d26f5edd06f87cddebb77f07befeb23f048bb6ca4539fd2d91c8bfe5ff681c0')
