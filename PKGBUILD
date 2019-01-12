# Maintainer: Ryan Petris (ryan@petris.net)

pkgbase=libpod
pkgname=(
	"libpod"
	"libpod-docker"
)
pkgver=0.12.1.2
pkgrel=2
pkgdesc="A library used to create container pods."
arch=("x86_64")
url="https://github.com/containers/libpod"
license=("Apache")
makedepends=(
	"cni-plugins"
	"cri-o"
	"device-mapper"
	"go"
	"go-md2man"
	"iptables"
	"libseccomp"
	"ostree"
	"runc"
)
source=("https://github.com/containers/libpod/archive/v${pkgver}.tar.gz")
sha256sums=('bcde54cad3d08c84af7d18f5a5ef192121bf8e562b6e6cd8a75762c1664ac9c0')

prepare() {
	export GOPATH="${srcdir}/go"
	mkdir -p "${GOPATH}/src/github.com/containers"

	sed -i "s/-ldflags '\$(LDFLAGS)'/-gccgoflags '\$(LDFLAGS)'/g" "${pkgbase}-${pkgver}/Makefile"
	sed -i "s/-ldflags '\$(LDFLAGS_PODMAN)'/-gccgoflags '\$(LDFLAGS)' -ldflags '\$(LDFLAGS_PODMAN)'/g" "${pkgbase}-${pkgver}/Makefile"
	sed -i "s/LDFLAGS_PODMAN ?= \$(LDFLAGS)/LDFLAGS_PODMAN ?=/g" "${pkgbase}-${pkgver}/Makefile"

	mv "${pkgbase}-${pkgver}" "${GOPATH}/src/github.com/containers/${pkgbase}"
}

build() {
	export GOPATH="${srcdir}/go"
	cd "${GOPATH}/src/github.com/containers/${pkgbase}"
	sed -i 's/$(GO) build -i/$(GO) build/' Makefile

	make install.tools
	make all
}

package_libpod() {
	depends+=(
		"cri-o"
		"device-mapper"
		"iptables"
		"libseccomp"
		"runc"
		"ostree"
		"skopeo"
	)
	optdepends+=(
		"libpod-docker: docker cli"
	)
	provides+=(
		"podman"
		# 2018-12-28: keep this for a few releases for packages that depend on it
		"libpod-networking"
	)
	conflicts+=(
		"podman"
		"libpod-networking"
	)

	export GOPATH="${srcdir}/go"
	cd "${GOPATH}/src/github.com/containers/${pkgbase}"

	make install.bin install.cni install.completions install.config install.man install.systemd DESTDIR="${pkgdir}" PREFIX="${pkgdir}/usr"

	# seccomp.json is provided by cri-o
	rm "${pkgdir}/etc/crio/seccomp.json"
	find "${pkgdir}" -type d -empty -delete
}

package_libpod-docker() {
	pkgdesc="Use podman as a Docker CLI replacement."
	depends+=(
		"libpod"
	)
	conflicts+=(
		"docker"
	)
	provides+=(
		"docker"
	)

	export GOPATH="${srcdir}/go"
	cd "${GOPATH}/src/github.com/containers/${pkgbase}"

	make install.docker DESTDIR="${pkgdir}" PREFIX="${pkgdir}/usr"
}
