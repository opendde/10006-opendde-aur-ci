# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=guiscrcpy-git
pkgver=2021.6.1.r1.g11acb50
pkgrel=1
epoch=1
pkgdesc="Open Source GUI based Android Screen Mirroring System"
arch=('any')
url="https://guiscrcpy.github.io"
license=('GPL3')
depends=('libxinerama' 'pyside2' 'python' 'python-cairosvg' 'python-click' 'python-colorama'
         'python-coloredlogs' 'python-psutil' 'python-pynput' 'python-qtpy'
         'scrcpy')
makedepends=('git' 'python-build' 'python-installer' 'python-poetry' 'setconf')
optdepends=('usbaudio: audio mirroring for Android <8.0'
            'sndcpy: audio mirroring for Android >=10')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/srevinsaju/guiscrcpy.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags --exclude continuous | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/${pkgname%-git}"

  # Force launching with PySide2
  setconf appimage/${pkgname%-git}.desktop Exec 'env QT_API=pyside2 guiscrcpy'
}

build() {
  cd "$srcdir/${pkgname%-git}"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/${pkgname%-git}"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 appimage/${pkgname%-git}.appdata.xml -t "$pkgdir/usr/share/metainfo/"
  install -Dm644 appimage/${pkgname%-git}.desktop -t "$pkgdir/usr/share/applications/"

  for size in 128 256; do
    install -Dm644 appimage/${pkgname%-git}-${size}.png -t \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/"
  done
}
