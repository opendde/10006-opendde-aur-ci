# Contributor: Florian Klink <flokli at flokli dot de>
pkgname=python-pystache
_pkgname=pystache
pkgver=0.5.4
pkgrel=3
pkgdesc="The mustache template engine written in python"
arch=("any")
url="http://github.com/defunkt/pystache"
license=('MIT')
depends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/defunkt/$_pkgname/archive/v$pkgver.tar.gz")
sha256sums=('f7bbc265fb957b4d6c7c042b336563179444ab313fb93a719759111eabd3b85a')

build() {
	cd "$_pkgname-$pkgver"
	python setup.py build
}

check() {
	# This package uses 2to3 to convert itself to Python 3 on the fly
	# So we need to jump through some hoops here
	rm -rf test_dir
	mkdir test_dir
	cd "$_pkgname-$pkgver"
	python setup.py install --root=../test_dir
	PYTHONPATH=../test_dir/usr/lib/python3.7/site-packages/ \
		../test_dir/usr/bin/pystache-test .
}

package() {
	cd "$_pkgname-$pkgver"
	python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
