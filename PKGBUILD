# Maintainer: EatMyVenom <eat.my.venomm@gamil.com>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Uncle Hunto <unclehunto äτ ÝãΗ00 Ð0τ ÇÖΜ>
# Contributor: hagabaka

pkgname='peazip-qt-build'
pkgver=7.7.1
pkgrel=1
pkgdesc='Free cross-platform file archiver (compiles from source)'
license=('GPL3')
url='http://peazip.org'
arch=('i686' 'x86_64')
depends=('desktop-file-utils' 'balz' 'paq8o' 'p7zip' 'upx' 'zpaq')
optdepends=('quad' 'unace')
makedepends=('icoutils' 'lazarus' 'qt4pas')
provides=('peazip' 'peazip-qt')
conflicts=('peazip' 'peazip-gtk2' 'peazip-gtk2-build' 'peazip-gtk2-portable' 'peazip-qt' 'peazip-qt-opensuse-latest')
options=('!strip')
install=peazip.install
source=("https://github.com/giorgiotani/PeaZip/releases/download/$pkgver/peazip-$pkgver.src.zip")
sha512sums=('e9269b1c25960c507aa41962222e8ac719e32cc92b43bfb41b70605b8647d798e6fd7b19e021a1842e5a5807db9f3508006acce76262aed076a9e4de829c661e')

build() {
  cd "$srcdir/peazip-$pkgver.src"
  lazbuild --lazarusdir=/usr/lib/lazarus --widgetset=qt --build-all project_pea.lpi && [ -f pea ]
  lazbuild --lazarusdir=/usr/lib/lazarus --widgetset=qt --build-all project_gwrap.lpi && [ -f pealauncher ]
  lazbuild --lazarusdir=/usr/lib/lazarus --widgetset=qt --build-all project_peach.lpi && [ -f peazip ]
  icotool -x -w 256 "$srcdir/peazip-$pkgver.src/res/icons/PeaZip.ico" -o "$srcdir/peazip.png"
}

package() {
  _pkgres="$pkgdir/opt/peazip/res"
  install -Dm755 "$srcdir/peazip-$pkgver.src/peazip" "$pkgdir/opt/peazip/peazip"
  install -Dm755 "$srcdir/peazip-$pkgver.src/pea" "$_pkgres/pea"
  install -Dm755 "$srcdir/peazip-$pkgver.src/pealauncher.res" "$_pkgres/pealauncher"
  install -Dm644 "$srcdir/peazip.png" "$pkgdir/usr/share/pixmaps/peazip.png"

  cd "$srcdir/peazip-$pkgver.src/res"
  for _file in *.txt icons/*.ico lang/* themes/{*-embedded/*,*.7z}; do
    _octal=$(stat -c "%a" "$_file")
    install -Dm"${_octal}" "$_file" "$_pkgres/$_file"
  done
  cd "$srcdir"

  ln -sf -T /usr/lib/p7zip "$_pkgres/7z"
  for _file in quad/{balz,quad} unace/unace upx/upx lpaq/lpaq8 paq/paq8o zpaq/zpaq; do
    install -d "$_pkgres/$(dirname $_file)/"
    ln -sf "/usr/bin/$(basename $_file)" "$_pkgres/$_file";
  done
  install -d "$pkgdir"/usr/bin/
  for _file in /opt/peazip/{peazip,res/pea,res/pealauncher}; do
    ln -sf $_file "$pkgdir/usr/bin/$(basename $_file)"
  done

  desktop-file-install --dir="$pkgdir/usr/share/applications/" --set-icon="peazip"\
  --remove-key="Name[en_US]" "$srcdir/peazip-$pkgver.src/FreeDesktop_integration/peazip.desktop"
}
