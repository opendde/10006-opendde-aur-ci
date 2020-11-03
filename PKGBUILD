# Maintainer: zer0def <zer0def@github>
pkgname=cloud-hypervisor-bin
pkgver=0.11.0
pkgrel=2
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
  c3e2332e74b0361cb4f5e3d9abd95a0cfb5d15084caed39ccf35c1bcf936d94ded773c1d2e43aeb9df0e181d983d5d60167e3dcacbdc2615b71f810ff10e9b13
  a508703a2a31890d3cfc0997329a0d7e0a31b1a012ad3724fbd90e092c4fde30e7a23b2dc32d82d4d31237c4673998b8838c98743ed9d62fda7fb5944f27fbf4
  511b4521314dac548bedb42db5ef1091d11874d079213c4adeffdd9e23506e701f61a9ef6f5708f3bcf0b398c78bbe2cab93410bf9abe39769ce21ed2606c781
)
b2sums=(
  135beeb3dc4af237c24a5e991f562be040a8735f38dea0ada68c983e3b2bfb79d00cbd0e1e346c3ef9c2fdf7fe147d52067733edd5cb7222bdd9866c81897a22
  1b3728178aa79d5531e319a0a4260d6be6475b1728a94655eb4056774f0672725268384fd3063950c98d52c5cfa8312cff9af8f710b186c8e29d9045f26995b4
  213ab6d843da836be0cb8b85d43306b1f9f16cbadf61f4b340a673e790c02187d005398c3487197c0cdbec65f9238b106b98538643009f89a12cd21c71ad0bb0
)

package() {
  install -Dm755 -t "${pkgdir}/usr/bin" \
    "${srcdir}/ch-remote" \
    "${srcdir}/cloud-hypervisor" \
    "${srcdir}/cloud-hypervisor-static"
}
