# Maintainer: Slava Zubik

pkgname=zvvonlinemusic
pkgver=0.6
pkgrel=3
pkgdesc="Online music player"
arch=('i386' 'x86_64')
url="https://zvvubuntu.blogspot.com"
license=('custom')
depends=('pyqt5-common' 'python-pyqt5' 'vlc') 

source=("${pkgname}_${pkgver}.deb::https://docs.google.com/uc?id=15pykzYXxh0zTJnb1FnDnrpHQkE9yW4m6"
"zvvonlinemusic" "ZVVOnlineMusic.desktop")
md5sums=('d29e3701467a694676566fbb2a8bf409'
         '5983b546cc455df767ac3767008c69ff'
         'e5bd3b3664e3ae853b42947a08078137')

package() {
  cd "${srcdir}"
  bsdtar -xf data.tar.xz -C "$pkgdir"
  install -Dm755 zvvonlinemusic $pkgdir/usr/bin/zvvonlinemusic
  install -Dm755 ZVVOnlineMusic.desktop $pkgdir/usr/share/applications/zvvonlinemusic.desktop
chmod -R 755 "${pkgdir}"/usr
  chmod -R 755 "${pkgdir}"/usr/share/zvvonlinemusic
  chmod -R 755 "${pkgdir}"/usr/share/icons/
}
