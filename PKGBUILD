# Maintainer: Tinu Weber <martin.weber@epfl.ch>

pkgname=python-cothority
pkgver=0.1
pkgrel=1
arch=(any)

pkgdesc='Scalable collective authority prototype'
license=(AGPL3)
url='https://pypi.org/project/cothority/'

depends=(python)
makedepends=(python-pip)

source=('https://files.pythonhosted.org/packages/6d/6b/620b90cdfb4f3c0121589f20960f0623e892248cfeceea17752c7e395baf/cothority-0.1-py3-none-any.whl')
sha256sums=(bc863cd937e90ea817b75e9c9ffb29ecf5f93651336b49e7c83d565c4b693f70)

package() {
  depends+=(python-websockets) # AUR

  PIP_CONFIG_FILE=/dev/null pip install \
    --isolated \
    --root="$pkgdir" \
    --ignore-installed \
    --no-deps \
    *.whl
}
