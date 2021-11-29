# Maintainer: Dylan Turner dylantdmt@gmail.com
pkgname=audacity-git-bin
pkgver=3.1.2
pkgrel=1
epoch=
pkgdesc="GitHub releases version of the audio recording and processing software, Audacity, since Arch version is on 1.2"
arch=('x86_64')
source=('https://github.com/audacity/audacity/releases/download/Audacity-3.1.2/audacity-linux-3.1.2-x86_64.AppImage')
license=('GPL2')
makedepends=('wget')
md5sums=('SKIP')

package() {
    echo "Moving audacity binary."
    mkdir -p "$pkgdir/usr/bin/"
    chmod +x audacity-linux-$pkgver-x86_64.AppImage
    mv audacity-linux-$pkgver-x86_64.AppImage "$pkgdir/usr/bin/audacity"
}

