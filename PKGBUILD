# Maintainer: Iwan Timmer <irtimmer@gmail.com>
# Contributor: Mark Constable <markc@renta.net>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=cockpit
pkgver=172
pkgrel=1
pkgdesc='A systemd web based user interface for Linux servers'
arch=(i686 x86_64 armv6h armv7h)
url='http://www.cockpit-project.org/'
license=(LGPL2.1)
conflicts=(cockpit-git)
depends=(libssh krb5 sshpass accountsservice perl-json perl-locale-po json-glib pcp glib-networking)
makedepends=(git intltool python2-pyscss gtk-doc perl-javascript-minifier-xs gobject-introspection networkmanager libgsystem xmlto npm tar)
optdepends=("udisks2: manage hard disks"
	    "networkmanager: manage network connections"
	    "packagekit: manage packages"
	    "docker: manage containers"
	    "libvirt: manage virtual machines"
	    "kubernetes: manage cluster")
source=(https://github.com/cockpit-project/cockpit/releases/download/${pkgver}/cockpit-${pkgver}.tar.xz
	https://github.com/cockpit-project/cockpit/releases/download/${pkgver}/cockpit-cache-${pkgver}.tar.xz)
noextract=(cockpit-${pkgver}.tar.xz)
sha1sums=('bb216f3c317c850a1abdb1141ff4fd73493f8caf'
          'd8d9446c170d5a836750120c0d707acaf22a74bd')

prepare() {
  cd $srcdir

  #bsdtar can't extract cockpit
  tar -xf cockpit-${pkgver}.tar.xz
}

build() {
  cd cockpit-${pkgver}

  ./configure --prefix=/usr --sbindir=/usr/bin --sysconfdir=/etc --localstatedir=/var
  make
}

package() {
  cd cockpit-${pkgver}
  make DESTDIR="$pkgdir" install
}
