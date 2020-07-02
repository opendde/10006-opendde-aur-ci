# Maintainer: Damjan Georgievski <gdamjan@gmail.com>

pkgname=nginx-mainline-mod-nchan
pkgver=1.2.7
pkgrel=2

_nginxver=1.19.0

pkgdesc='nchan nginx module'
arch=('i686' 'x86_64')
depends=("nginx-mainline=${_nginxver}")
url="https://nchan.io/"
license=('MIT')

source=(
    https://github.com/slact/nchan/archive/v${pkgver}.tar.gz
    http://nginx.org/download/nginx-$_nginxver.tar.gz
    f484c603a81c3bddd3f0160cfdbe231b8a453cde.diff
)

build() {
    _module_dir="$srcdir"/nchan-$pkgver
    patch -p1 -d $_module_dir < f484c603a81c3bddd3f0160cfdbe231b8a453cde.diff

    cd "$srcdir"/nginx-$_nginxver
    ./configure --with-compat --add-dynamic-module=${_module_dir}
    make modules
}

package() {
    cd "$srcdir"/nginx-$_nginxver/objs
    for _mod in ngx_nchan_module.so; do
        install -Dm755 $_mod "$pkgdir"/usr/lib/nginx/modules/$_mod
    done
}

sha256sums=('8bb5d1749af759bb5e9cc5476a9c4b44d51bee6096bb89ab5ff53e85367b490b'
            '44a616171fcd7d7ad7c6af3e6f3ad0879b54db5a5d21be874cd458b5691e36c8'
            '9f73929de9741a3571de712f6767069ea0a3e16282ac7b3e3d33df77113d04ed')
