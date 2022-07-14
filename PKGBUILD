# Maintainer: Sin Kim <kimsin98@gmail.com>

pkgname=webchanges
pkgver=3.10.3
pkgrel=1
pkgdesc='Check web content for changes and notify'
arch=('any')
url='https://pypi.org/project/webchanges'
license=('MIT' 'BSD')
depends=('python-cssselect' 'python-html2text' 'python-lxml' 'python-markdown2' 'python-msgpack'
         'python-platformdirs' 'python-yaml' 'python-requests' 'python-urllib3')
makedepends=('python-setuptools')
optdepends=('python-playwright: option to use browser'
            'python-psutil: option to use browser'
            'google-chrome: option to use browser'
            'python-beautifulsoup4: beautify filter and one of html2text filter methods'
            'python-jsbeautifier: beautify filter'
            'python-cssbeautifier: beautify filter'
            'python-vobject: ical2text filter'
            'python-jq: jq filter'
            'python-pytesseract: ocr filter'
            'python-pillow: ocr filter'
            'python-pdftotext: pdf2text filter'
            'python-deepdiff: deep difference'
            'python-matrix-client: matrix reporter'
            'python-pushbullet.py: pushbullet reporter'
            'python-chump: pushover reporter'
            'python-aioxmpp: xmpp reporter'
            'python-redis: redis database'
            'python-keyring: password keyring storage')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('f6f519500fb9cbac92c2863127987158852ec6e4bfd9494180f30c0f4932962e')

build() {
    cd "$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
