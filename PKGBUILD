# Maintainer: Paul Nicholson <brenix@gmail.com>
# Contributor: Wes Jackson <icebal dot 7 at gmail dot com>

pkgname=kubelet-bin
pkgdesc="Kubernetes.io kubelet binary"
pkgver=1.18.1
pkgrel=2
arch=('x86_64' 'armv7l' 'armv7h' 'aarch64')
url="http://kubernetes.io"
license=('apache')
conflicts=('kubernetes' 'kubernetes-bin')
provides=('kubelet')
source=(
  "kubelet.service"
)
sha256sums=('3ea2a2c44642a584d9ae603fd4dccd401b06bf82338dba893c82a3ed41401a29')

case "$CARCH" in
  arm*) _pkgarch="arm"
    sha256sums+=('04d8e0a080dcb23d579c69e769e75bd5abaa1977d43550ec891560d76f1f7f37')
    ;;
  aarch64) _pkgarch="arm64"
    sha256sums+=('2181cde9e6b24055d262b78758b365363273896968df673eb13d4f17a4f69c4a')
    ;;
  x86_64) _pkgarch="amd64"
    sha256sums+=('4c5737235e62a5bb0b5d3f51939ccd255ebda376d75941222b25241251b67fbc')
    ;;
esac

source+=(${pkgname}-${pkgver}::"https://storage.googleapis.com/kubernetes-release/release/v${pkgver}/bin/linux/${_pkgarch}/kubelet")

package() {
  install -D -m0644 "kubelet.service" "${pkgdir}/usr/lib/systemd/system/kubelet.service"
  install -D -m0755 "${pkgname}-${pkgver}" "${pkgdir}/usr/bin/kubelet"
}
