# Maintainer: Erich Eckner <arch at eckner dot net>
# Contributor: Philip Goto <philip.goto@gmail.com>

pkgname=python-ipympl
_pkgname="${pkgname#*-}"
pkgver=0.7.0
pkgrel=5
pkgdesc="Matplotlib Jupyter Extension"
url="https://pypi.org/project/ipympl/"
depends=(
  'python'
  'python-matplotlib')
makedepends=(
  'jupyter'
  'jupyterlab'
  'jupyterlab_pygments'
  'npm'
  'python-setuptools'
  'python-jupyter_packaging')
license=('BSD')
arch=(any)
source=("https://pypi.python.org/packages/97/4e/d4b5fee6517b56ad4e5b356d53ab65f780bd313ade652711630d60e52c4e/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('23b22f4449ca67fc2e282ce8fd45dc2e4fa2b88e833c24f3065ed441590d25014898ad4e3a076ddff195d5685107177903d600015d5739cd4ee69c1e07f06bbc')

build() {
  cd "${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}"
  py_ver=$(python --version | cut -d' ' -f2 | cut -d. -f1,2)
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build

  # install (and enable) extension according to
  # https://jupyterlab.readthedocs.io/en/latest/extension/extension_dev.html#distributing-a-prebuilt-extension
  prebuilt_extension_dir_lab="$pkgdir"/usr/share/jupyter/labextensions
  mkdir -p $prebuilt_extension_dir_lab
  ln -s /usr/lib/python${py_ver}/site-packages/ipympl/labextension "${prebuilt_extension_dir_lab}/jupyter-matplotlib"

  # for classic interface
  prebuilt_extension_dir_classic="$pkgdir"/usr/share/jupyter/nbextensions
  mkdir -p $prebuilt_extension_dir_classic
  ln -s /usr/lib/python${py_ver}/site-packages/ipympl/nbextension "${prebuilt_extension_dir_classic}/jupyter-matplotlib"

  install -D "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
