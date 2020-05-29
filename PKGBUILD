# Maintainer: Alexander Sulfrian <asulfrian at zedat dot fu-berlin dot de>

pkgname=printer-driver-ptouch
pkgver=1.5.1
pkgrel=2
pkgdesc='P-Touch PT-series and QL-series printer driver for Linux (under CUPS)'
arch=('i686' 'x86_64')
url='https://github.com/philpem/printer-driver-ptouch'
license=('GPL')

depends=('ghostscript')
makedepends=('autoconf' 'libcups' 'foomatic-db-engine')

source=("$pkgname-$pkgver.tar.gz::https://github.com/philpem/printer-driver-ptouch/archive/v$pkgver.tar.gz"
        '0001-Add-support-for-Brother-PT-2430PC.patch')
sha256sums=('92de714d5b0103a7216812b4a497edeb879405fa57acace65e2c7b226e9e71de'
            'bf5da0201b05906c17c2c210fb1092c7ad5786d1941ba521cad6da208c11c7b9')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"

    patch -p1 < "$srcdir/0001-Add-support-for-Brother-PT-2430PC.patch"
}

build() {
    cd "$srcdir/$pkgname-$pkgver"

    autoreconf --force
    ./configure --prefix=/usr
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    make DESTDIR="$pkgdir/" install

    # Compile and remove foomatic database
    mkdir -p "$pkgdir/usr/share/ppd/"
    echo "dummy dummy" > "$pkgdir/usr/share/foomatic/db/oldprinterids"
    FOOMATICDB="$pkgdir/usr/share/foomatic" foomatic-compiledb -t ppd -d "$pkgdir/usr/share/ppd/Brother/"
    rm -r "$pkgdir/usr/share/foomatic/"
}
