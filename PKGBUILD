# Maintainer: Damjan Georgievski <gdamjan@gmail.com>

pkgname=nginx-mainline-mod-nchan
pkgver=1.1.8
pkgrel=1

_nginxver=1.13.5

pkgdesc='nchan nginx module'
arch=('i686' 'x86_64')
depends=('nginx-mainline')
url="https://nchan.io/"
license=('MIT')

source=(
    http://nginx.org/download/nginx-$_nginxver.tar.gz
    https://github.com/slact/nchan/archive/v${pkgver}.tar.gz
)
sha256sums=('0e75b94429b3f745377aeba3aff97da77bf2b03fcb9ff15b3bad9b038db29f2e'
            '36359c0940dc1eb124a97c8229d660df38729005dce195f24f47b6658e43da94')


build() {
    cd "$srcdir"/nginx-$_nginxver
    _module_dir="$srcdir"/nchan-$pkgver
    ./configure --with-compat --add-dynamic-module=${_module_dir}
    make modules
}

package() {
    cd "$srcdir"/nginx-$_nginxver/objs
    for _mod in ngx_nchan_module.so; do
        install -Dm755 $_mod "$pkgdir"/usr/lib/nginx/modules/$_mod
    done
}

