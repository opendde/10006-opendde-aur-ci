# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Ray Del Rosario <michael@raydelrosario.com>

pkgname=infracost
pkgver=0.10.10
pkgrel=2
pkgdesc='Cloud cost estimates for Terraform'
url='https://github.com/infracost/infracost'
arch=('x86_64')
license=('Apache')
depends=('glibc')
makedepends=('go')
# checkdepends=('git' 'terraform')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('dd216a1f304d2b0af3de98c7df56b5eed0fac7fffcb41ca635118b94ee4385f5')

prepare() {
	cd "$pkgname-$pkgver"
	mkdir -p build
	go mod download
}

build() {
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
	cd "$pkgname-$pkgver"
	go build \
		-o build \
		-ldflags "-linkmode=external -X \
		'${url#https://}/internal/version.Version=v$pkgver'" \
		"./cmd/$pkgname"
}

## tests require an infracost_api key
# check() {
# 	cd "$pkgname-$pkgver"
# 	go test -ldflags "-linkmode=external" ./...
# }

package() {
	cd "$pkgname-$pkgver"
	install -D "build/$pkgname" -t "$pkgdir/usr/bin/"
}
