# Current Maintainer: Sean Snell <ssnell@lakecs.net>
# Previous Maintainer: GI Jack <GI_Jack@hackermail.com>
# Original: hexptr <hexptr@protonmail.com>

pkgname=streamdeck-ui
pkgver=2.0.4
pkgrel=4
pkgdesc="A Linux compatible UI for the Elgato Stream Deck"
arch=('any')
url="https://timothycrosley.github.io/streamdeck-ui/"
license=('MIT')
depends=('python-pillow' 'python-hidapi' 'pyside2' 'python-pynput' 'python-elgato-streamdeck>=0.9.1' 'python-xlib' 'python-filetype' 'python-cairosvg')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-poetry')
provides=('streamdeck-ui')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/timothycrosley/streamdeck-ui/archive/refs/tags/v${pkgver}.tar.gz"
        "60-streamdeck.rules"
        "streamdeck-ui.desktop"
        "elgato.png")
sha512sums=('404cfe789c702f1087d652151b5f7b2234c255a84cf5bee6b6a7935e4cd18da002bc1a4fd3177e6a7d036870e055cfc6c1d7bdba7766991dd518800904afbf63'
            '690aa38c549b09c7c49d99e47dea74fc47d778881ce1947d9da37f6d1d94f8745c4724c23a702167e6d714ea9b4fd13a4414eb6945b17728eef9b5319b9a6c0f'
            'fffb4c0ff87774e7e2215ab97ca365da8cc29e39973a0e0dd3bd87c88f713c345fd8683382eb9dac998a58f02eb3e85c29b4b97630711272164f78863623622b'
            '1145e8cdebdf950090d0833e40984cd402345d559c9faf8aab89f5ec4db5d5de685b68418faf39288f08e9a642fcf1cc53a719b1b11c8ebfac6dd8b42d4898d2')

build() {
  cd "${pkgname}-${pkgver}"
  DISABLE_CONAN=ON python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
  cd "${pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 "$srcdir/60-streamdeck.rules" "${pkgdir}/usr/lib/udev/rules.d/60-streamdeck.rules"
  install -Dm 644 "$srcdir/streamdeck-ui.desktop" "${pkgdir}/usr/share/applications/streamdeck-ui.desktop"
  install -Dm 644 "$srcdir/elgato.png" "${pkgdir}/usr/share/pixmaps/elgato.png"
}