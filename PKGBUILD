# Maintainer: Johannes Pohl <johannes.pohl90@gmail.com>
pkgname=urh
license=('GPL3')
pkgver=1.8.13
pkgrel=1
pkgdesc="Universal Radio Hacker: investigate wireless protocols like a boss"
arch=('i686' 'x86_64')
url="https://github.com/jopohl/urh"
depends=('python>=3.4' 'python-pyqt5' 'python-numpy' 'python-psutil' 'python-pyzmq')
makedepends=('gcc' 'python-setuptools')
optdepends=(
  'airspy: for native airspy backend'
  'hackrf: for native hackrf backend'
  'libuhd: for native USRP backend'
  'rtl-sdr: for native RTL-SDR backend'
  'rfcat-hg: for rfcat plugin'
  'gnuradio: for USRP gnuradio backend'
  'gnuradio-osmosdr: for more gnuradio device backends (HackRF, FunCubeDongle, RTL-SDR)'
)

source=($pkgname-$pkgver.tar.gz::https://github.com/jopohl/urh/tarball/v$pkgver)
md5sums=('57d28aad3cf5c02ad72db30be9bfcfc0')
sha256sums=('a615fb0f648ee18effeadede12085cb1ebd6fe946f0f89f6bbd352bfb3f12dff')

build() {
  cd "$srcdir"
  mv jopohl* "$pkgname-$pkgver"
  cd "$pkgname-$pkgver"
  msg 'Building C++ extensions...'
  python setup.py build_ext
  msg 'successfully built C++ extensions'
}


package() {
  cd "$srcdir/$pkgname-$pkgver/"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 urh.desktop "${pkgdir}/usr/share/applications/urh.desktop"
  install -Dm644 ./data/icons/appicon.png "${pkgdir}/usr/share/pixmaps/urh.png"
  install -Dm644 README.md "${pkgdir}/usr/share/docs/${pkgname}/README.md"
}

