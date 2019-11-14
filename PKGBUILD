# Maintainer: Joffrey <j-off@live.fr>

pkgbase='python-django-jsonfield' 
pkgname=('python-django-jsonfield' 'python2-django-jsonfield')
pkgver='2.0.2'
pkgrel=2
pkgdesc='A reusable JSONField model for Django to store ad-hoc data'
arch=('any')
url='https://github.com/dmkoch/django-jsonfield'
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://github.com/dmkoch/django-jsonfield/archive/$pkgver.tar.gz")
sha256sums=('4f75edff3389217fc0ef17d53345fa668d0b5e8c455334773077101d85a3ca1c')

package_python-django-jsonfield() {
    depends=('python-django')
    cd "$srcdir/django-jsonfield-$pkgver"
    install -Dm644 './LICENSE' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    python './setup.py' install --root="$pkgdir" --optimize=1
}

package_python2-django-jsonfield() {
    depends=('python2-django')
    cd "$srcdir/django-jsonfield-$pkgver"
    install -Dm644 './LICENSE' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    python2 './setup.py' install --root="$pkgdir" --optimize=1
}
