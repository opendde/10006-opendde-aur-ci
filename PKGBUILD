# Maintniner: urain39 <hexiedeshijie@gmail.com>
# Contributor: xiao_suo <xiao_suo@hotmail.com>

pkgname=mwget
pkgver=0.1.0
pkgrel=1.0
pkgdesc="Multi-thread Downloading Tool"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/kmphpfm/files/"
license=('GPLv3')
depends=()
optdepends=()
makedepends=(
    'intltool'
    'pkg-config'
)
source=("http://jaist.dl.sourceforge.net/project/kmphpfm/mwget/0.1/mwget_0.1.0.orig.tar.bz2")

md5sums=("05349195bcb289ef3a880c1b059f9854")

build() {
    cd ${srcdir}/${pkgname}_${pkgver}.orig
    ./configure
    make
}

package() {
    cd ${srcdir}/${pkgname}_${pkgver}.orig
    make DESTDIR=${pkgdir} install
}
