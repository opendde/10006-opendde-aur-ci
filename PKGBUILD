# Maintainer: Hoàng Văn Khải <hvksmr1996@gmail.com>

# This file is automatically generated. Do not edit.

pkgname=pretty-exec-bin
pkgver=0.0.15
source=(pretty-exec-7eb3a87858acf1060a6120a664236486d8195c33::https://github.com/KSXGitHub/pretty-exec/releases/download/0.0.15/pretty-exec-x86_64-unknown-linux-gnu https://raw.githubusercontent.com/KSXGitHub/pretty-exec/master/LICENSE.md)
_checksum=7eb3a87858acf1060a6120a664236486d8195c33
# This PKGBUILD is not a full PKGBUILD
# pkgname, pkgver, source, and sha1sums are to be generated
pkgdesc='Print command and execute it'
pkgrel=0
arch=(x86_64)
license=(MIT)
url='https://github.com/KSXGitHub/pretty-exec'
conflicts=(pretty-exec)
sha1sums=($_checksum SKIP)

package() {
  install -Dm755 pretty-exec-$_checksum "$pkgdir"/usr/bin/pretty-exec
  install -Dm644 LICENSE.md "$pkgdir"/usr/share/"$pkgname"/LICENSE.md
}

