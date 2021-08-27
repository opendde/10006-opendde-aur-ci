# Maintainer: Beyley Thomas <ep1cm1n10n123@gmail.com>
pkgname=lib32-libbass
pkgver=1.4.16.3
pkgrel=1
pkgdesc="BASS audio library (32-bit)"
arch=(x86_64)
url="http://www.un4seen.com/"
license=(custom)
depends=(alsa-lib)
source=(http://dl.un4seen.com/files/bass24-linux.zip LICENSE)
md5sums=('72cf03e25fea264d948e2c984e1be495'
         '3ab2a50d2f88f284eb854a6a9a35f51f')

build () {
    unzip -q bass24-linux.zip -d "$srcdir/$pkgname-$pkgver"
}

package () {
    install -D -m644 "$startdir/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    cd "$srcdir/$pkgname-$pkgver"
    install -D -m755 libbass.so "$pkgdir/usr/lib32/libbass.so"
    install -D -m644 bass.chm "$pkgdir/usr/share/doc/libbass/bass.chm"
}
