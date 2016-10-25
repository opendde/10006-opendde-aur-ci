# Maintainer: Virgil Dupras <hsoft@hardcoded.net>
# Maintainer: Bijaya Dangol <dangoldbj23@gmail.com>
pkgname=dupeguru
pkgver=4.0.2
pkgrel=1
pkgdesc="Find duplicate files on your system"
arch=(any)
url="http://www.hardcoded.net/dupeguru/"
license=('BSD')
depends=('python' 'python-pyqt5' 'libxkbcommon-x11' 'python-polib' 'python-send2trash' 'python-hsaudiotag3k')
makedepends=(
    python-sphinx
)
source=(
    http://download.hardcoded.net/$pkgname-src-$pkgver.tar.gz
)
md5sums=(
'fb3a149a8134f79bd58e4a49fb082f37'
)

build() {
  cd "$srcdir"
  python3 -m venv env --system-site-packages
  source env/bin/activate
  python -m pip install --no-index --find-links=deps -r requirements.txt
  source env/bin/activate
  msg "Starting build..."
  python build.py --clean
}

package() {
  cd "$srcdir"
  
  python package.py --arch-pkg
  cd "build/${pkgname}-arch"

  mkdir -p "${pkgdir}/usr/share/applications"
  mv ${pkgname}.desktop "${pkgdir}/usr/share/applications"
  
  mkdir -p "$pkgdir/usr/share/${pkgname}"
  cp -a * "$pkgdir/usr/share/${pkgname}/"
  chmod a+x "$pkgdir/usr/share/${pkgname}/run.py"
  
  mkdir -p "$pkgdir/usr/bin"
  ln -s ../share/${pkgname}/run.py "$pkgdir/usr/bin/${pkgname}"
}
