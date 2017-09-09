# Maintainer: M0Rf30
# Contributor: said
# Contributor: Ner0
# Contributor: farnsworth517 

pkgname=soulseekqt
pkgver=20170830
_pkgver=2017-8-30
pkgrel=1
pkgdesc="A desktop client for the Soulseek peer-to-peer file sharing network"
arch=('x86_64')
url="http://www.soulseekqt.net/news/"
license=('CUSTOM')
depends=('double-conversion' 'fontconfig' 'libxext' 'libxrender' 'qt5-multimedia')
makedepends=('libselinux')
source=($pkgname.desktop 
        $pkgname.png )

source=("https://www.dropbox.com/s/wborsit53rlj7bz/SoulseekQt-$_pkgver-64bit.AppImage")

package () {
  cd $srcdir

  chmod +x SoulseekQt-$_pkgver-64bit.AppImage

  ./SoulseekQt-$_pkgver-64bit.AppImage  --appimage-extract

  cd squashfs-root

  install -vDm755 SoulseekQt "$pkgdir/usr/bin/$pkgname"
  install -vDm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -vDm644 "$srcdir/$pkgname.png" "$pkgdir/usr/share/pixmaps/soulseek.png"
}

md5sums=('ff459e9c5a2b677185be7fc50f9733c8')
