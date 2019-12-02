# Maintainer: Caleb Maclennan <caleb@alerque.com>
# PKGBUILD generated by pipman
# Python package author: Sergio Correia <sergio.correia@gmail.com>

_pipname=panflute
pkgname=python-$_pipname
pkgver=1.12.2
pkgrel=1
pkgdesc="Pythonic Pandoc filters"
arch=(any)
url="https://github.com/sergiocorreia/$_pipname"
license=(BSD3)
makedepends=("python" "python-pip")
depends=("python-click"
         "python-yaml"
         "python-shutilwhich")

build() {
  pip install --no-deps --target="$_pipname" "$_pipname==$pkgver"
}

package() {
  sitepackages=$(python -c "import site; print(site.getsitepackages()[0])")
  mkdir -p "$pkgdir/$sitepackages"
  cp -r "$srcdir/$_pipname"/* "$pkgdir/$sitepackages"
}
