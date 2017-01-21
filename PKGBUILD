# shellcheck disable=SC2034,SC2154,SC2164
pkgname=('tini')
_srcname='tini'
# shellcheck disable=SC2016
pkgdesc='A tiny but valid `init` for containers'
pkgver='0.13.2'
_commit='c6e0058046c674e6bc982675f41db69829568c32'
pkgrel='1'
arch=('i686' 'x86_64')
url="https://github.com/krallin/${_srcname}"
license=('MIT')

depends=('glibc')
makedepends=('git' 'cmake' 'gcc' 'vim')
provides=("${pkgname[0]%-git}")
conflicts=("${pkgname[0]%-git}")

source=("${_srcname}::git+${url}.git#commit=${_commit}")
sha512sums=('SKIP')

build() {
    cd "${srcdir}/${_srcname}"

    cmake -DCMAKE_INSTALL_PREFIX='/usr' .
    make
}

package() {
    cd "${srcdir}/${_srcname}"

    make DESTDIR="${pkgdir}" install
    rm "${pkgdir}/usr/bin/tini-static"
}
