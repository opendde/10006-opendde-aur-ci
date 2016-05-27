# Maintainer: Philippe Proulx <pproulx@efficios.com>

pkgname=liblttng-ust-python-agent
pkgver=2.8.0
pkgrel=1
pkgdesc='LTTng-UST Python agent tracepoint provider'
arch=('i686' 'x86_64')
url='http://lttng.org/'
license=('LGPL2.1' 'GPL2' 'MIT')
source=("http://lttng.org/files/lttng-ust/lttng-ust-$pkgver.tar.bz2")
makedepends=('liburcu>=0.7.2' 'util-linux' 'python')
depends=('lttng-ust>=2.8.0')
options=('!libtool')
sha1sums=('648e710683743969087e72faa5aa82697280729d')

build()
{
    cd "${srcdir}/lttng-ust-${pkgver}"
    PYTHON=/usr/bin/python ./configure --prefix=/usr --enable-python-agent
    make
}

package()
{
    cd "${srcdir}/lttng-ust-${pkgver}/liblttng-ust-python-agent"
    make install DESTDIR="${srcdir}/install"
    mkdir -p "$pkgdir/usr/lib"
    cp -av "${srcdir}"/install/usr/lib/liblttng-ust-python-agent.* "$pkgdir/usr/lib"
    cd "${srcdir}/lttng-ust-${pkgver}"
    install -m0644 -D COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
