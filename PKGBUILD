# Maintainer: maz-1 <ohmygod19993 at gmail dot com>
pkgname=n2n-git
_gitname=n2n_v2_fork
pkgver=20130823
pkgrel=1
pkgdesc="Peer-to-Peer VPN."
arch=(i686 x86_64)
url="https://github.com/lukablurr/n2n_v2_fork"
license=('GPL3')
depends=('openssl' 'net-tools') #iproute2?
makedepends=('git')
source=('git+https://github.com/lukablurr/n2n_v2_fork.git'
        'edge.conf.example'
        'edge.sh'
        'n2n-edge@.service'
        'n2n-supernode.service'
        'supernode.conf'
        'supernode.sh'
        )
md5sums=('SKIP'
         '2ece2e5b7d8180c8a157df4394014efe'
         '3f7f42b27ab24e206e58f7147e726f07'
         '9f1b096a3a2a2c1492cf553b36c478e8'
         '12c1fd79cc6584defe2837a154f95acc'
         '5af8895c46608a443ff48ea9c5041e1a'
         '9eab67d3412dba7c004a22bd90fbbd77')

pkgver() {
  cd  "$srcdir/$_gitname"
  git log -1 --format="%cd" --date=short | sed 's|-||g'
}

build() {
  cd "$srcdir/$_gitname"
  make

}

package() {
  cd "$srcdir/$_gitname"
  install -dm755 "$pkgdir/etc/n2n/edge"
  install -dm755 "$pkgdir/usr/share/n2n"
  install -Dm755 "$srcdir/edge.conf.example" "$pkgdir/etc/n2n/edge/edge.conf.example"
  install -Dm755 "$srcdir/supernode.conf" "$pkgdir/etc/n2n/supernode.conf"
  install -Dm755 "$srcdir/edge.sh" "$pkgdir/usr/share/n2n/edge.sh"
  install -Dm755 "$srcdir/supernode.sh" "$pkgdir/usr/share/n2n/supernode.sh"
  install -Dm755 "$srcdir/n2n-edge@.service" "$pkgdir/usr/lib/systemd/system/n2n-edge@.service"
  install -Dm755 "$srcdir/n2n-supernode.service" "$pkgdir/usr/lib/systemd/system/n2n-supernode.service"
  
  
  make DESTDIR="$pkgdir" install
  mv "$pkgdir/usr/sbin" "$pkgdir/usr/bin"
}

