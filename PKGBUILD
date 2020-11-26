# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgname=python-slixmpp
_pkgbase=slixmpp
pkgver=1.5.2
pkgrel=4
pkgdesc="An XMPP library written for Python 3.7 (SleekXMPP asyncio fork)"
arch=('x86_64' 'armv7h' 'aarch64')
url="https://dev.louiz.org/projects/slixmpp"
license=('MIT')
depends=('python' 'python-aiodns' 'libidn' 'python-pyasn1' 'python-pyasn1-modules' 'python-aiohttp')
makedepends=('git' 'cython')
options=(!emptydirs)

source=("https://lab.louiz.org/poezio/${_pkgbase}/-/archive/slix-${pkgver}/${_pkgbase}-slix-${pkgver}.tar.gz")
sha512sums=('3cef34f573c003352b19888c14986ec8fe694e5f21717c45931f1ef404c280bf791052c914ed4e46f06fe18103219a57e4e6ca2826d17ba30a344550ddaae1da')

build() {
    cd $_pkgbase-slix-$pkgver
    python setup.py build
}

package() {
    cd $_pkgbase-slix-$pkgver
    python setup.py install --skip-build --root="$pkgdir/" --optimize=1

    if ! test -f "$pkgdir"/usr/lib/python3.9/site-packages/slixmpp/stringprep.*.so; then
        msg 'stringprep module failed to build!'
        msg 'Check that cython is correctly installed and working.'
        exit 1
    fi

    # This one is only used when Cython is unavailable, or on pypy3.
    rm "$pkgdir"/usr/lib/python3.9/site-packages/slixmpp/stringprep.py
}
