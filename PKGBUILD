# Maintainer: dreieck
# Contributor: Thiago Perrotta

_pkgname=arandr-indicator
pkgname="${_pkgname}-git"
epoch=2
pkgver=r16.20200824.189890e
pkgrel=5
pkgdesc="Quick and simple tray icon menu for changing the monitor layout."
arch=('any')
# url="https://github.com/denilsonsa/arandr-indicator" # original project (Python 2)
url="https://github.com/AdrianVollmer/arandr-indicator/tree/port-python3" # Python 3 port
license=('custom')
depends=(
  'pygtk'
  'python>=3'
  'python-gobject' # This one seems to contain libappindicator python module, which is required.
)
makedepends=('git')
optdepends=(
  'arandr: To configure monitor layouts.'
  'python-xdg: For Freedesktop.org directory specifications.' # python-pyxdg
)
provides=("${_pkgname}=${pkgver}")
replaces=()
conflicts=("${_pkgname}")
source=(
  # "${_pkgname}::git+https://github.com/denilsonsa/arandr-indicator.git" # original project (Python 2)
  "${_pkgname}::git+https://github.com/AdrianVollmer/arandr-indicator#branch=port-python3" # Python 3 port
  'license-info.txt'
)
sha256sums=(
  'SKIP'
  'e4f6da5d674b36b60640901d1a01a5deec77fd41ef31f713b1fc533c25d14f6d'
)

prepare() {
  cd "${srcdir}/${_pkgname}"
  msg2 "Extract copyright information, building license.txt ..."
  cat arandr-indicator.py | tr -d '\a' | tr '\n' '\a' | sed 's|^.*\(# Copyright.*$\)|\1|g' | sed 's|\a[^#][^\a]*.*$|\a|g' | tr '\a' '\n' > "${srcdir}/license.txt"
}

pkgver () {
  cd "${srcdir}/${_pkgname}"
  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_rev}" ]; then
    error "Commit count could not be determined."
    return 1
  else
    printf '%s' "r${_rev}.${_date}.${_hash}"
  fi
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -Dvm755 "${_pkgname}.py" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dvm644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dvm644 "${srcdir}/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
  install -Dvm644 "${srcdir}/license-info.txt" "${pkgdir}/usr/share/licenses/${pkgname}/license-info.txt"
}
