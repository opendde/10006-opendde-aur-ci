# Maintainer: Frédéric Potvin <frederic.potvin@platform.sh>
pkgname=platformsh-cli
pkgver='3.40.13'
pkgrel=1
pkgdesc="Platform.sh CLI"
arch=('any')
url="https://github.com/platformsh/platformsh-cli"
license=('MIT')
groups=()
depends=('php>=5.5.9')
makedepends=()
checkdepends=()
optdepends=()
provides=('platformsh-cli')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/platformsh/platformsh-cli/releases/download/v3.40.13/platform.phar")
sha256sums=('731186afde2865610d99c238aad15f452617014012184d7e59e1b613f6cbb2fc')
noextract=('platform.phar')

build() {
  mv platform.phar platform
  chmod +x platform
  mkdir -p ~/.platformsh
  ./platform self:install -y
}

package() {
  cd "$srcdir"
  install -D platform "$pkgdir/usr/bin/platform"
}
