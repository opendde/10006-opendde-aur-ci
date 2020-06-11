# Maintainer: Alex Zose <alexander.zosimidis[at]gmail[dot]com>

pkgname=gophish
pkgver=0.10.1
pkgrel=1
pkgdesc="Open-Source Phishing Framework"
url="https://getgophish.com/"
arch=("x86_64")
license=('MIT')
depends=('glibc')
install="gophish.install"
source=("https://github.com/gophish/gophish/releases/download/v$pkgver/$pkgname-v$pkgver-linux-64bit.zip"
        "gophish.service")
sha512sums=("854e74ce9052e82680e62d39797da832484896a1dcdeea936df9efa5cf8ff015f9c4e6f98311328b5eac958ac1d8fe76286b9c1fef0c0dc1176563ef69babcde"
            "c712c7680f661d399d0613ad2ff5598f2ef6a7f385567b264b55675feee052718da009e0b9dd3c5b5b56f5ba1de0165860eee53eacbdcd939289d34f42e0e147")

package() {
        install -dm 755 "$pkgdir"/usr/share/"$pkgname"

        cp -r "$srcdir"/db "$pkgdir"/usr/share/"$pkgname"/
        cp -r "$srcdir"/static "$pkgdir"/usr/share/"$pkgname"/
        cp -r "$srcdir"/templates "$pkgdir"/usr/share/"$pkgname"/

        install -Dm755 "$srcdir"/"$pkgname" "$pkgdir"/usr/bin/"$pkgname"
        install -Dm644 "$pkgname".service "$pkgdir"/usr/lib/systemd/system/"$pkgname".service
        install -Dm644 "$srcdir"/LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
        install -Dm644 "$srcdir"/README.md "$pkgdir"/usr/share/doc/"$pkgname"/README.md
        install -Dm644 "$srcdir"/config.json "$pkgdir"/usr/share/"$pkgname"/config.json
        install -Dm644 "$srcdir"/VERSION "$pkgdir"/usr/share/"$pkgname"/VERSION
}
