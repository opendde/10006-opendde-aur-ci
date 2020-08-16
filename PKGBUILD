# Maintainer: Baltazár Radics <baltazar.radics@gmail.com>
pkgname=nanopb
pkgver=0.4.2
pkgrel=1
pkgdesc='Protocol Buffers with small code size'
arch=(any)
url='https://jpa.kapsi.fi/nanopb/'
license=(zlib)
depends=(python-protobuf)
makedepends=(python-docutils)
checkdepends=(scons)
source=("https://jpa.kapsi.fi/$pkgname/download/$pkgname-$pkgver.tar.gz"
        'protoc-gen-nanopb')
sha256sums=('3fae3a8efb61cf06124732fc775088389f259f0c8d85f1ca3330da295282f912'
            'cd1ff902034d8deabf2d8ad3fadcdc4860d0b5d3be746e2b4b7427b9a7aca9c0')

build() {
	cd $pkgname
	make -C docs
	make -C generator/proto
}

check() {
	cd $pkgname
	make -C tests
}

package() {
	install -Dm755 protoc-gen-nanopb                                        -t "$pkgdir/usr/bin"
	cd $pkgname
	install -Dm644 LICENSE.txt                                              -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 README.md CHANGELOG.txt CONTRIBUTING.md                  -t "$pkgdir/usr/share/doc/$pkgname"
	install -Dm644 docs/{*.html,generator_flow.svg,lsr.css}                 -t "$pkgdir/usr/share/doc/$pkgname/html"
	cp -r examples                                                          -T "$pkgdir/usr/share/doc/$pkgname/examples"
	install -Dm644 pb.h pb_{common,decode,encode}.{c,h}                     -t "$pkgdir/usr/share/$pkgname"
	cp -r extra                                                             -T "$pkgdir/usr/share/$pkgname/extra"
	install -Dm755 generator/{nanopb_generator.py,protoc,protoc-gen-nanopb} -t "$pkgdir/usr/share/$pkgname/generator"
	install -Dm644 generator/proto/{__init__.py,nanopb_pb2.py,_utils.py}    -t "$pkgdir/usr/share/$pkgname/generator/proto"
	python -m compileall -d /usr/share/$pkgname/generator                      "$pkgdir/usr/share/$pkgname/generator"
}
