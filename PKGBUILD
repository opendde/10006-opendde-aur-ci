# Maintainer: Damjan Georgievski <gdamjan@gmail.com>

pkgname=nextcloud-app-u2f
_releasename=twofactor_u2f
pkgver=4.0.0
pkgrel=1
pkgdesc="Two factor U2F provider for Nextcloud"
arch=('any')
url="https://github.com/nextcloud/twofactor_u2f"
license=('AGPL')
depends=('nextcloud>=17.0')
makedepends=()
options=('!strip')
source=("${_releasename}-${pkgver}.tar.gz"::"${url}/releases/download/v${pkgver}/${_releasename}.tar.gz")

build() {
    cd "$srcdir/${_releasename}"
}

package() {
    install -d --owner=root --group=root $pkgdir/usr/share/webapps/nextcloud/apps/
    cp -r --target-directory=$pkgdir/usr/share/webapps/nextcloud/apps/ $srcdir/$_releasename
}

sha256sums=('07d80b3a4aad7f3191af0714482b02fea218165e44ddc3952d88a0c7a67305b6')
