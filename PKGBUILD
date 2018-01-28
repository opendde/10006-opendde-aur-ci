# Contributor: Fincer <fincer89 at hotmail dot com>
pkgname=panotourpro
pkgver=2.5.9
_pkgver=259_2017-12-20
_pkgname=PanotourPro
pkgrel=1
pkgdesc='Create pro-quality virtual tours (trial version).'
arch=('x86_64')
url='http://kolor.com/'
license=('custom: "commercial"')
depends=('qt5-base')
install=$pkgname.install

  source=("PanotourPro_Linux64_$_pkgver.tar.gz::http://download.kolor.com/ptp/stable/linux64targz"
  "$pkgname" "$pkgname.desktop" "$pkgname.png")
md5sums=('889f62c426d55b5d4313a9f1d0b234df'
         '2fb0de89c4749a8a50c7a8fe14555d98'
         '361fb305589d79e1047f57c8809a6a30'
         '38a6cdebc5175c97a5cd0a8cac4b1b11')

package(){
  cd "$srcdir/$_pkgname" || return 1
  install -dm755 $pkgdir/opt/$pkgname || return 1
  tar -c ./ | tar -x -C $pkgdir/opt/$pkgname || return 1
  install -Dm755 $srcdir/$pkgname $pkgdir/usr/bin/$pkgname || return 1
  install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "$srcdir/$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}

