# Maintainer: Marat Moustafine <moustafine-@t-tuta-d.t-io>

pkgname=pvs-studio
pkgver=6.12.20591.1
pkgrel=1
pkgdesc='Static code analyzer for C, C++ and C#'
arch=('i686' 'x86_64')
url=http://www.viva64.com/en/$pkgname
license=('unknown')
depends_i686=('qemu-headless-arch-extra')
optdepends=('how-to-use-pvs-studio-free: for adding special comments to a source code')
options=('!strip')
install=$pkgname.install
source=(http://files.viva64.com/$pkgname-$pkgver-${arch[1]}.tgz)
source_i686=($pkgname.binfmt.d)
sha256sums=('9ceb8d10f3236020be01d7ba815f610a08ee70f969d842f64394d9a191679073')
sha256sums_i686=('fd7b1f7b48aa84205c1c0f60f630f1a33504e0e4904c5b0e8ae2477494899c97')

package() {
  if [ $CARCH == i686 ]; then
    install -Dm644 $pkgname.binfmt.d $pkgdir/usr/lib/binfmt.d/$pkgname.conf
  fi

  cd $pkgname-$pkgver-${arch[1]}/bin
  install -Dm755 $pkgname $pkgdir/usr/bin/$pkgname
  install -Dm755 $pkgname-analyzer $pkgdir/usr/bin/$pkgname-analyzer
  install -Dm755 plog-converter $pkgdir/usr/bin/plog-converter
}
