# $Id$
# Maintainer: Haruyuki lxz <lxz@ilxz.me>

pkgname=deepin-nvidia-prime-git
pkgver=0.0.0.r1.0e1e70e
pkgrel=1
pkgdesc='nvidia prime for deepin'
arch=('x86_64')
url="https://github.com/linuxdeepin/nvidia-prime"
license=('GPL3')
depends=('nvidia')
conflicts=('bumblebee' 'primus')
options=('debug')
source=("git+https://github.com/linuxdeepin/nvidia-prime.git")
sha512sums=('SKIP')

package() {
  cd nvidia-prime
  git checkout 0e1e70e
  mkdir -p "$pkgdir/usr/bin/"
  mkdir -p "$pkgdir/usr/share/lightdm/lightdm.conf.d/"
  mkdir -p "$pkgdir/usr/share/X11/xorg.conf.d/"
  install -m 755 sbin/prime-offload "$pkgdir/usr/bin/"
  install -m 755 usr/share/lightdm/lightdm.conf.d/90-nvidia.conf "$pkgdir/usr/share/lightdm/lightdm.conf.d/"
  install -m 755 usr/share/X11/xorg.conf.d/11-nvidia-prime.conf "$pkgdir/usr/share/X11/xorg.conf.d/"
}
