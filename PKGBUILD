# Maintainer: zer0def <zer0def@github>
pkgname=cloud-hypervisor-bin
pkgver=0.14.0
pkgrel=1
pkgdesc="A Rust-VMM based cloud hypervisor from Intel (binary source)"
url="https://github.com/cloud-hypervisor/cloud-hypervisor"
arch=('x86_64')
license=('Apache:2.0')
optdepends=(
  'qemu-headless'  # for /usr/lib/qemu/virtiofsd
)
provides=('cloud-hypervisor')
conflicts=('cloud-hypervisor')
source=(
  "https://github.com/cloud-hypervisor/cloud-hypervisor/releases/download/v${pkgver}/ch-remote"
  "https://github.com/cloud-hypervisor/cloud-hypervisor/releases/download/v${pkgver}/cloud-hypervisor"
  "https://github.com/cloud-hypervisor/cloud-hypervisor/releases/download/v${pkgver}/cloud-hypervisor-static"
)
sha512sums=(
  0d173d8da4a36b24c870bdb47885f956af4e3bbe03af7911178b59a6f141d725f2a57bc082d8df6f9b6baec8e13bfee785de9dcac18c784f3533f5ea7d4dfb2f
  5eaf4e8fda34ca5be8e931d1f9a0f1cb040fad2ea5f97cde43705d0cebafc1074ea77c6a2e0dec0da76ce82736f7361d25c5cf63dcdb70b71060f99383b97183
  1d1b04d51ac16b6e862de2ca6514bcf08969b4f75acf9ee514bcacfd194ff8b757117fe84316b61629d54665bf40cb603d7f272a8b1ae69a3a68e7e878dda7e7
)
b2sums=(
  595248a29680b79e187a85215892a8c6badc77aa5c1c3105fcb066bbf4813660058dca069d8b12565fbe0905842454f1ab368759949dc37ce6f4abd6dc36f12b
  80539f8d2d08f502281a4e89d783ffd8003115b9dd6743e7a6b49d9203e46901def0734c5f19785baaf752136578f5b4bb6b007a7b509a9d71f32b327f737227
  0e66a928571531bcda995805ac16f1d2b5416febc3b9b266be446e2d61f9da84c85888c0bbe237d8a53491e835bb8ff7ff7d14cdf41266afe1b60b98573b343b
)

package() {
  install -Dm755 -t "${pkgdir}/usr/bin" \
    "${srcdir}/ch-remote" \
    "${srcdir}/cloud-hypervisor" \
    "${srcdir}/cloud-hypervisor-static"
}
