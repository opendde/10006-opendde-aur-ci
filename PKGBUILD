# Maintainer: mzz2017 <mzz@tuta.io>

pkgname=v2raya-git
pkgver=20220420.r1112.a18b689
pkgrel=1
install=.INSTALL
pkgdesc="v2rayA nightly version"
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/v2rayA/v2rayA"
license=('GPL3')
depends=('glibc')
optdepends=('v2ray>=4.37.0-1' 'xray>=1.4.2-1')
makedepends=('git' 'go>=2:1.16.0-1' 'nodejs>=14' 'yarn' 'python2')
provides=('v2raya')
conflicts=('v2raya')
source=("$pkgname::git+$url")
sha512sums=('SKIP')

pkgver() {
    cd "$srcdir"/"$pkgname"
    local date=$(git log -1 --format="%cd" --date=short | sed s/-//g)
    local count=$(git rev-list --count HEAD)
    local commit=$(git rev-parse --short HEAD)
    echo "$date.r${count}.$commit"
}

build() {
    cd "$srcdir/$pkgname/gui"
    yarn --check-files
    export OUTPUT_DIR="$srcdir/$pkgname/service/server/router/web"
    yarn build

    cd "$srcdir/$pkgname/service"
    export GO111MODULE=on
    export GOPROXY=https://goproxy.cn,direct
    go build -ldflags '-X github.com/v2rayA/v2rayA/conf.Version=unstable-'"$(pkgver)"' -s -w' -o v2raya
}

package() {
    cd "${srcdir}"/"${pkgname}"/
    install -Dm 755 service/v2raya -t "${pkgdir}"/usr/bin/
    install -dm 750 "${pkgdir}"/etc/v2raya/
    install -Dm 644 install/universal/v2raya.desktop -t "${pkgdir}"/usr/share/applications/
    install -Dm 644 install/universal/v2raya.service -t "${pkgdir}"/usr/lib/systemd/system/
    install -Dm 644 install/universal/v2raya-lite.service -t "${pkgdir}"/usr/lib/systemd/system/
    install -Dm 644 gui/public/img/icons/android-chrome-512x512.png "${pkgdir}"/usr/share/icons/hicolor/512x512/apps/v2raya.png
}
