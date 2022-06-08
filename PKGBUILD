_pkgname=bird
pkgname=$_pkgname-babel-rtt-git
pkgver=r3826.4c582913
pkgrel=2
pkgdesc='RIP, OSPF, BGP, MPLS, BFD, Babel routing daemon (with babel-rtt)'
arch=('x86_64')
url='https://github.com/tohojo/bird'
license=('GPL2')
backup=('etc/bird.conf')
makedepends=('git' 'autoconf' 'automake')
depends=('glibc' 'readline' 'ncurses' 'libssh')
conflicts=("$_pkgname")
provides=("$_pkgname")
replaces=('bird6')
options=(!emptydirs)
source=("${_pkgname}::git+https://github.com/tohojo/bird.git#branch=babel-rtt-01"
        'bird.service'
        )
sha256sums=('SKIP'
            '4aa1e8d41229badd276aa3747f613e7df34761892add2258c63bdb5097dfeb2b')

pkgver() {
  cd $_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $_pkgname
  autoreconf -ifv
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --runstatedir=/run/$_pkgname \
    --docdir=/usr/share/doc/$_pkgname
  make
}

package () {
  cd $_pkgname
  make DESTDIR="$pkgdir" install

  # systemd
  install -D -m 644 "$srcdir/bird.service" "$pkgdir/usr/lib/systemd/system/bird.service"
}

# vim:set ts=2 sw=2 et:
