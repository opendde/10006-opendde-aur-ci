# Maintainer: Nikola Milinković <nikmil@gmail.com>

_gitroot="https://github.com/Diaoul/enzyme"
_gitname="enzyme"
pkgbase=python2-enzyme-git
pkgname=('python2-enzyme-git' 'python-enzyme-git')
pkgver=0.4.2.21.9572bea
pkgrel=1
pkgdesc="Python library and CLI tool for searching and downloading subtitles."
arch=(any)
url="https://github.com/Diaoul/enzyme"
license=('Apache')
makedepends=('python2-setuptools' 'python-setuptools')
source=("${_gitname}::git+${_gitroot}.git")
md5sums=('SKIP')

pkgver() {
  cd ${_gitname}
  echo 0.4.2.$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
  #git describe --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

package_python2-enzyme-git() {
  provides=(python2-enzyme=${pkgver})
  conflicts=(python2-enzyme)
  cd ${srcdir}/${_gitname}
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}

package_python-enzyme-git() {
  provides=(python-enzyme=${pkgver})
  conflicts=(python-enzyme)
  cd ${srcdir}/${_gitname}
  python3 setup.py install --root="${pkgdir}/" --optimize=1
}
