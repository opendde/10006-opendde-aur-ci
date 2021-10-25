# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=vsrealesrgan
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=1.2.0.3.g5a1bef4
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('any')
url='https://github.com/HolyWu/vs-realesrgan'
license=('BSD')
depends=('vapoursynth'
         'python-numpy'
         'python-tqdm'
         'python-requests'
         )
makedepends=('git'
             'python-pip'
             'python-wheel'
             )
optdepends=('python-pytorch: CPU'
            'python-pytorch-opt: CPU with AVX2 optimizations'
            'python-pytorch-cuda: CUDA and CPU'
            'python-pytorch-opt-cuda: CUDA with CPU with AVX2 optimizations'
            )
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/HolyWu/vs-realesrgan.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - . | tr -d v)"
}

prepare() {
  cd "${_plug}/vsrealesrgan"
  python __main__.py
}

build() {
  cd "${_plug}"
  python -c "import setuptools; setuptools.setup()" bdist_wheel
}

package() {
  cd "${_plug}"
  pip install -I --root "${pkgdir}" --no-warn-script-location --no-deps dist/*.whl

  install -Dm644 README.md "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
