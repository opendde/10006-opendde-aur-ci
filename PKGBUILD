# Maintainer: Vitaliy Berdinskikh <ur6lad at tuta dot io>
pkgname='xkblayout'
pkgver='1.3'
pkgrel='1'
pkgdesc='Prints the current xkb keyboard layout'
arch=('x86_64')
url='https://github.com/alenichev/xkblayout'
license=('custom' 'OpenBSD')
depends=('libx11')
makedepends=('git')
source=($pkgname-$pkgver.tar.gz::https://github.com/alenichev/$pkgname/archive/v${pkgver}.tar.gz)
sha256sums=('cba655d3cd6e779d73da28cf41729d94bcf5fc6968af0dd922fa6189099e58e9')

prepare() {
	cd "$pkgname-$pkgver"
	cat <<EOF > LICENSE
Copyright (c) 2008, 2009, 2010 Dmitry Alenichev <mitya@sdf.lonestar.org>

Permission to use, copy, modify, and distribute this software for any
purpose with or without fee is hereby granted, provided that the above
copyright notice and this permission notice appear in all copies.

THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
EOF
}

build() {
	cd "$pkgname-$pkgver"
	
	make clean all
	
	gzip $pkgname.1
}

package() {
	cd "$pkgname-$pkgver"

	install -d "$pkgdir"/usr/bin
	install -m 755 $pkgname "$pkgdir"/usr/bin/$pkgname
	
	install -d "$pkgdir"/usr/share/man/man1
	install -m 644 $pkgname.1.gz "$pkgdir"/usr/share/man/man1/$pkgname.1.gz
	
	install -d "$pkgdir"/usr/share/licenses/$pkgname
	install -m 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
