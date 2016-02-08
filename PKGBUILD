# Maintainer: M Novick <mnovick1988@gmail.com>
# Maintainer: Marti Raudsepp <marti@juffo.org>
# Contributor: Dan McGee <dan@archlinux.org>
#
# Borrowed from postgresql-testing
#

pkgname=postgresql-git
pkgver=9.5.1
pkgrel=1
_majorver=9.5
pkgdesc="Git version of the PostgreSQL database (includes both server and libs)"
arch=('i686' 'x86_64')
url="https://wiki.postgresql.org/wiki/HowToBetaTest"
license=('custom:PostgreSQL')
backup=('etc/pam.d/postgresql' 'etc/logrotate.d/postgresql')
options=(!strip) # to facilitate debugging of testing builds
depends=('libxml2' 'readline>=6.0' 'openssl>=1.0.0')
makedepends=('python2' 'perl')
optdepends=('python2: for PL/Python support'
            'perl: for PL/Perl support')
conflicts=('postgresql-libs' 'postgresql' 'postgresql-testing' 'postgresql-git')
provides=("postgresql-libs=$pkgver" "postgresql=$pkgver" 'postgresql-git')
source=("git://git.postgresql.org/git/postgresql.git"
        postgresql-run-socket.patch
        postgresql.pam postgresql.logrotate
        postgresql.service postgresql.tmpfiles.conf postgresql-check-db-dir)
install=postgresql.install

build() {
  cd $srcdir/postgresql

  patch -Np1 < ../postgresql-run-socket.patch
  ./configure --prefix=/usr \
  --mandir=/usr/share/man \
  --datadir=/usr/share/postgresql \
  --sysconfdir=/etc \
  --with-libxml \
  --with-openssl \
  --with-perl \
  --with-python PYTHON=/usr/bin/python2 \
  --with-pam \
  --with-system-tzdata=/usr/share/zoneinfo \
  --enable-nls \
  --enable-thread-safety \
  --with-krb5 \
  --with-tcl \

  make
  make -C contrib
}

package() {
  cd $srcdir/postgresql

  # install
  make DESTDIR="${pkgdir}" install
  make -C contrib DESTDIR="${pkgdir}" install

  # install license
  install -D -m644 COPYRIGHT "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE"

  install -D -m644 "${srcdir}/postgresql.tmpfiles.conf" \
    "${pkgdir}/usr/lib/tmpfiles.d/postgresql.conf"
  install -D -m644 "${srcdir}/postgresql.service" \
    "${pkgdir}/usr/lib/systemd/system/postgresql.service"
  install -D -m755 "${srcdir}/postgresql-check-db-dir" \
    "${pkgdir}/usr/bin/postgresql-check-db-dir"
  install -D -m644 "${srcdir}/postgresql.pam" \
    "${pkgdir}/etc/pam.d/postgresql"
  install -D -m644 "${srcdir}/postgresql.logrotate" \
    "${pkgdir}/etc/logrotate.d/postgresql"
}
md5sums=('SKIP'
         '75c579eed03ffb2312631f0b649175b4'
         '96f82c38f3f540b53f3e5144900acf17'
         'd28e443f9f65a5712c52018b84e27137'
         '89b48774b0dae7c37fbb0e907c3c1db8'
         '1c5a1f99e8e93776c593c468e2612985'
         'ba9b7d804500dffc095eac78c4a2a00f')
