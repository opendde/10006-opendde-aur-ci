pkgname=docker-compose-systemd-unit
pkgver=1
pkgrel=1
pkgdesc="systemd unit file for docker-compose services"
arch=('any')
url="https://gist.github.com/mosquito/b23e1c1e5723a7fd9e6568e5cf91180f"
license=('unknown')
depends=('docker' 'docker-compose')
source=("docker-compose@.service")
sha256sums=('d040c6d7f6bd47f8d7b13592487ca8da698ea86fa2bf505593e0fd7d5988822a')

package() {
    mkdir -p "$pkgdir/etc/systemd/system"
    mkdir -p "$pkgdir/etc/docker/compose"
    echo "Place your services in folders here, ex. structure: /etc/docker/compose/my-test-service/docker-compose.yml" > "$pkgdir/etc/docker/compose/README"
    install -D -m755 ./docker-compose@.service "$pkgdir/etc/systemd/system/docker-compose@.service"
}
