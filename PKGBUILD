# Maintainer: Tomasz Gruszka <tompear79@gmail.com>
_phpversion=73
_extname=xdebug
pkgname=php${_phpversion}-${_extname}
pkgver=2.9.0
pkgrel=1
pkgdesc="Xdebug is an extension for PHP to assist with debugging and development"
arch=("x86_64")
url="https://xdebug.org/"
license=('Xdebug')
depends=("php${_phpversion}")
source=("http://pecl.php.net/get/${_extname}-${pkgver}.tgz")
sha256sums=('8dd1f867805d4ae78ccefc1825da1180eb82efbe6d6575eef2cc3dd1aeca5943')
backup=("etc/php${_phpversion}/conf.d/$_extname.ini")

build() {
    cd "${srcdir}/${_extname}-${pkgver}"
    phpize${_phpversion}
    ./configure
    make

    cd "$srcdir/${_extname}-${pkgver}/debugclient"
    ./configure --prefix=/usr
    make
}

package() {
    cd "${srcdir}/${_extname}-${pkgver}"

    install -dm0755 "${pkgdir}/etc/php${_phpversion}/conf.d/"
    echo "zend_extension=${_extname}.so" > "${pkgdir}/etc/php${_phpversion}/conf.d/${_extname}.ini"

    install -Dm0644 "${srcdir}/${_extname}-${pkgver}/modules/${_extname}.so" "${pkgdir}/usr/lib/php${_phpversion}/modules/${_extname}.so"
    install -Dm0644 "${srcdir}/${_extname}-${pkgver}/debugclient/debugclient" "${pkgdir}/usr/bin/debugclient${_phpversion}"
    install -Dm0644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
