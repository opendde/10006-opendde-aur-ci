# Maintainer: thorko contact@thorko.de
pkgname=sensu-agent
pkgver=6.5.4
pkgrel=0
pkgdesc="Sensu Go Agent"
arch=('x86_64' 'armv7h' 'armv6h' 'aarch64')
url='https://sensu.io'
license=('MIT')
if [ "$CARCH" = "armv7h" ]; then
  source=("${pkgname}-${pkgver}_armv7h.tar.gz::https://s3-us-west-2.amazonaws.com/sensu.io/sensu-go/${pkgver}/sensu-go_${pkgver}_linux_armv7.tar.gz")
  sha256sums=('8332e64c010a0134ce4248ca117a1ec4a4b4d7fe68ab82a7e5ca283f2682be5b')
fi
if [ "$CARCH" = "armv6h" ]; then
  source=("${pkgname}-${pkgver}_armv6h.tar.gz::https://s3-us-west-2.amazonaws.com/sensu.io/sensu-go/${pkgver}/sensu-go_${pkgver}_linux_armv6.tar.gz")
  sha256sums=('aa276aafdbae103228e8848d973f60a87fdaa2caba83a10504d5c2331becc961')
fi
if [ "$CARCH" = "x86_64" ]; then
  source=("${pkgname}-${pkgver}_x86_64.tar.gz::https://s3-us-west-2.amazonaws.com/sensu.io/sensu-go/${pkgver}/sensu-go_${pkgver}_linux_amd64.tar.gz")
  sha256sums=('cc5198548b068408c70806350910464e893dbe326581135b0522fa2b26cabd1c')
fi
if [ "$CARCH" = "aarch64" ]; then
  source=("${pkgname}-${pkgver}_aarch64.tar.gz::https://s3-us-west-2.amazonaws.com/sensu.io/sensu-go/${pkgver}/sensu-go_${pkgver}_linux_arm64.tar.gz")
  sha256sums=('96aaf7634d343927a9d853e4598e5019d6670ddfa756d3a49770d37bc6edb3a0')
fi


source+=(
        "sensu-agent.service"
        "agent.yml.example"
        )
sha256sums+=(
            '7d8ca2731fe4a07beab0566d11ed47f0c069774752a96781ac7797697b3f7cc5'
            'c9997fa4be0879bb73b7250863ce9737b422515cf9131626075ff313b4575eed'
          )

install=sensu-agent.install

build() {
        tar xzvf ${pkgname}-${pkgver}_$CARCH.tar.gz
}

# TODO: better build from source
# build() {}

package() {
    install -Dm755 "${srcdir}/sensu-agent" "${pkgdir}/usr/bin/sensu-agent"
    install -Dm0644 "sensu-agent.service" "${pkgdir}/usr/lib/systemd/system/sensu-agent.service"
    install -Dm0644 "agent.yml.example" "${pkgdir}/etc/sensu/agent.yml.example"
}
