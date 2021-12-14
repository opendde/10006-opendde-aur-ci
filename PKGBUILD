# Maintainer: Butui Hu <hot123tea123@gmail.com>
pkgname=python-pretrainedmodels-git
pkgver=r154.8aae3d8
pkgrel=3
pkgdesc="Pretrained ConvNets for PyTorch"
arch=(any)
url="https://github.com/Cadene/pretrained-models.pytorch"
license=('BSD')
depends=(python-munch python-pytorch python-scipy python-torchvision python-tqdm )
makedepends=(git python-setuptools)
provides=(python-pretrainedmodels)
conflicts=(python-pretrainedmodels)
source=("${pkgname}::git+https://github.com/Cadene/pretrained-models.pytorch.git")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${pkgname}"
  python setup.py build
}

package() {
  cd "${pkgname}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
