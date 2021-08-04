# Maintainer: Heiko Nickerl <dev at hnicke dot de>
pkgname=sodalite
pkgver=0.21.19
pkgrel=1
pkgdesc="Keyboard-driven terminal file navigator and launcher"
arch=('any')
url="https://www.github.com/hnicke/sodalite"
license=('GPL')
depends=(
    'python>=3.9'
    'python-binaryornot'
    'python-urwid'
    'python-yaml'
    'python-pyperclip'
    'python-pygments'
    'python-watchdog'
    'python-click'
    'python-blinker'
    'xdg-utils'
)
source=("https://github.com/hnicke/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('68701b80ed1c1d247c3a0c77d82e2d90b08176e10afa3c3ed5bd98dd8ad57dc2')

_srcdir=$pkgname-$pkgver
build() {
    cd $_srcdir
    python setup.py build
}


package() {
    cd $_srcdir
    python setup.py install \
    --root="$pkgdir" \
    --optimize=1 \
    --skip-build

    install -Dm644 sodalite.desktop "$pkgdir/usr/share/applications/sodalite.desktop"
    install -Dm644 docs/sodalite.1 "$pkgdir/usr/share/man/man1/sodalite.1"
    install -Dm644 docs/sodalite-open.1 "$pkgdir/usr/share/man/man1/sodalite-open.1"
    install -Dm755 scripts/sodalite-open "$pkgdir/usr/bin/sodalite-open"
    install -Dm644 README.md "$pkgdir/usr/share/doc/sodalite/README"
    install -Dm644 copyright "$pkgdir/usr/share/doc/sodalite/copyright"
    install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/sodalite/changelog"
    install -Dm644 scripts/shell-integration.sh "$pkgdir/usr/share/sodalite/shell-integration.sh"
    install -Dm644 scripts/shell-integration.fish "$pkgdir/usr/share/sodalite/shell-integration.fish"
    install -Dm644 sodalite/core/sodalite.conf "$pkgdir/usr/share/sodalite/sodalite.conf"
} 
