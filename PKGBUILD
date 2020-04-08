pkgname=vesc_tool-git
pkgver=2.03
pkgrel=2
pkgdesc="VESC ESC graphical configuration tool"
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
url="https://vesc-project.com/vesc_tool"
license=('GPL3')
depends=('qt5-base' 'qt5-connectivity' 'qt5-quickcontrols2' 'qt5-serialport' 'qt5-location')
makedepends=('git')
conflicts=('vesc-tool')

source=("$pkgname"::"git+https://github.com/vedderb/vesc_tool.git"
        'vesc_tool.pro'
	'vesc-tool.desktop'
	'vesc-tool.png')

sha256sums=('SKIP'
            'fb9eb66d9ef00606f61754a7efa8dbab18dff810c674a106e2e770e62899be68'
            'a0d31826279e900ab614744afad1a26b849440c298d8a5e6e318df554beebdde'
            'ace90b5a9bd1001e234800b935d3622c6a10c73445f726677e838d51fe4c8e02')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "${pkgver}.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${srcdir}/${pkgname}"
    cp ${srcdir}/vesc_tool.pro .
}

build() {
  cd "${srcdir}/${pkgname}"
  qmake PREFIX=/usr LIBDIR=/usr/lib
  make
}

package() {
  cd "$srcdir/${pkgname}"
  make INSTALL_ROOT="$pkgdir" install

  install -Dm644 ../vesc-tool.desktop \
    "$pkgdir/usr/share/applications/vesc-tool.desktop"
  
  install -Dm644 ../vesc-tool.png \
    "$pkgdir/usr/share/icons/vesc-tool.png"
}

