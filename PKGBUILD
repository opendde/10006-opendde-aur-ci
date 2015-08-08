# Maintainer: Konstantin Shalygin (k0ste@cn.ru)

pkgname='ovirt-guest-agent'
pkgver='1.0.11'
pkgrel='1'
pkgdesc='The oVirt Guest Agent'
arch=('any')
url='http://wiki.ovirt.org/Category:Ovirt_guest_agent'
depends=('systemd' 'python2' 'python2-dbus' 'python2-gobject2' 'dbus-glib' 'python2-ethtool' 'usermode')
makedepends=('pam' 'libtool' 'python2' 'python2-pep8' 'pep8')
license=('ASL 2.0')
install=("${pkgname}.install")
source=("python2-arch.patch"
	"sysusers.conf"
	"${pkgname}.service"
	"https://evilissimo.fedorapeople.org/releases/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=("95c162b584dd137296bcec70d14079d4b93d10d8542a87bd8f1cd6ad01e4b140"
	    "fab3d62ecd8f6546d5b193f4ca22919de20451678b4cce2c53aa0977fed4f483"
	    "545235630d6da51b547c1e8c177ddbf9f57aa81017b8683274a449d46e765cc4"
	    "ccb3fec17caa92e62ff119b8700b5f86de0b9b625e1d3f3977b9480bc5d9a2d5")
backup=("etc/${pkgname}.conf")

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -p1 -i ../python2-arch.patch
}

build() {
  cd "${pkgname}-${pkgver}"
  PYTHON=/usr/bin/python2 ./configure \
    --prefix=/usr \
    --bindir=/usr/bin \
    --sbindir=/usr/bin \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --libdir=/usr/lib \
    --datarootdir=/usr/share \
    --datadir=/usr/share \
    --infodir=/usr/share/info \
    --includedir=/usr/include/security \
    --with-systemdsystemunitdir=/usr/lib/systemd/system \
    --with-pam-prefix=/etc \
    --without-gdm \
    --without-kdm \
    --enable-securedir=/usr/lib/security
  make
}

package() {
  pushd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  popd
  install -Dm644 "${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -Dm644 "sysusers.conf" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
  install -dm775 -o 175 -g 175 "${pkgdir}/var/log/${pkgname}"
}
