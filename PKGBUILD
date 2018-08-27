# Maintainer: liberodark

pkgname=stacer-bin
pkgver=1.0.9
pkgrel=1
pkgdesc="Linux System Optimizer and Monitoring"
arch=('x86_64')
url="https://github.com/oguzhaninan/Stacer"
license=('MIT')
depends=('qt5-charts' 'qt5-svg' 'hicolor-icon-theme')
source_x86_64=("https://github.com/oguzhaninan/Stacer/releases/download/v${pkgver}/stacer_${pkgver}_amd64.deb")
source=($pkgname.desktop)
sha512sums=('c1935570166c402295d92dad30fe7b4e8189a869561d56bd8d5244138de11d4fa16145ad017f9e7b22733fb7de8a6b79708aba595a80bce7bbe0a037da63260f')
sha512sums_x86_64=('b28c09cdc388c25db8aa145ac0a6ea7aae31ef9647af8068201cceff58a87d5cb2b86b8bbd382acc8dca6e3b6483a9ba6239123a4eedf68b28c507fb867c3a46')
        
package() {
  cd $srcdir
  tar xvf data.tar.xz
  cp -r usr $pkgdir
  rm $pkgdir/usr/share/applications/{stacer.desktop}
  install -vDm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
}

