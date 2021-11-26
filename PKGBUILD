# Maintainer: Thorben Günther <echo YWRtaW5AeGVucm94Lm5ldAo= | base64 -d>

pkgname=soju-git
_pkgname=soju
pkgver=v0.3.0.r6.ge3d7c33
pkgrel=1
pkgdesc='A user-friendly IRC bouncer'
arch=('x86_64')
url='https://soju.im/'
license=('AGPL3')
makedepends=('git' 'go' 'scdoc')
optdepends=(
    "sqlite: SQLite support"
    "postgresql: PostgreSQL support"
)
install=$_pkgname.install
provides=('soju')
conflicts=('soju')
source=(
    "$_pkgname::git+https://git.sr.ht/~emersion/${_pkgname}"
    "soju.sysusers"
    "soju.service"
    "soju.tmpfiles"
)
sha256sums=('SKIP'
            'c050d3f376f43e1cc22e75f445027862df8d09230e18cbb0913ab58ddced78aa'
            '4c609a9b267bb4877ba5e212f71146c87eccb13e2801edd7b68003e2ad8c2555'
            '7d9e772f42765a82be0459bcbded2074f68d450ab09c3627ca3b59978188b61b')
backup=('etc/soju/config')

pkgver() {
    cd "$srcdir/$_pkgname"
    (
        set -o pipefail
        git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
            printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
    cd "$srcdir/$_pkgname"
    export CGO_LDFLAGS="${LDFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

    go build ./cmd/soju
    go build ./cmd/sojuctl

    scdoc <doc/soju.1.scd >doc/soju.1
}

package() {
    cd "$srcdir/$_pkgname"
    make PREFIX=/usr DESTDIR=$pkgdir install
    install -Dm644 "$srcdir/$_pkgname.sysusers" "$pkgdir/usr/lib/sysusers.d/$_pkgname.conf"
    install -Dm644 "$srcdir/$_pkgname.service" "$pkgdir/usr/lib/systemd/system/$_pkgname.service"
    install -Dm644 "$srcdir/$_pkgname.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/$_pkgname.conf"
    install -Dm644 "config.in" "$pkgdir/etc/soju/config"
}
