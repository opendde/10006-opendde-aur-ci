# Maintainer: Alex Kubica <alexkubicail@gmail.com>
_name=mal
_commit=f614507
pkgname=python-mal-git
pkgver=r97.f614507
pkgrel=1
pkgdesc="MyAnimeList command line interface"
arch=(any)
url="http://manoel.tk/MAL/"
license=('GPL3')
depends=('python' 'python-requests' 'python-appdirs' 'python-decorating')
makedepends=('git')
source=("git+https://github.com/ryukinix/${_name}.git#commit=${_commit}")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_name}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/${_name}"
  python setup.py install --root="$pkgdir/" --optimize=1
}
