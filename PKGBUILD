# Maintainer: lilydjwg <lilydjwg@gmail.com>

_pkgname=tldextract
pkgname=python-$_pkgname
pkgver=1.7.4
pkgrel=1
pkgdesc="Accurately separate the TLD from the registered domain and subdomains of a URL, using the Public Suffix List."
arch=('any')
url="https://github.com/john-kurkowski/tldextract"
license=('BSD')
depends=('python' 'python-setuptools')
source=(https://pypi.python.org/packages/source/t/tldextract/tldextract-1.7.4.tar.gz)
md5sums=(312ffe98aaca472b5dcd173251ff19d5)

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python3 setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  python3 setup.py install --root=$pkgdir --optimize=1

  _pyver=$(python -c 'import sysconfig; print(sysconfig.get_python_version())')
  # use the snapshot version, because generating a new one requires Internat access and root permission
  ln -s .tld_set_snapshot "$pkgdir/usr/lib/python$_pyver/site-packages/tldextract/.tld_set"
}

# vim:set sw=2 et:
