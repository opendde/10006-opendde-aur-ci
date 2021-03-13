# Maintainer: Herbert Knapp Name <herbert.knapp edu.uni-graz.at>
pkgname=exact-audio-copy
pkgver=1.6
pkgrel=2
pkgdesc='A precise CD audio grabber for creating perfect quality rips using CD and DVD drives'
arch=('any')
url='https://www.exactaudiocopy.de/en/'
source=('eac.exe::http://www.exactaudiocopy.de/eac-1.6.exe')
sha512sums=('0274dee707a8bc3cc2cecd3f4564f2f56ab26066aae466b5bae1200531d7c4db04b842d10b0f8c59e939072400ff9ce9675db24b84ffbd4da6138b6d190c3660')
license=('unknown')
depends=('wine')
makedepends=('imagemagick' 'p7zip')

prepare() {
  _tmp=$(mktemp -d)
  cd ${_tmp}
  mkdir eac "$srcdir/eac/"
  cd eac
  7z x -aoa "$srcdir/eac.exe"
  chmod -R 755 .
  CYG_LATEST=$(curl -L -s https://cygwin.com/snapshots/ | sed -n 's,.*\(https://cygwin.com/snapshots/x86/cygwin1-[0-9]\+.dll.xz\).*,\1,p' | head -n 1)
  curl -s ${CYG_LATEST} > cygwin1.dll.xz
  xz --decompress cygwin1.dll.xz
  mv cygwin1.dll CDRDAO/
  cp -r * "$srcdir/eac/"
  7z x EAC.exe
  convert .rsrc/1033/ICON/29.ico -thumbnail 128x128 -alpha on -background none -flatten "$srcdir/eac/eac.ico.128.png"
  rm -r ${_tmp}
}

package() {
  mkdir -p "$pkgdir/usr/bin" "$pkgdir/usr/share/applications" "$pkgdir/opt"
  mv "$srcdir/eac" "$pkgdir/opt/exact-audio-copy"

  _launcher="$pkgdir/usr/bin/eac"
  {
    echo '#!/bin/sh'
    echo 'mkdir -p ~/.exact-audio-copy'
    echo '[[ -d ~/.exact-audio-copy/eac ]] || cp -r /opt/exact-audio-copy ~/.exact-audio-copy/eac'
    echo 'cd ~/.exact-audio-copy/eac'
    echo 'WINEDEBUG=-all WINEPREFIX=~/.exact-audio-copy wine EAC.exe'
  } > "${_launcher}"
  chmod +x "${_launcher}"
  ln -s "${_launcher}" "$pkgdir/usr/bin/exact-audio-copy"
  
  _desktop="${pkgdir}/usr/share/applications/eac.desktop"
  {
    echo '[Desktop Entry]'
    echo 'Type=Application'
    echo "Name=Exact Audio Copy ${pkgver}"
    echo "Comment=${pkgdesc}"
    echo 'Path=/opt/exact-audio-copy'
    echo 'Exec=/usr/bin/eac'
    echo 'Icon=/opt/exact-audio-copy/eac.ico.128.png'
    echo 'Terminal=false'
    echo 'Categories=AudioVideo;Audio;'
  } > ${_desktop}
}

