# Maintainer: Kieran Colford <kieran@kcolford.com>
pkgname=ddns
pkgver=2.1.1
pkgrel=1
epoch=
pkgdesc="Automatic provisioning of Dynamic DNS."
arch=('any')
url="https://github.com/kcolford/$pkgname"
license=('GPL')
groups=()
depends=('bash' 'bind-tools' 'coreutils' 'inetutils' 'sed' 'systemd')
makedepends=()
checkdepends=()
optdepends=('bind: for tsig-keygen'
	    'curl: for looking up your ip address'
	    'openssh: for updating SSHFP records')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$url/archive/v$pkgver.tar.gz")
md5sums=('9721471d7efe2f10a07be314416d22e4')
noextract=()

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir"/usr install
}

# vim:set ts=2 sw=2 et:
