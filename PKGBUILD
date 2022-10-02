# Maintainer: Jesus Alvarez <jeezusjr at gmail dot com>

pkgname=jakt-git
pkgver=r1910.9743d976
pkgrel=4
pkgdesc="The Jakt Programming Language from SerenityOS"
arch=("x86_64")
url="https://github.com/SerenityOS/jakt"
license=("BSD")
depends=("clang")
makedepends=("ninja" "cmake" "git")
provides=("jakt")
conflicts=("jakt")
source=("${pkgname}::git+https://github.com/SerenityOS/jakt.git")
md5sums=('SKIP')

pkgver() {
    cd "${pkgname}"
    ( set -o pipefail
      git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
    cd "${pkgname}"

    # stage1
    cmake -GNinja -B build -DCMAKE_CXX_COMPILER=clang++ -DCMAKE_BUILD_TYPE=Release -DFINAL_STAGE=1
    cmake --build build

    # test stage1
    ./build/bin/jakttest

    # stage2
    cmake -B build -DFINAL_STAGE=2
    cmake --build build
}

check() {
    cd "${pkgname}"
    ./build/bin/jakttest
}

package() {
    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/usr/include"
    install -d "${pkgdir}/usr/share/doc/jakt"
    install -d "${pkgdir}/usr/share/licenses/jakt"

    cd "${pkgname}"

    install -Dm755 "build/bin/jakt" "${pkgdir}/usr/bin/jakt"

    install -Dt "${pkgdir}/usr/include" -m644 runtime/*.h
    install -Dt "${pkgdir}/usr/include/Builtins" -m644 runtime/Builtins/*.h
    install -Dt "${pkgdir}/usr/include/IO" -m644 runtime/IO/*.h
    install -Dt "${pkgdir}/usr/include/Jakt" -m644 runtime/Jakt/*.h
    install -Dm 644 "runtime/prelude.jakt" -t "${pkgdir}/usr/include"

    install -Dm 644 "build/lib/libjakt_runtime.a" -t "${pkgdir}/usr/lib"
    install -Dm 644 "build/lib/libjakt_main.a" -t "${pkgdir}/usr/lib"

    install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/jakt"
    install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/jakt"
}
