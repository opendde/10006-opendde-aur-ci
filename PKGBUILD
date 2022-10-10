# Contributor: EatMyVenom <eat.my.venomm@gamil.com>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Uncle Hunto <unclehunto äτ ÝãΗ00 Ð0τ ÇÖΜ>
# Contributor: hagabaka

pkgname='peazip-qt5'
pkgver=8.9.0
pkgrel=1
pkgdesc='Free file archiver utility, open, extract RAR TAR ZIP archives'
license=('GPL3')
url='http://peazip.org'
arch=('i686' 'x86_64')
depends=('brotli' 'zstd' '7-zip' 'qt5pas')
optdepends=('quad' 'unace' 'paq8o' 'upx' 'zpaq')
makedepends=('lazarus' 'git')
provides=('peazip')
conflicts=('peazip')
options=('!strip')
source=("git+https://github.com/peazip/PeaZip.git#tag=$pkgver"
"help-$pkgver.pdf::https://github.com/peazip/PeaZip/releases/download/$pkgver/peazip_help.pdf")
sha512sums=('SKIP'
            'e3403c162f5d841fd93366f66f7277feb67606ff3f9cd9dda52b922902b1a51c75f4afc5426933e9ae4b192eba7c42c3ab682c9b4e4dc2c93f5e0d0427618f61')

build() {
  cd "$srcdir/PeaZip/peazip-sources/dev"
  lazbuild --lazarusdir=/usr/lib/lazarus --widgetset=qt5 --build-all project_pea.lpi && [ -f pea ]
  lazbuild --lazarusdir=/usr/lib/lazarus --widgetset=qt5 --build-all project_peach.lpi && [ -f peazip ]
}

package() {
  # binary
  install -Dm755 "$srcdir/PeaZip/peazip-sources/dev/peazip" "$pkgdir/usr/lib/peazip/peazip"
  install -Dm755 "$srcdir/PeaZip/peazip-sources/dev/pea" "$pkgdir/usr/lib/peazip/pea"
  
  # icon
  cd "$srcdir/PeaZip/peazip-sources/res/share/icons"
  install -Dm644 peazip_{7z,rar,zip}.png -t "${pkgdir}/usr/share/icons/hicolor/256x256/mimetypes"
  install -Dm644 peazip_{add,extract,browse,convert}.png -t "${pkgdir}/usr/share/icons/hicolor/256x256/actions"

  # desktop
  cd "$srcdir/PeaZip/peazip-sources/res/share/batch/freedesktop_integration"
  install -Dm644 peazip.png -t "${pkgdir}/usr/share/icons/hicolor/256x256/apps"
  install -Dm644 peazip.desktop -t "$pkgdir/usr/share/applications"

  # help & res
  install -d "$pkgdir/usr/share/peazip"
  install -Dm644 "$srcdir/help-$pkgver.pdf" "$pkgdir/usr/share/peazip/peazip_help.pdf"
  cd "$srcdir/PeaZip/peazip-sources/res/share"
  cp -r icons lang themes "$pkgdir/usr/share/peazip/"
  install -d "$pkgdir/usr/lib/peazip/res"
  ln -sf /usr/share/peazip "$pkgdir/usr/lib/peazip/res/share"

  # 3rdprart binary
  install -d "$pkgdir/usr/lib/peazip/res/bin"
  install -d "$pkgdir/usr/lib/peazip/res/bin/7z"
  ln -sf /usr/bin/7zz "$pkgdir/usr/lib/peazip/res/bin/7z/7z"
  for _file in brotli/brotli lpaq/lpaq8 paq/paq8o quad/bcm unace/unace upx/upx zpaq/zpaq zstd/zstd; do
    install -d "$pkgdir/usr/lib/peazip/res/bin/$(dirname $_file)/"
    ln -sf "/usr/bin/$(basename $_file)" "$pkgdir/usr/lib/peazip/res/bin/$_file";
  done

  install -d "$pkgdir"/usr/bin/
  ln -sf /usr/lib/peazip/peazip "$pkgdir/usr/bin/peazip"
  ln -sf /usr/lib/peazip/pea "$pkgdir/usr/bin/pea"
}
