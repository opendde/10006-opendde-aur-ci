# Maintainer: mark.blakeney at bullet-systems dot net
_pkgname=ptvsd
pkgname=python-$_pkgname
pkgver=4.3.0
pkgrel=1
pkgdesc="Python debugger package for use with Visual Studio and Visual Studio Code"
url="https://github.com/microsoft/$_pkgname"
license=("MIT")
arch=("x86_64")
depends=("python>=3.4")
makedepends=("python-setuptools")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha1sums=('a13b9deea2090637bcfb85630cb8954c23500fdb')

# These are python2 files required for legacy support of the package on
# non-Arch systems. These all fail to byte-compile which causes package
# errors so we will just remove them before the install step.
_badfiles=(
  "reraise2.py"
  "_vendored/pydevd/pydevd_attach_to_process/_check.py"
  "_vendored/pydevd/pydevd_attach_to_process/winappdbg/plugins/do_example.py"
  "_vendored/pydevd/pydevd_attach_to_process/winappdbg/plugins/do_exchain.py"
  "_vendored/pydevd/pydevd_attach_to_process/winappdbg/plugins/do_exploitable.py"
  "_vendored/pydevd/_pydevd_bundle/pydevconsole_code_for_ironpython.py"
  "_vendored/pydevd/_pydevd_bundle/pydevd_exec.py"
  "_vendored/pydevd/_pydev_imps/_pydev_inspect.py"
  "_vendored/pydevd/_pydev_imps/_pydev_pkgutil_old.py"
  "_vendored/pydevd/_pydev_imps/_pydev_SimpleXMLRPCServer.py"
  "_vendored/pydevd/_pydev_imps/_pydev_SocketServer.py"
  "_vendored/pydevd/_pydev_imps/_pydev_uuid_old.py"
  "_vendored/pydevd/_pydev_imps/_pydev_xmlrpclib.py"
  "_vendored/pydevd/pydev_ipython/inputhookglut.py"
)

build() {
  cd $_pkgname-$pkgver

  _vers="$pkgver-$pkgrel"
  echo "Setting build version to $_vers in $PWD/setup.py"
  sed -i "/version=/s/=.*/=\'$_vers\',/" setup.py

  python setup.py build
  cd build/lib/$_pkgname

  echo "Setting embedded version to $_vers in $PWD/_version.py"
  sed -i "/\"version\":/s/\"[^\"]*\"$/\"$_vers\"/" _version.py

  echo "Removing legacy/unneeded files for Arch Linux .."
  for f in "${_badfiles[@]}"; do
      rm -v $f
  done
}

package() {
  cd $_pkgname-$pkgver
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
