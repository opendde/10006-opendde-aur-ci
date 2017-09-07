# Maintainer: Auguste Pop <auguste [at] gmail [dot] com>

pkgname=pkgcacheclean
pkgver=1.9.0
pkgrel=2
pkgdesc="Application to clean the pacman cache"
arch=('any')
url='https://bbs.archlinux.org/viewtopic.php?pid=841774'
license=('GPL')
depends=('pacman>=5')
source=($pkgname.c
        $pkgname.8)
md5sums=('e4d09851f6052beab8179b88e21e2f6b'
         '965889f755e4611c12f8c9ac0048372d')

build()
{
    cd "$srcdir"
    gcc -o $pkgname $CFLAGS -DVERSION=\"$pkgver\" -DCARCH=\"$CARCH\" \
        $pkgname.c -lalpm $LDFLAGS
    gzip --keep --force $pkgname.8
}

package()
{
    install -m 755 -D "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -m 644 -D "$srcdir/$pkgname.8.gz" "$pkgdir/usr/share/man/man8/$pkgname.8.gz"
}
