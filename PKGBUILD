# Maintainer: Aki-nyan <aur@catgirl.link>

pkgname=yosys-nightly
pkgver=yosys_0.11_12_g15b0d717_20211110
pkgrel=1
epoch=1
pkgdesc="Yosys Open SYnthesis Suite, A framework for RTL synthesis"
arch=("any")
url="https://yosyshq.net/yosys/"
license=("custom:ISC")
groups=()
options=("!strip")
depends=("tcl" "libffi" "python" "boost-libs" "zlib" "readline")
optdepends=("graphviz: Schematics display support" "xdot: Design netlist display support")
makedepends=("git" "gcc" "bison" "flex" "pkgconf" "gawk" "protobuf")
conflicts=("yosys" "yosys-git")
replaces=("yosys" "yosys-git")
source=("yosys::git+https://github.com/YosysHQ/yosys.git"#commit=15b0d717
		"yosys-abc::git+https://github.com/YosysHQ/abc.git"#commit=26025777
		"yosys.conf")
sha256sums=(
	"SKIP"
	"SKIP"
	"5bc68e4b7265e9e14fe70c89b818b4a0429dc6a1ff240262bb68b8ecedea3531"
)

_PREFIX="/usr"
prepare() {
	cd "${srcdir}/yosys"
	[ ! -f "${srcdir}/yosys/abc" ] && ln -s "${srcdir}/yosys-abc/" "${srcdir}/yosys/abc"
	make config-gcc
	cp "${srcdir}/yosys.conf" Makefile.conf
	cd ..
}

build() {
	cd "${srcdir}/yosys"
	make PREFIX="${_PREFIX}" -j $(nproc)
	cd ..
}

package() {
	cd "${srcdir}/yosys"
	make STRIP=':' PREFIX="${_PREFIX}" PYTHON_PREFIX="${pkgdir}${_PREFIX}" DESTDIR="${pkgdir}" install
	install -Dm644 COPYING "${pkgdir}/usr/share/licenses/yosys/LICENSE"
	cd ..
}
