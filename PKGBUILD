# Maintainer: Pierre-Alain TORET <pierre-alain.toret@protonmail.com>
# Maintainer: Tom Hacohen <tom@stosb.com>

_pkgname=server
pkgname=etebase-server
pkgver=0.9.1
pkgrel=1
pkgdesc="A self-hostable Etebase (EteSync 2.0) server"
arch=(any)
depends=(
	'python-aioredis'
	'python-aiofiles'
	'python-django'
	'python-fastapi'
	'python-pynacl'
	'python-msgpack'
)
makedepends=(
	'python-setuptools'
	'python-build'
	'python-installer'
	'python-wheel'
)
optdepends=(
	'postgresql: storage backend'
	'python-daphne: application container'
	'python-ldap: LDAP user verification'
)
url="https://github.com/etesync/$_pkgname"
license=('AGPL3')
backup=("etc/$pkgname/$pkgname.ini")
options=(!emptydirs)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        $pkgname.sysusers
        $pkgname.tmpfiles
        $pkgname.service
        $pkgname.ini.patch
        $pkgname)
sha256sums=('217b6072d87368f605f46212b495851eb81c213447a5d8b4bf3119e14e3e298e'
            'd42e2518975363aed2900fe4e03eefade98ed9b6f8b8140fd1eddc081d4081e7'
            'f8b9bdbfdd90365a6b463ab2af4320eb2fddb527e6c33d0f02f4f8820864eb43'
            'b577710887782c11da4392a850a5407d71a51e3070c28acb51497e393b4de913'
            'd4b4dc44deab70c0d4c9e485763721fedff3eb938c201d96e6dacc75592b24c2'
            '3f040318ab3fac72c8033b0b567f635e7da5afb9e6e8f8b391d4978226136983')

build() {
	cd "$_pkgname-$pkgver"

	python -m build --wheel --no-isolation
}

package() {
	cd "$_pkgname-$pkgver"

	python -m installer --destdir="$pkgdir" dist/*.whl

	DJANGO_STATIC_ROOT="$pkgdir/usr/share/webapps/$pkgname/static" ./manage.py collectstatic

	install -Dm644 "$srcdir/$pkgname.sysusers" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
	install -Dm644 "$srcdir/$pkgname.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
	install -Dm644 "$srcdir/$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"

	install -Dm644 "$pkgname.ini.example" "$pkgdir/etc/$pkgname/$pkgname.ini"
	patch --directory="$pkgdir/etc/$pkgname/" -p1 < "$srcdir/$pkgname.ini.patch"

	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	install -Dm755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
