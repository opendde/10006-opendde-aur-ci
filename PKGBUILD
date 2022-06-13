# Maintainer: Luke Arms <luke@arms.to>

pkgname=db2-odbc-cli
# Mentioned in clidriver/license/UNIX/odbc_LI_en
pkgver=11.5.6.0
pkgrel=1
pkgdesc='IBM Data Server Driver for ODBC and CLI'
arch=('x86_64')
url='https://www.ibm.com/support/pages/db2-odbc-cli-driver-download-and-installation-information'
license=('custom:IBM IPLA')
depends=('audit' 'gcc-libs' 'glibc' 'icu' 'libcap-ng' 'pam' 'xz' 'zlib' 'libxml2' 'libxcrypt-compat')
source=("linuxx64_odbc_cli-$pkgver.tar.gz::https://public.dhe.ibm.com/ibmdl/export/pub/software/data/db2/drivers/odbc_cli/linuxx64_odbc_cli.tar.gz")
sha256sums=('0b0c7fa9aad9544024cafc72bcd44ff704dc7ec59431ce7f219bf1d84c58bbb3')

package() {
    local f
    install -d "$pkgdir/opt"
    install -d "$pkgdir/usr/share/licenses/$pkgname"
    cd "$srcdir"
    for f in clidriver/license/UNIX/odbc_LI_*; do
        install -m 0644 "$f" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-${f##*/odbc_LI_}.txt"
    done
    mv "$pkgdir/usr/share/licenses/$pkgname"/LICENSE{-en,}.txt
    for f in clidriver/license/odbc_*; do
        install -m 0644 "$f" "$pkgdir/usr/share/licenses/$pkgname/${f##*/odbc_}"
    done
    rm -rf clidriver/{license,db2dump}
    mv -T clidriver "$pkgdir/opt/$pkgname"
}
