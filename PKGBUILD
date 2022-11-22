# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="mkdocs-material-extensions"
pkgver=1.1.1
pkgrel=1
pkgdesc="Markdown extension resources for MkDocs Material"
url="https://github.com/facelessuser/mkdocs-material-extensions"
license=("MIT")
arch=("any")
provides=("mkdocs-material-extensions")
conflicts=("python-mkdocs-material-extensions-git" "mkdocs-material-extensions-git")
replaces=("python-mkdocs-material-extensions-git" "mkdocs-material-extensions-git")
depends=("mkdocs" "pymdown-extensions")
makedepends=("python-build" "python-installer" "python-wheel" "python-hatchling")
source=("$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('b298fee31d78378841350c9c04a8175fe4c72caf21baaadf11e822a6b18aed4c')

build(){
 cd "$pkgname-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$pkgname-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
