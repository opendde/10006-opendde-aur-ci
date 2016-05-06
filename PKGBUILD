# Maintainer: David Parrish <daveparrish@gmail.com>

pkgname=bitsquare-bin
pkgver=0.4.6
pkgrel=1
pkgdesc="Bitsquare is a cross-platform desktop application that allows users to trade national currency (dollars, euros, etc) for bitcoin without relying on centralized exchanges"
arch=('x86_64')
url="https://bitsquare.io/"
license=('AGPL3')
source_x86_64=("https://github.com/bitsquare/bitsquare/releases/download/v${pkgver}/Bitsquare-64bit-${pkgver}.deb")
md5sums_x86_64=('97eb61d90fdd145677985c97c97365e8')
_binname=Bitsquare

prepare() {
  tar -Jxvf data.tar.xz
}

package() {
  install -d "$pkgdir"/{opt/,usr/bin/,usr/share/applications,/usr/share/pixmaps,/usr/share/licenses/bitsquare}

  # Install all .deb files into /opt.
  cp -r "$srcdir/opt" "$pkgdir"

  # Symlink some files to complete install.
  ln -s "/opt/$_binname/$_binname" "$pkgdir/usr/bin/bitsquare"
  ln -s "/opt/$_binname/${_binname}.desktop" "${pkgdir}/usr/share/applications/bitsquare.desktop"
  ln -s "/opt/$_binname/${_binname}.png" "${pkgdir}/usr/share/pixmaps/bitsquare.png"
}
