# Maintainer: Wenxuan <wenxuangm@gmail.com>
_pkgname=csview
pkgname=csview-git
pkgver=0.3.6.48.gca098b0
pkgrel=1
pkgdesc='A high performance csv viewer with cjk/emoji support'
arch=(i686 x86_64)
url='https://github.com/wfxr/csview'
license=('MIT' 'APACHE')
makedepends=('git' 'rust' 'cargo')
conflicts=("${_pkgname}" "${_pkgname}-bin")
provides=("${_pkgname}")

source=("${_pkgname}::git+${url}")
sha256sums=("SKIP")

pkgver() {
    cd "${_pkgname}"
    echo "$(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2|cut -d\- -f1).$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
    cd "${_pkgname}"
    cargo build --release --locked
}

package() {
    cd "$srcdir/${_pkgname}"
    install -Dm755 "target/release/${_pkgname}"        "$pkgdir/usr/bin/${_pkgname}"
    install -Dm644 "completions/fish/${_pkgname}.fish" "$pkgdir/usr/share/fish/vendor_completions.d/${_pkgname}.fish"
    install -Dm644 "completions/zsh/_${_pkgname}"      "$pkgdir/usr/share/zsh/site-functions/_${_pkgname}"
    install -Dm644 "README.md"                         "$pkgdir/usr/share/doc/${_pkgname}/README.md"
    install -Dm644 "LICENSE-MIT"                       "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE-MIT"
    install -Dm644 "LICENSE-APACHE"                    "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE-APACHE"
}

# vim:set noet sts=0 sw=4 ts=4 ft=PKGBUILD:
