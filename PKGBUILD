# Maintainer: Aaron Esau <contact@aaronesau.com>
pkgname="heaptrace"
pkgver="2.2.8"
pkgrel="1"
license=("BSD")
arch=("x86_64")
url="https://github.com/Arinerron/heaptrace"
pkgdesc="helps visualize heap operations for pwn and debugging"
source_x86_64=("${pkgname}-heaptrace::https://github.com/Arinerron/heaptrace/releases/download/${pkgver}/heaptrace" "${pkgname}-heaptrace.1::https://raw.githubusercontent.com/Arinerron/heaptrace/main/man/heaptrace.1")
sha256sums_x86_64=("e833de9fd06d841e83d43e7e422e83b64ca741cb7cb3c8aa5f0814743c44cbd5" "d5fbceef6081c53c6234d8ec5380114623a2470fe9ae78bef389feb9dc6bf89f")
noextract=("${pkgname}-heaptrace" "${pkgname}-heaptrace.1")

package() {
    install -D "${srcdir}/${pkgname}-heaptrace" "${pkgdir}/usr/bin/heaptrace" --mode=755 --owner="root" --group="root"
    install -g 0 -o 0 -m 0644 -D "${srcdir}/${pkgname}-heaptrace.1" "${pkgdir}/usr/local/man/man1/heaptrace.1"
    gzip "${pkgdir}/usr/local/man/man1/heaptrace.1"
}
