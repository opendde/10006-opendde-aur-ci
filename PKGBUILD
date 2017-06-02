# $Id$
# Maintainer: Philipp A. <flying-sheep@web.de>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Micha Alt <micha.tucker at gmail dot com>

pkgname=gulp-cli
pkgver=1.3.0
pkgrel=2
pkgdesc='The streaming build system'
arch=(any)
url='http://gulpjs.com/'
license=(MIT)
depends=(nodejs semver)
makedepends=(yarn npm)
replaces=(gulp)
provides=(gulp)
conflicts=(gulp)
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
md5sums=('72001f2744a153467229292d5d564185')

build() {
	cd "$srcdir/package"
	yarn --ignore-scripts --production  # ignore prepublish
}

package() {
	cd "$srcdir/package"
	
	install -d "$pkgdir/usr/lib/node_modules/gulp-cli"
	for f in bin lib node_modules CHANGELOG.md index.js package.json README.md; do
		cp -rt "$pkgdir/usr/lib/node_modules/gulp-cli" "$f"
	done
	
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 gulp.1 "$pkgdir/usr/share/man/man1/gulp.1"
	install -d "$pkgdir/usr/bin"
	chmod 755 "$pkgdir/usr/lib/node_modules/gulp-cli/bin/gulp.js"
	ln -s "$pkgdir/usr/lib/node_modules/gulp-cli/bin/gulp.js" "$pkgdir/usr/bin/gulp"
	
	install -Dm644 completion/bash "$pkgdir/usr/share/bash-completion/completions/gulp"
	install -Dm644 completion/fish "$pkgdir/usr/share/fish/completions/gulp.fish"
	sed -i 's|#!/bin/zsh|#compdef gulp|; s/compdef \(_gulp_completion\) gulp/\1 "$@"/' completion/zsh
	install -Dm644 completion/zsh "$pkgdir/usr/share/zsh/site-functions/_gulp"
	#TODO powershell completions
	
	# dedup
	cd "$pkgdir/usr/lib/node_modules/gulp-cli/node_modules"
	for dep in semver; do
		rm -r $dep
		npm link $dep
	done
}
