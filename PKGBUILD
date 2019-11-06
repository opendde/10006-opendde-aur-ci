# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
# Co-Maintainer: Jameson Pugh <imntreal at gmail dot com>
# Co-Maintainer: Joost Bremmer <contact at madeofmagicandwires dot online>
pkgname=cheat
pkgver=3.0.4
pkgrel=1
pkgdesc="Allows you to create and view interactive cheatsheets on the command-line"
arch=('x86_64')
url="https://github.com/cheat/cheat"
license=('MIT')
makedepends=('go-pie')
optdepends=('fzf: for Fuzzy Finder integration'
            'bash-completion: for bash completions'
            'fish: for fish completions')
conflicts=('cheat-bash-git' 'cheat-git')
replaces=('python-cheat')
source=("$pkgname-$pkgver.tar.gz::https://github.com/cheat/cheat/archive/$pkgver.tar.gz")
sha256sums=('f2c8fe12a915856c5dcb7786c3ce4ed5f05c11711b2619cd7a1722e83cf408c0')

prepare() {

    # create gopath
    mkdir -p "$srcdir/gopath"
    export GOPATH="$srcdir/gopath"

    # fetch dependencies
    msg "Fetching Go dependencies"
    cd "$pkgname-$pkgver"
    go get -d ./...
}

build() {
    cd "$pkgname-$pkgver"
    GOOS=linux \
    GOARCH=amd64 \
    go build \
        -v \
        -trimpath \
        -buildmode=pie \
        -gcflags "all=-trimpath=$srcdir" \
        -asmflags "all=-trimpath=$srcdir" \
        -ldflags "-extldflags $LDFLAGS" \
        -o "./dist/$pkgname" "./cmd/$pkgname"

    # Clean mod cache for makepkg -C
    go clean -modcache
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "dist/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm755 scripts/fzf.bash "$pkgdir/usr/share/$pkgname/fzf.bash"
    install -Dm755 "scripts/$pkgname-autocompletion.bash" \
    	"$pkgdir/usr/share/bash-completion/completions/cheat"
    install -Dm755 "scripts/$pkgname-autocompletion.fish" \
    	"$pkgdir/usr/share/fish/completions/cheat.fish"
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
