# Maintainer: fantasyzhjk <fantasyzhjk@outlook.com>
pkgname=autofishbot-git
pkgver=r2.bcaaf0a
pkgrel=1
pkgdesc="An auto fishing robot for Minecraft server."
url="https://github.com/MscBaiMeow/AutoFishingBot"
arch=('x86_64' 'i686')
license=('MIT')
makedepends=('go')
source=("${pkgname}::git+${url}")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${srcdir}/${pkgname}"
	install -m777 -d "${srcdir}/go/src/github.com/MscBaiMeow/"
	ln -sf "${srcdir}/${pkgname}" "${srcdir}/go/src/github.com/MscBaiMeow/AutoFishingBot"
	cd "${srcdir}/go/src/github.com/MscBaiMeow/AutoFishingBot"
	export GOPATH="${srcdir}/go"
	go get -v ./...
}

build() {
	cd "${srcdir}/go/src/github.com/MscBaiMeow/AutoFishingBot"
	mkdir -p build
	export GOPATH="${srcdir}/go"
	go build -ldflags "-s -w" \
		-gcflags="all=-trimpath=${GOPATH}/src" \
		-asmflags="all=-trimpath=${GOPATH}/src" \
		-o build/AutoFishingBot .
}

package() {
	cd "${srcdir}/go/src/github.com/MscBaiMeow/AutoFishingBot"
	install -Dm755 "./build/AutoFishingBot" "${pkgdir}/usr/bin/autofishbot-git"
	install -Dm644 "./LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
