# Contributor: megadriver <megadriver at gmx dot com>
# Based on gnumeric from [extra]
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=gnumeric-minimal
_pkgname=gnumeric
_minorver=50
pkgver=1.12.${_minorver}
pkgrel=1
pkgdesc="A GNOME-less spreadsheet program"
arch=('i686' 'x86_64')
url="http://www.gnumeric.org/"
license=('GPL')
depends=("goffice>=0.10.${_minorver}")
makedepends=('intltool' 'itstool' 'yelp-tools')
conflicts=('gnumeric')
provides=('gnumeric')
options=('libtool')
source=(https://gitlab.gnome.org/GNOME/gnumeric/-/archive/GNUMERIC_${pkgver//./_}/gnumeric-GNUMERIC_${pkgver//./_}.tar.bz2)
sha256sums=('a65f936bac38f258d3d3d9a69d1fdfd6a3d5f25d0b495a44e4db463c1906ce7c')

build() {
  cd ${_pkgname}-GNUMERIC_${pkgver//./_}
  ./autogen.sh --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
              --disable-schemas-install --disable-ssindex \
              --without-gnome --without-psiconv --without-perl \
              --without-python --without-gda \
	      --with-help-dir=/usr/share/gnome/help
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd ${_pkgname}-GNUMERIC_${pkgver//./_}
  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}"/etc/gconf
}
