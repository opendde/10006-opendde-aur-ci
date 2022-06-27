# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Hugo Doria <hugo@archlinux.org>
# Contributor: qlonik <volodin.n at gmail dot com>
# Contributor: Mario A. Vazquez <mario_vazq@hotmail.com>

pkgbase='python2-pyxdg'
pkgname=('python2-pyxdg' 'pyxdg' 'python2-xdg')
_name="${pkgname#python2-}"
pkgver=0.28
pkgrel=3
pkgdesc='Official freedesktop.org XDG specifications support library'
arch=('any')
url="https://pypi.org/project/${_name}/${pkgver}/"
license=('LGPL')
depends=('python2')
makedepends=('python2-setuptools')
# checkdepends=('python2-pytest')        # Test are not self-contained and not deterministic; results depend on system setup

__tarname_pypi="${_name}-${pkgver}"      # PyPI tarball name
__tarname_git="${_name}-rel-${pkgver}"   # Gitlab/GitHub tarball name
__source_pypi_tar="https://pypi.python.org/packages/source/${_name::1}/${_name}/${__tarname_pypi}.tar.gz"
__source_git_tar="https://gitlab.freedesktop.org/xdg/${_name}/-/archive/rel-${pkgver}/${__tarname_git}.tar.bz2"

# PyXDG's PyPI sources tend to have screwed-up test files. 
# Using Gitlab/GitHub tarballs seem much more reliable.
_tarname="${__tarname_git}"             # tar name to use
source=("${__source_git_tar}")          # tar source to use
sha256sums=('2de0dc8bd40e5b2ea3fdb2197e5cf9e929a7c7260f4a5fbdbdb5c73fd3db45b5')

prepare() {
  echo 'Changing hashbangs in *.py files to refer to python2'
  sed -e 's|#![ ]*/usr/bin/python[^2]\?|#!/usr/bin/python2|' \
      -e 's|#![ ]*/usr/bin/env python[^2]\?|#!/usr/bin/env python2|' \
      -e 's|#![ ]*/bin/env python[^2]\?|#!/usr/bin/env python2|' \
      -i $(find . -name '*.py')
}

build() {
    cd "${_tarname}"
    python2 setup.py build
}

# # Test are not self-contained and not deterministic; results depend on system setup and installed packages
# check() {
#     cd "${_tarname}"
# 
#     LC_ALL='C.UTF-8' PYTHONPATH="$PWD/build/lib" \
#         pytest2 \
#             --verbose \
#             --cache-clear \
#             --import-mode=append \
#             -r A \
#             -k 'not test_find_icon_exists and not test_parse_menu'
# }

package_python2-pyxdg() {
    cd "${_tarname}"
    python2 setup.py install --prefix='/usr' --root="${pkgdir}" --skip-build --optimize=1
}

package_pyxdg() {
    depends=('python2-pyxdg')
    pkgdesc='[meta-pkg] Old, deprecated package name. Whatever depends on this should depend on python2-pyxdg instead.'
}

package_python2-xdg() {
    depends=('python2-pyxdg')
    pkgdesc='[meta-pkg] Old, deprecated package name. Whatever depends on this should depend on python2-pyxdg instead.'
}
