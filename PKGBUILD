# $Id$
# Maintainer: Dan McGee <dan@archlinux.org>
# Contributor: Shahar Weiss <sweiss4@gmx.net>

pkgname=django
pkgver=1.2.5
pkgrel=1
pkgdesc="A high-level Python Web framework."
arch=('any')
license=('BSD')
url="http://www.djangoproject.com/"
depends=('python2')
makedepends=('setuptools')
optdepends=('mysql-python: for MySQL backend'
            'python-psycopg2: for PostgreSQL backend')
source=("http://media.djangoproject.com/releases/1.2/Django-$pkgver.tar.gz")
md5sums=('e031ea3d00996035e49e4bfa86e07c40')
sha256sums=('649387248296386b589c4a8bf91d34590b43f93b6ebfe6cefbea0ddf4641ccd6')

build() {
  cd ${srcdir}/Django-$pkgver
  python2 setup.py install --root=${pkgdir} --optimize=1

  install -Dm644 extras/django_bash_completion \
    ${pkgdir}/etc/bash_completion.d/django

  find $pkgdir/usr/lib/python2.7/site-packages/django/ -name '*.py' | \
    xargs sed -i "s|#!/usr/bin/env python$|#!/usr/bin/env python2|"

  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/$pkgname/LICENSE
}
