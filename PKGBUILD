pkgname="ddev-edge-bin"
pkgver=v1.18.0_rc3
pkgrel=1
pkgdesc='DDEV-Local: a local PHP development environment system  (edge channel)'
arch=('x86_64')
url='https://github.com/drud/ddev'
license=('Apache')
provides=("ddev")
conflicts=("ddev")
depends=('docker' 'docker-compose')
optdepends=('bash-completion: subcommand completion support')
source=("https://github.com/drud/ddev/releases/download/v1.18.0-rc3/ddev_linux-amd64.v1.18.0-rc3.tar.gz")
sha256sums=("502cd6fe7b4af7c511c4ad17e6a77548d929889a7bd42de7a25a30a3f50662d0")

package() {
	install -D -m 0755 ddev "$pkgdir/usr/bin/ddev"
	install -D -m 0755 ddev_bash_completion.sh "$pkgdir/usr/share/bash-completion/completions/ddev"
}
