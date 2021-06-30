pkgname="ddev-edge-bin"
pkgver=v1.17.7_alpha1
pkgrel=1
pkgdesc='DDEV-Local: a local PHP development environment system  (edge channel)'
arch=('x86_64')
url='https://github.com/drud/ddev'
license=('Apache')
provides=("ddev")
conflicts=("ddev")
depends=('docker' 'docker-compose')
optdepends=('bash-completion: subcommand completion support')
source=("https://github.com/drud/ddev/releases/download/v1.17.7-alpha1/ddev_linux-amd64.v1.17.7-alpha1.tar.gz")
sha256sums=("5b48b1a40ffad204dc6dd1ad04e378610f18ff7aa12b3d22b925283d4bd4dee5")

package() {
	install -D -m 0755 ddev "$pkgdir/usr/bin/ddev"
	install -D -m 0755 ddev_bash_completion.sh "$pkgdir/usr/share/bash-completion/completions/ddev"
}
