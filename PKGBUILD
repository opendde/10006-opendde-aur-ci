# Maintainer: M0Rf30
# Contributor: said
# Contributor: Ner0
# Contributor: farnsworth517 

pkgname=soulseekqt
pkgver=20150621
_pkgver=2015-6-21

if [[ "$CARCH" == 'x86_64' ]] ; then
   _pkgver=$_pkgver-64bit
else
   _pkgver=$_pkgver-32bit
fi

pkgrel=1
pkgdesc="A desktop client for the Soulseek peer-to-peer file sharing network"
arch=('i686' 'x86_64')
url="http://www.soulseekqt.net/news/"
license=('custom')

if [[ "$CARCH" == 'i686' ]] ; then
   depends=( 'libxext' 'fontconfig' 'libxrender' 'libsm' 'alsa-lib' )
   md5sums=( 'f0ae206b59144a3773fb609b86d24c39'
             '0a2137a47e9ac0b4b57a0d55872d0842'
             '256ec24f7ad2d39ac8da0f1c03d3cafe' )
elif [[ "$CARCH" == 'x86_64' ]] ; then
   depends=( 'libxext' 'fontconfig' 'libxrender' )
   md5sums=( '7d3f295e219782cca78a813ab682ff23'
             '0a2137a47e9ac0b4b57a0d55872d0842'
             '256ec24f7ad2d39ac8da0f1c03d3cafe' )
fi

source=( "https://dl.dropboxusercontent.com/u/7226803/SoulseekQt-$_pkgver.tgz"
	 #"http://www.soulseekqt.net/SoulseekQT/Linux/SoulseekQt-$_pkgver.tgz"
         $pkgname.desktop 
         $pkgname.png )

package() {
  install -vDm755 "$srcdir/SoulseekQt-$_pkgver" "$pkgdir/usr/bin/$pkgname"
  install -vDm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -vDm644 "$srcdir/$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
