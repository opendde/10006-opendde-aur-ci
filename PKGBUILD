# Maintainer: Gesh <gesh@gesh.uni.cx>
# Contributor: Ashwin Vishnu <9155111+ashwinvis@users.noreply.github.com>
# Contributor: Ashwin Vishnu <ashwinvis+gh@protonmail.com>
# Contributor: Doron Behar <doron.behar@gmail.com>

pkgname=pandoc-crossref-static-git
_pkgname="${pkgname%-static-git}"
pkgver=0.3.12.2a.r4.gfe1f71b
_pandoc_type=version
_pandoc_ver=2.18
_pandoc_commit=64a21caa6c802eabaabecc181087dc7c42580946
pkgrel=2
pkgdesc="Pandoc filter for cross-references (static build)"
url="https://github.com/lierdakil/pandoc-crossref"
license=("GPL2")
arch=('x86_64')
conflicts=("pandoc-crossref")
provides=("$_pkgname=${pkgver%%.r*}")
replaces=('pandoc-crossref-bin' 'pandoc-crossref-static' 'pandoc-crossref-lite')
depends=("pandoc=$_pandoc_ver")
makedepends=('stack' 'pandoc')
source=("$pkgname::git+$url.git" ver-bump.patch
    0001-Update-tests-for-pandoc-5f0bfd41.patch)
sha256sums=('SKIP'
            '9b15ac6f617e583eda0cfd7308ff8fead84dc6200e1e94fad695fb8602e38bbe'
            '6b92482325fdefcb0588efd1f0ad0bb632ad509b8538aae63a32a128f0c0d5bf')

pkgver() {
    cd "$pkgname"
    git describe --tags --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$pkgname"
    patch --forward --strip=1 --input="${srcdir}/ver-bump.patch"
    git apply "${srcdir}/0001-Update-tests-for-pandoc-5f0bfd41.patch"
    sedscript=''
    case "$_pandoc_type" in
    stock) return;;
    commit)
        sedscript='/ pandoc-\([0-9]\+\.\)\{1,3\}[0-9]\+/{'
        sedscript+='s#pandoc.*#github: jgm/pandoc#;'
        sedscript+="a\  commit: $_pandoc_commit"$'\n'
        sedscript+='}'
        ;;
    version)
        sedscript="s/ pandoc-\([0-9]\+\.\)\{1,3\}[0-9]\+/ pandoc-$_pandoc_ver/"
        ;;
    esac
    sed -i "$sedscript" stack.yaml
    _pandoc_bound=$(awk -F. '/[0-9]+\./{$NF++;print}' OFS=. <<<"${_pandoc_ver}")
    sed -i "/, pandoc /s#<.*#<$_pandoc_bound#" \
        pandoc-crossref.cabal package.yaml
}

check() {
    cd "$pkgname"

    stack test
}

build() {
    cd "$pkgname"

    stack setup
    stack build \
        --install-ghc \
        --ghc-options='-fdiagnostics-color=always' \
        --flag 'pandoc:embed_data_files' \
        --fast
    pandoc -s -t man docs/index.md -o pandoc-crossref.1
}

package() {
    cd "$pkgname"
    stack install --local-bin-path "$pkgdir/usr/bin"
    install -Dm644 pandoc-crossref.1 \
        "${pkgdir}"/usr/share/man/man1/pandoc-crossref.1
}
