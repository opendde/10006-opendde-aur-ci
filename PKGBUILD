# Maintainer: Daniel Maslowski <info@orangecms.org>
# Co-Maintainer: Ke Liu <specter119@gmail.com>

pkgname=python-conda
_name=${pkgname#python-}
pkgver=4.10.1
pkgrel=1
pkgdesc="OS-agnostic, system-level binary package manager and ecosystem https://conda.io"
arch=('any')
url="https://github.com/conda/conda"
license=('BSD')
depends=(
  'python>=3.6'
  'python-conda-package-handling'
  'python-pycosat>=0.6.3'
  'python-requests>=2.12.4'
  'python-ruamel-yaml>=0.11.14'
)
makedepends=('python-setuptools')
provides=('python-conda' 'python-conda-env')
options=(!emptydirs)
source=(
  $_name-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz
)
sha512sums=('75796b580abcc91c449461302cecb98cd067285ef03d6630c882177b0b0f8f9df56101480943d5a14855ecfca10c5ea7dcb57c569a3ff538add713f82772a6f0')

prepare() {
  cd "$srcdir/${_name}-$pkgver"
  echo $pkgver > conda/.version
  sed -i "s/package_files('conda\/shell') + //" setup.py
  sed -i 's/$_CONDA_ROOT//' conda/shell/bin/{de,}activate
  sed -i 's/env python/python3/' conda/shell/bin/conda
  sed "s/conda.cli/conda_env.cli.main/" conda/shell/bin/conda > conda/shell/bin/conda-env
  echo 'set -l CONDA_EXE /usr/bin/conda' | cat - conda/shell/etc/fish/conf.d/conda.fish > conda.fish
  echo 'set _CONDA_EXE=/usr/bin/conda' | cat - conda/shell/etc/profile.d/conda.csh > conda.csh
  echo 'export CONDA_EXE=/usr/bin/conda' | cat - conda/shell/etc/profile.d/conda.sh > conda.sh
  echo -e 'envs_dirs:\n  - ~/.conda/envs\npkgs_dirs:\n  - ~/.conda/pkgs' > condarc
}

build() {
  cd "$srcdir/${_name}-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/${_name}-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  for _bin in $(ls conda/shell/bin); do
    install -Dm 655 conda/shell/bin/$_bin $pkgdir/usr/bin/$_bin
  done
  install -Dm 644 conda.fish $pkgdir/usr/share/fish/functions/conda.fish
  install -Dm 644 conda.csh $pkgdir/etc/profile.d/conda.csh
  install -Dm 644 conda.sh $pkgdir/etc/profile.d/conda.sh
  install -Dm 644 condarc $pkgdir/etc/conda/condarc
  install -Dm 644 LICENSE.txt $pkgdir/usr/share/licenses/${pkgname}/LICENSE.txt
}

# vim:set ts=2 sw=2 et:
