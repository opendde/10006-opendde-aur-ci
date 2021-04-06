# Maintainer: ReneganRonin <renegan.ronin@gmail.com> 

pkgname=delphes
pkgver=master
pkgrel=1
pkgdesc="A framework for fast simulation of a generic collider experiment"
url="http://cp3.irmp.ucl.ac.be/projects/delphes"
arch=('i686' 'x86_64')
license=('GPL3')
depends=("cmake"
         "root")
source=("https://github.com/delphes/delphes/archive/master.zip")
sha256sums=('aa4fd44924d8b66407da8e15268669de3b44e8fbd4345be17cde7c9ec8d0ed68')

build() {
    cmake -DCMAKE_INSTALL_PREFIX="/usr/" delphes-${pkgver}
    make
}

package() {
    make install DESTDIR=${pkgdir}

    msg2 "Moving examples and cards"
    install -dm755 "${pkgdir}/usr/share/Delphes"
    install -dm777 ${pkgdir}/usr/examples ${pkgdir}/usr/share/Delphes/examples
    install -dm777 ${pkgdir}/usr/cards ${pkgdir}/usr/share/Delphes/cards
}

# Local Variables:
# mode: sh
# End:
