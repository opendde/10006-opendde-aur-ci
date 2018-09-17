# Maintainer: David Parrish <daveparrish@tutanota.com>

pkgname=zap-desktop-git
pkgver=0.2.1.beta.160.gcf53d926
pkgrel=1
pkgdesc="Lightning wallet focused on user experience and ease of use"
arch=('x86_64')
url="https://github.com/LN-Zap/zap-desktop"
license=('MIT')
install="$pkgname.install"
source=("$pkgname::git+https://github.com/LN-Zap/zap-desktop.git"
        "zap-desktop.desktop")
sha256sums=('SKIP'
            '8c7a0940cced4e02b9d4dc1e2ca98f546117a079f37b91739ef70a321f86d5ee')
conflicts=("zap-desktop-bin")
provides=("zap-desktop")

pkgver() {
  cd "$pkgname" || exit
  git describe --tags | sed 's/^v//;s/-/./g'
}

build() {
  cd "$pkgname" || exit
  yarn
  npm run package
}

package() {
  install -d "$pkgdir"/{opt/,usr/bin/,usr/share/applications,/usr/share/pixmaps,/usr/share/licenses/$pkgname}

  # Install all .deb files into /opt.
  mkdir "$pkgdir/opt/$pkgname"
  cp -r "$srcdir/$pkgname/release/linux-unpacked/". "$pkgdir/opt/$pkgname"

  # Symlink executable
  ln -s "/opt/$pkgname/zap-desktop" "$pkgdir/usr/bin/zap-desktop"

  # Symlink licenses
  ln -s "/opt/$pkgname/LICENSES.electron.txt" "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/opt/$pkgname/LICENSES.chromium.html" "$pkgdir/usr/share/licenses/$pkgname"

  # Desktop icon
  install -D -m644 "$srcdir/zap-desktop.desktop" "${pkgdir}/usr/share/applications/zap-desktop.desktop"
  install -D -m644 "$srcdir/$pkgname/resources/icons/icon.png" "${pkgdir}/usr/share/pixmaps/zap-desktop.png"
}
