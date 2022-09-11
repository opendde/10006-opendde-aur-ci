# Maintainer: Twann <tw4nn at disroot.org>

_init_system=runit
_basename=tblock
pkgname=${_basename}-${_init_system}
pkgver=2.4.0
pkgrel=1
provides=("$_basename")
pkgdesc="An anti-capitalist ad-blocker that uses the hosts file"
url="https://tblock.codeberg.page"
arch=("any")
license=("GPL3")
conflicts=("$_basename")
makedepends=(
        "make"
        "gzip"
        "python>=3"
        "python-setuptools"
)
depends=(
        "python-urllib3"
        "python-requests"
        "python-colorama"
        "${_init_system}"
)
source=(
        "${pkgname}-${pkgver}.tar.gz::https://codeberg.org/tblock/tblock/archive/${pkgver}.tar.gz"
)
sha512sums=(
        "4b22298488e515c0cc7928286712b23a53e7390c996d92088683d5efd158265ba31e7c1c671a91deaa9349336fc4c5a865f40185862c321714eb190a886d1221"
)
backup=("etc/tblock.conf")

build()
{
        cd "$srcdir/$_basename"
        make build-files
        python3 ./setup.py build
}

package()
{
        cd "$srcdir/$_basename"
        # Install the python package
        python3 ./setup.py install --root="$pkgdir" --skip-build --optimize=1
        # Install man pages and LICENSE
        make install-files install-service-${_init_system} ROOT="$pkgdir"
        # Install the configuration file
        make install-config ROOT="$pkgdir"
}
