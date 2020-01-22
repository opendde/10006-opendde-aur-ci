pkgname=('alacritty-git' 'alacritty-terminfo-git')
_pkgname="alacritty"
pkgver=0.4.2.1436.g767d5915
pkgrel=1
arch=('x86_64' 'i686')
url="https://github.com/jwilm/alacritty"
license=('Apache')
makedepends=('rust' 'cargo' 'cmake' 'fontconfig' 'ncurses' 'desktop-file-utils' 'gdb' 'libxcb')
checkdepends=('ttf-dejavu') # for monospace fontconfig test
source=("$_pkgname::git+https://github.com/jwilm/alacritty.git")
sha256sums=('SKIP')

pkgver() {
	cd $_pkgname/alacritty
	echo "$(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2|cut -d\- -f1).$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build(){
  cd "$_pkgname"
  env CARGO_INCREMENTAL=0 cargo build --release --locked
}

check(){
  cd "$_pkgname"
  env CARGO_INCREMENTAL=0 cargo test --release
}

package_alacritty-git() {
	depends=('freetype2' 'fontconfig' 'libxi' 'libxcursor' 'libxrandr')
	optdepends=('alacritty-terminfo: terminfo for alacritty')
	provides=('alacritty')
	conflicts=('alacritty')

	cd $_pkgname

	desktop-file-install -m 644 --dir "$pkgdir/usr/share/applications/" "$srcdir/$_pkgname/extra/linux/alacritty.desktop"

	install -D -m755 "target/release/alacritty" "$pkgdir/usr/bin/alacritty"
	install -D -m644 "extra/alacritty.man" "$pkgdir/usr/share/man/man1/alacritty.1"
	install -D -m644 "extra/linux/io.alacritty.Alacritty.appdata.xml" "$pkgdir/usr/share/appdata/io.alacritty.Alacritty.appdata.xml"
	install -D -m644 "alacritty.yml" "$pkgdir/usr/share/doc/alacritty/example/alacritty.yml"
	install -D -m644 "extra/completions/alacritty.bash" "$pkgdir/usr/share/bash-completion/completions/alacritty"
	install -D -m644 "extra/completions/_alacritty" "$pkgdir/usr/share/zsh/site-functions/_alacritty"
	install -D -m644 "extra/completions/alacritty.fish" "$pkgdir/usr/share/fish/vendor_completions.d/alacritty.fish"
	install -D -m644 "extra/logo/alacritty-term.svg" "$pkgdir/usr/share/pixmaps/Alacritty.svg"
}

package_alacritty-terminfo-git() {
	pkgdesc="Terminfo files for the alacritty terminal emulator"
	depends=('ncurses')
	provides=('alacritty-terminfo')
	conflicts=('alacritty-terminfo')

	cd $_pkgname/extra

	install -dm 755 "$pkgdir/usr/share/terminfo/a/"
	tic -o "$pkgdir/usr/share/terminfo" -xe alacritty,alacritty-direct alacritty.info
}
