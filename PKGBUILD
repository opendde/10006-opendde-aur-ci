# Maintainer: GrayJack <gr41.j4ck@gmail.com>

_pkgname=janet
pkgname=janet-lang
pkgver=1.8.1
pkgrel=1
pkgdesc="A dynamic Lisp dialect and bytecode vm"
arch=('arm' 'armv6h' 'armv7h' 'i686' 'x86_64' 'aarch64')
url="https://janet-lang.org/"
license=('MIT')
provides=('janet')
conflicts=('janet-lang-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/janet-lang/janet/archive/v${pkgver}.tar.gz")
sha256sums=('0f3ee438fb159d3081b38506e51df6406b355eb241c662ca1a3529dac0140b92')

janet_build='JANET_BUILD=\"f7ee8bd\"'

build() {
    cd $_pkgname-$pkgver
    make PREFIX="/usr" $janet_build
    make PREFIX="/usr" build/janet.pc
    make PREFIX="/usr" docs
}

package() {
    cd $_pkgname-$pkgver

    install -Dt       "${pkgdir}"/usr/bin build/janet auxbin/jpm
    install -Dm644 -t "${pkgdir}"/usr/include/janet src/include/janet.h src/conf/janetconf.h

    install -Dm644 -t "${pkgdir}"/usr/lib build/libjanet.a build/libjanet.so
    ln -s libjanet.so "${pkgdir}"/usr/lib/libjanet.so.$pkgver

    install -Dm644 "build/janet.pc" "${pkgdir}"/usr/lib/pkgconfig/janet.pc

    install -Dm644 -t "${pkgdir}"/usr/share/man janet.1 jpm.1

    install -dm644 "${pkgdir}"/usr/share/janet
    cp -a examples "${pkgdir}"/usr/share/janet

    install -Dm644 build/doc.html "${pkgdir}"/usr/share/doc/janet/doc.html
}
