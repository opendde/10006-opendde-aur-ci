# Maintainer: thorko contact@thorko.de
pkgname=sensu-agent
pkgver=6.2.2
pkgrel=1
pkgdesc="Sensu Go Agent"
arch=('x86_64' 'armv7h')
url='https://sensu.io'
license=('MIT')
if [ "$CARCH" = "armv7h" ]; then
  source=("${pkgname}-${pkgver}_armv7h.tar.gz::https://s3-us-west-2.amazonaws.com/sensu.io/sensu-go/${pkgver}/sensu-go_${pkgver}_linux_armv7.tar.gz")
  sha256sums=('c2f5601a254a569ff775976453e82c2f4fa23147c1b95f32286c53652aeaf038')
fi
if [ "$CARCH" = "x86_64" ]; then
  source=("${pkgname}-${pkgver}_x86_64.tar.gz::https://s3-us-west-2.amazonaws.com/sensu.io/sensu-go/${pkgver}/sensu-go_${pkgver}_linux_amd64.tar.gz")
  sha256sums=('2787738400a7bc7fd54a3f87aecd502520c3dc2146a7fe4c7b8d4a3ff9798a59')
fi

source+=(
        "sensu-agent.service"
        "agent.yml.example"
        )
sha256sums+=(
            '7d8ca2731fe4a07beab0566d11ed47f0c069774752a96781ac7797697b3f7cc5'
            'c9997fa4be0879bb73b7250863ce9737b422515cf9131626075ff313b4575eed'
          )

build() {
        tar xzvf ${pkgname}-${pkgver}_$CARCH.tar.gz
}

# TODO: better build from source
# build() {}
post_install() {
  groupadd sensu
  useradd -s /sbin/nologin -d /opt/sensu -G sensu sensu
  systemctl restart sensu-agent.service
}

package() {
    install -Dm755 "${srcdir}/sensu-agent" "${pkgdir}/usr/bin/sensu-agent"
    install -Dm0644 "sensu-agent.service" "${pkgdir}/usr/lib/systemd/system/sensu-agent.service"
    install -Dm0644 "agent.yml.example" "${pkgdir}/etc/sensu/agent.yml.example"
}
