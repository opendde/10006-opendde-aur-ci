# Maintainer: Michael Bryant (Shadow53)
# Contributer: Benjamin Colard <benjamin at colard dot be>

pkgname=darkmod
pkgver=2.04
pkgrel=1
pkgdesc="DOOM III standalone mod based on the Thief series by Looking Glass Studios"
arch=('i686' 'x86_64')
url="http://www.thedarkmod.com/"
license=('CCPL')

install='darkmod.install'

makedepends=('unzip')
[ "$CARCH" == i686   ] && depends=('glew' 'libpng' 'libjpeg-turbo' 'libpng12' 'curl' 'libxxf86vm' 'libpulse')

[ "$CARCH" == x86_64 ] && depends=('lib32-glew' 'lib32-libpng' 'lib32-libjpeg-turbo' 'lib32-libpng12' 'lib32-curl' 'lib32-libxxf86vm' 'lib32-libpulse' 'lib32-alsa-plugins')

source=(http://www.fidcal.com/darkuser/tdm_update_linux.zip
        "$pkgname".desktop
        "$pkgname".png
        "$pkgname".sh)

md5sums=('3e39c23cc754f2ac55e05b5a5b56023c'
         'bc6537224b60c4ccfd04a51d80e340c1'
         '5309e528ce22f28ecc0e9781e43379e0'
         'a7a6ca33f20bb920ba0688cb8c36874c')

build() {
  cd "$srcdir"
  if [ ! -d "$srcdir/darkmod" ]; then
    mkdir $srcdir/darkmod	
  fi
  cd darkmod
  unzip -o $srcdir/tdm_update_linux.zip
  chmod +x tdm_update.linux

  # If you know which mirrors are closest to you, edit the
  # tdm_mirrors.txt file and uncomment the keep mirrors argument
  xterm -e $srcdir/darkmod/tdm_update.linux #--keep-mirrors	
  rm -f $srcdir/darkmod/{TheDarkMod.exe,tdm_update.exe,tdm_update.linux,tdm_mirrors.txt,ca-bundle.crt,crc_info.txt,tdm_update.log}
}

package() {
  cd "$srcdir"/darkmod

  install -m755 -d "$pkgdir"/opt/"$pkgname"/
  install -m755 -d "$pkgdir"/usr/bin/
  install -m755 -d "$pkgdir"/usr/share/{applications,icons,licenses/"$pkgname"}

  cp -r * "$pkgdir"/opt/"$pkgname"/
  find "$pkgdir"/opt/"$pkgname"/ -type d -exec chmod 755 {} \;
  find "$pkgdir"/opt/"$pkgname"/ -type f -exec chmod 644 {} \;
  chmod 755 "$pkgdir"/opt/"$pkgname"/thedarkmod.x86
  install -DTm755 "$srcdir"/"$pkgname".sh "$pkgdir"/usr/bin/"$pkgname"

  install -DTm644 LICENSE.txt "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
  rm -f "$pkgdir"/opt/"$pkgname"/LICENSE.txt

  install -Dm644 "$srcdir"/"$pkgname".png "$pkgdir"/usr/share/icons/
  install -Dm644 "$srcdir"/"$pkgname".desktop "$pkgdir"/usr/share/applications/
}
