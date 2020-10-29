# Maintainer: asm0dey <pavel.finkelshtein+AUR@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>

pkgname=pgcli
pkgver=3.0.0
pkgrel=2
pkgdesc="a command line interface for Postgres with auto-completion and syntax highlighting"
url="http://pgcli.com/"
arch=(any)
license=('BSD')
depends=('python' 'python-sqlparse>=0.3.0' 'python-psycopg2' 'python-click>=4.1' 'python-prompt_toolkit' 'python-humanize>=0.5.1' 'python-configobj>=5.0.6' 'python-pgspecial>=1.11.8' 'python-setproctitle>=1.1.9' 'python-cli_helpers>=1.2.0' 'python-keyring' 'python-dbus' 'python-pygments')
makedepends=('python-distribute')
source=($pkgname-$pkgver.zip::https://github.com/dbcli/pgcli/archive/v$pkgver.zip)
provides=('pgcli')
conflicts=('pgcli-git')
md5sums=('86fd20b9ace3091e06607f0ba9aba6f0')

package() {
    cd "$srcdir/pgcli-${pkgver}"
    sed -i -e "s/prompt_toolkit>=2.0.6,<3.0.0/prompt_toolkit>=2.0.6/g" setup.py
    sed -i -e "s/sqlparse >=0.3.0,<0.4/sqlparse >= 0.3.0,<0.5/g" setup.py
    python setup.py install --root="$pkgdir/" --optimize=1
    mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
    cp LICENSE.txt "$_/LICENSE"
}
