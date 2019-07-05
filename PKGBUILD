# Maintainer: Erich Eckner <arch at eckner dot net>
# Contributor: Philip Goto <philip.goto@gmail.com>

pkgbase=python-ipympl
pkgname=(python2-ipympl python-ipympl python-ipympl-common)
_pkgname="${pkgbase#*-}"
pkgver=0.3.2
pkgrel=1
pkgdesc="Matplotlib Jupyter Extension"
url="https://pypi.org/project/ipympl/"
_deppy2=(
  'python2>=2.7'
  'python2<2.8'
)
_deppy=(
  'python>=3.7'
  'python<3.8'
)
_depends=(
  'python')
_makedepends=(
  'python-setuptools')
license=('BSD')
arch=(any)
source=("https://pypi.python.org/packages/ec/06/6a6cd3406ab8079f3bb557c8d16bcd57735fcda30e480a925b5dba7837b8/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('5eff2a3a65ddf5edb638827548b8ad28709a736cbd5381162cbb821142f5da57865ab1b32b964985c1e28eb6ce9393de25f3728d7a18ca789d8af92187d21338')

makedepends=(
  "${_deppy[@]}"
  "${_deppy2[@]}"
  "${_depends[@]}"
  "${_depends[@]//python/python2}"
  "${_makedepends[@]}"
  "${_makedepends[@]//ython/ython2}"
)
prepare() {
  cp -r ${_pkgname}-${pkgver}{,-py2}
}

build() {
  (
    echo "building python2"
    cd ${_pkgname}-${pkgver}-py2
    python2 setup.py build
    mkdir "${srcdir}/pkg-py2"
    py_ver=$(python2 --version | cut -d' ' -f2 | cut -d. -f1,2)
    mkdir -p "${srcdir}/pkg-py2/usr/lib/python${py_ver}/site-packages/jupyterlab"
    mkdir -p "${srcdir}/pkg-py2/usr/share/jupyter"
    ln -s "../../lib/python${py_ver}/site-packages/jupyterlab" "${srcdir}/pkg-py2/usr/share/jupyter/lab"
    python2 setup.py install --root="${srcdir}/pkg-py2/" --optimize=1 --skip-build
    rm "${srcdir}/pkg-py2/usr/share/jupyter/lab"
  )
  (
    echo "building python"
    cd ${_pkgname}-${pkgver}
    python setup.py build
    mkdir "${srcdir}/pkg"
    py_ver=$(python --version | cut -d' ' -f2 | cut -d. -f1,2)
    mkdir -p "${srcdir}/pkg/usr/lib/python${py_ver}/site-packages/jupyterlab"
    mkdir -p "${srcdir}/pkg/usr/share/jupyter"
    ln -s "../../lib/python${py_ver}/site-packages/jupyterlab" "${srcdir}/pkg/usr/share/jupyter/lab"
    python setup.py install --root="${srcdir}/pkg/" --optimize=1 --skip-build
    rm "${srcdir}/pkg/usr/share/jupyter/lab"
  )
  mkdir "${srcdir}/pkg-common"
  for s in "${srcdir}/pkg-py2" "${srcdir}/pkg"; do
    (
      cd "$s"
      find * -not -type d
    )
  done \
  | sort \
  | uniq -d \
  | grep -vxF LICENSE \
  | while read -r f; do
    diff "${srcdir}/pkg-py2/${f}" "${srcdir}/pkg/${f}" || return $?
    install -D "${srcdir}/pkg-py2/${f}" "${srcdir}/pkg-common/${f}"
    rm "${srcdir}/pkg/${f}" "${srcdir}/pkg-py2/${f}"
  done
  find "${srcdir}/pkg" "${srcdir}/pkg-py2" -depth -type d -empty -delete
}

package_python2-ipympl() {
  depends=(
    "${_deppy2[@]}"
    "${_depends[@]//python/python2}"
    'python-ipympl-common'
  )
  mv "${srcdir}/pkg-py2"/* "${pkgdir}/"
  install -D "${_pkgname}-${pkgver}-py2/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python-ipympl() {
  depends=(
    "${_deppy[@]}"
    "${_depends[@]}"
    'python-ipympl-common'
  )
  mv "${srcdir}/pkg"/* "${pkgdir}/"
  install -D "${_pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python-ipympl-common() {
  mv "${srcdir}/pkg-common"/* "${pkgdir}/"
  mv "${pkgdir}/usr/etc" "${pkgdir}/"
}
