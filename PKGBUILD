# Maintainer: gardenapple <gardenapple at posteo dot net>

_pkgname=readability-cli
pkgname="deno-$_pkgname"
_author=gardenappl
pkgver=2.4.2
pkgrel=1
pkgdesc="Firefox Reader Mode in your terminal! - CLI tool for Mozilla's Readability library"
arch=('any')
url='https://gitlab.com/gardenappl/readability-cli'
license=('GPL3')
provides=('readability-cli' 'readable')
conflicts=('readability-cli')
depends=('deno')
makedepends=('deno')
source=(
	"https://gitlab.com/$_author/$_pkgname/-/archive/v$pkgver/$_pkgname-v$pkgver.tar.bz2"
	readable
	readable-sandbox
)

package() {
	cd "$srcdir/$_pkgname-v$pkgver"

	install -Dm644 *.mjs -t "$pkgdir/usr/lib/$_pkgname/"
	install -Dm755 readable.ts -t "$pkgdir/usr/lib/$_pkgname/"
	install -Dm644 locales/*.json -t "$pkgdir/usr/lib/$_pkgname/locales"

	install -Dm644 readability-cli.1 -t "$pkgdir/usr/share/man/man1"
	ln -s ./readability-cli.1 "$pkgdir/usr/share/man/man1/readable.1"

	# Symlinks
	cd "$srcdir"

	install -Dm755 readable -t "$pkgdir/usr/bin"
	install -Dm755 readable-sandbox -t "$pkgdir/usr/bin"

	# Shell completions (buggy in Deno atm)
	#cd "$pkgdir/usr/bin"
	#SHELL=/bin/zsh ./readable --completion \
	#	| install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_readable"
	#SHELL=/bin/bash ./readable --completion \
	#	| install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/readable"
}
b2sums=('1356eae452953014c02844640614e1ec98a5bc7aea034f5704c8b5d68fbd3f69d143d1a6586a6b871f8e6f8f3b1119345bcfc245299380b80f5b8bdde8e9e806'
        '792be8184fbdf51fc8a4aa90b9c55de9814700bb1396ac24dd7a1759413144ddabd64ff7391f55b9ae602a0415b86a7a51fbfda0e1856cd1a476f232fea4939c'
        '55fad2e72126bc7b3253ee6598e3e3c83d63a3d4da03402a828ac8f1a5d321e98f25484e74d4654082f7a41dd1d45465878ac41d91b48391adce15f3921ee0ca')
