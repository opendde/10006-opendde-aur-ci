# Maintainer: William Belanger <echo d2lsbGlhbS5iZWxyQGdtYWlsLmNvbQ== | base64 -d>

pkgname=primenote-git
pkgver=0
pkgrel=1
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
pkgdesc="Fanciest, most efficient and customizable sticky note application (now with Vim!)"
url="https://gitlab.com/william.belanger/${pkgname%-git}"
arch=("any")
license=("GPL3")
depends=("python" "python-setuptools" "python-pyqt5" "python-requests")
optdepends=("qtermwidget: support for console and Vim modes"
            "gvim: support for Vim mode")
source=("git+https://gitlab.com/william.belanger/${pkgname%-git}.git")
md5sums=("SKIP")

pkgver()
{
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package()
{
  cd "${pkgname%-git}"
  python setup.py install --optimize="1" --root="$pkgdir"
}
