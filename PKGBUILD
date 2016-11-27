# Maintainer: Kieran Colford <kieran@kcolford.com>
pkgname=ddns
pkgver=1.0.1
pkgrel=1
epoch=
pkgdesc="Automatic provisioning of Dynamic DNS."
arch=('any')
url="https://github.com/kcolford/$pkgname"
license=('GPL')
groups=()
depends=('bind-tools' 'bash' 'curl')
makedepends=()
checkdepends=()
optdepends=('bind: for tsig-keygen')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$url/archive/v$pkgver.tar.gz")
md5sums=('dd7e4a31e0413d6dc2ab266a66fa8099')
noextract=()

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 ddns.sh "$pkgdir/usr/bin/ddns.sh"
  install -Dm644 systemd/ddns.service "$pkgdir/usr/lib/systemd/system/ddns.service"
  install -Dm644 systemd/ddns.timer "$pkgdir/usr/lib/systemd/system/ddns.timer"
  mkdir -pm700 "$pkgdir/etc/ddns/"
}

# vim:set ts=2 sw=2 et:
