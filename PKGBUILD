# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=python-findpeaks
pkgver=2.4.3
pkgrel=1
pkgdesc="Detection of peaks and valleys in vectors and images"
url='https://erdogant.github.io/findpeaks/'
arch=('any')
license=('MIT' 'LGPL')
depends=(
  'python-matplotlib' 'python-numpy' 'python-pandas' 'python-peakdetect'
  'python-requests' 'python-scipy' 'python-tqdm' 'python-caerus'
)
optdepends=(
  'python-opencv: for loading example images'
)
makedepends=('python-setuptools')
checkdepends=('python-opencv' 'python-pytest')

_pypi=findpeaks
source=(
  "https://files.pythonhosted.org/packages/source/${_pypi::1}/$_pypi/$_pypi-$pkgver.tar.gz"
  'https://erdogant.github.io/datasets/2dpeaks.zip'
  'https://erdogant.github.io/datasets/2dpeaks_image.png'
  'change_opencv_message.patch'
  'include_example_datasets.patch'
)
sha256sums=(
  '43dcbba930fd754346141d010dbb9c4e32fa9abc649ad11d45f011f494ec2e30'
  'cde41d4a434c2c8d0f7273283796e9d5ed621f6877556cc2504b271e6fe6b329'
  'ea0f10f39f73363fe5e41b6bac51b33b13213fc1770d510ac29d3dbac661e474'
  '76b0bfae361a56a2f6d746c87b6d5cd2d42c4a4b7df19070e39de56f2fe12e5d'
  '5e7ddb7918f98c559c0bc1833250b9194abe9e7b061c96ebe758e642d0a25d50'
)

prepare() {
  cd "$_pypi-$pkgver"

  # Don't tell the user to install with pip, just raise the original exception
  # and let them handle it.
  patch -p0 -i "$srcdir/change_opencv_message.patch"

  # Move the example datasets into the library source and modify the setup.py
  # to include them in the built package.
  cp "$srcdir/2dpeaks_image.png" findpeaks/data
  cp "$srcdir/2dpeaks.zip" findpeaks/data
  patch -p0 -i "$srcdir/include_example_datasets.patch"
}

build() {
  cd "$_pypi-$pkgver"
  python setup.py build
}

check() {
  cd "$_pypi-$pkgver"
  pytest -v
}

package() {
  cd "$_pypi-$pkgver"
  python setup.py install --root="$pkgdir" --prefix=/usr --skip-build --optimize=1
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "LICENSE"

  # Move the example script to /usr/share
  install -Dm644 -t "$pkgdir/usr/share/$pkgname" findpeaks/examples.py
  find "$pkgdir/usr/lib" -type f -name "examples.py" -exec rm '{}' \;
  find "$pkgdir/usr/lib" -type f -name "examples.*pyc" -exec rm '{}' \;
}
