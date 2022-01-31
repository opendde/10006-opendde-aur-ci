# Maintainer: willemw <willemw12@gmail.com>
# Contributor: sng <sng at hellug dot gr>
# Contributor: aksr <aksr at t-com dot me>

pkgname=pyradio-git
pkgver=0.8.9.12.r0.g6bafa23
pkgrel=2
pkgdesc="Internet radio player for the command line"
arch=('any')
url="http://www.coderholic.com/pyradio/"
license=('MIT')
depends=('python-dnspython' 'python-requests' 'python-psutil')
optdepends=('mplayer: as backend' 'mpv: as backend' 'vlc: as backend')
makedepends=('git' 'python-pip' 'python-wheel')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=($pkgname::git+https://github.com/coderholic/pyradio.git)
sha256sums=('SKIP')

prepare() {
  cd $pkgname
  _descr="$(git describe --long --tags)"
  sed -i "s/git_description = ''/git_description = '$_descr'/" pyradio/config.py
  sed -i 's/distro = None/distro = Arch Linux (AUR)/' pyradio/config
}

pkgver() {
  cd $pkgname
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd $pkgname

  install -Dm644 LICENCE "$pkgdir/usr/share/licenses/pyradio/LICENSE"
  install -Dm644 *{html,md} -t "$pkgdir/usr/share/doc/pyradio"
  install -Dm644 pyradio{,_rb}.1 -t "$pkgdir/usr/share/man/man1"

  PIP_CONFIG_FILE=/dev/null pip install --no-warn-script-location --isolated --root="$pkgdir" --ignore-installed --no-deps .
}

