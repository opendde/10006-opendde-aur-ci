# Maintainer: Evgeniy Alekseev

pkgname='ahriman'
pkgver=2.3.0
pkgrel=1
pkgdesc="ArcH linux ReposItory MANager"
arch=('any')
url="https://github.com/arcan1s/ahriman"
license=('GPL3')
depends=('devtools' 'git' 'pyalpm' 'python-inflection' 'python-passlib' 'python-requests' 'python-setuptools' 'python-srcinfo')
makedepends=('python-build' 'python-installer' 'python-wheel')
optdepends=('breezy: -bzr packages support'
            'darcs: -darcs packages support'
            'mercurial: -hg packages support'
            'python-aioauth-client: web server with OAuth2 authorization'
            'python-aiohttp: web server'
            'python-aiohttp-debugtoolbar: web server with enabled debug panel'
            'python-aiohttp-jinja2: web server'
            'python-aiohttp-security: web server with authorization'
            'python-aiohttp-session: web server with authorization'
            'python-boto3: sync to s3'
            'python-cryptography: web server with authorization'
            'python-jinja: html report generation'
            'rsync: sync by using rsync'
            'subversion: -svn packages support')
source=("https://github.com/arcan1s/ahriman/releases/download/$pkgver/$pkgname-$pkgver-src.tar.xz"
        'ahriman.sysusers'
        'ahriman.tmpfiles')
backup=('etc/ahriman.ini'
        'etc/ahriman.ini.d/logging.ini')

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" "dist/$pkgname-$pkgver-py3-none-any.whl"

  # python-installer actually thinks that you cannot just copy files to root
  # thus we need to copy them manually
  install -Dm644 "$pkgdir/usr/share/$pkgname/settings/ahriman.ini" "$pkgdir/etc/ahriman.ini"
  install -Dm644 "$pkgdir/usr/share/$pkgname/settings/ahriman.ini.d/logging.ini" "$pkgdir/etc/ahriman.ini.d/logging.ini"

  install -Dm644 "$srcdir/$pkgname.sysusers" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  install -Dm644 "$srcdir/$pkgname.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
}

sha512sums=('95f29cf7a5058f7c66fc7e5c711c7a5cc88347125723a47c8474af0f683e7c7a3e96a8bd078630bc98108c768bda869cedac2d2f83e43b350db225f6bd96facd'
            '53d37efec812afebf86281716259f9ea78a307b83897166c72777251c3eebcb587ecee375d907514781fb2a5c808cbb24ef9f3f244f12740155d0603bf213131'
            '62b2eccc352d33853ef243c9cddd63663014aa97b87242f1b5bc5099a7dbd69ff3821f24ffc58e1b7f2387bd4e9e9712cc4c67f661b1724ad99cdf09b3717794')
