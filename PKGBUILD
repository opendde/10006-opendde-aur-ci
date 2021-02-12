# Maintainer: zer0def <zer0def@github>
pkgname=cloud-hypervisor-bin
pkgver=0.13.0
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
  ff8bb73d6560fdb87dac93d9f63fdeef02f0c3ee5a918612ff173f7a7b642a7a8528c44fd2a2ead0f511cbd0c2d343092072f5cfcb740e9bb31dffb5d2f841d3
  9242935985674cb708cfd01e57a6ded5172420a258eaa6923d03803dcb51becafc98ea6e91daffacff4c7843f36d39b21580d25200b3564979b1f4447461ba55
  f191c364d7f33a2a793fe206ac27ae8f8adade357cfbae5c747d786c60c23e9c69c7060a20cf2bda9246f7b45e8fb10dea95ed7ae60abec76514ae433925f9b2
)
b2sums=(
  4b6b3c9f30e494088c7c81b0f74bb2ad4c831fe43717c2955273b0d75079392a9d805668d34780f2698925f72dfb3639b963c145460ce9b320995ff742bebc6d
  4a8873ee2e274653b3dc0489517d7ff279aa5dfadc6e01958eeb2107f3b5cb70c0d0fc05c79f69a53a74b7cb0b6ac0a17e53c03a20d3463853828d8c7e68e51b
  48dde0c9e29cd7f5fa76e90a341027cd4a347b22b11b48f55e5da40a5a3e0564719fe29e5e401f39ebec25d2672a69e758cee78eafb513b8ff1d42d9eb565b88
)

package() {
  install -Dm755 -t "${pkgdir}/usr/bin" \
    "${srcdir}/ch-remote" \
    "${srcdir}/cloud-hypervisor" \
    "${srcdir}/cloud-hypervisor-static"
}
