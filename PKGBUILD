# Maintainer: colemickens <cole.mickens@gmail.com>
# https://packages.cloud.google.com/apt/dists/kubernetes-xenial/main/binary-amd64/Packages

pkgname=kubeadm-beta-bin
pkgdesc="Kubernetes.io kubeadm binary (beta)"
pkgver=1.10.0.beta3
pkgrel=1
arch=('x86_64')
url="http://kubernetes.io"
license=('apache')
depends=('kubelet-bin')
provides=('kubeadm-bin')
conflicts=('kubernetes' 'kubeadm-bin')
source_x86_64=(
  'https://packages.cloud.google.com/apt/pool/kubeadm_1.9.4-00_amd64_7c267288a1a9cebc480778b50ef00ab5dfe477f545bc917a50adb322ea2b9c24.deb'
  'https://dl.k8s.io/v1.10.0-beta.3/kubernetes-node-linux-amd64.tar.gz'
)
sha256sums_x86_64=(
  '7c267288a1a9cebc480778b50ef00ab5dfe477f545bc917a50adb322ea2b9c24'
  'e517986261e3789cada07d9063ae96ed9b17ffd80c1b220b6ae9c41238c07c08'
)

package() {
  tar -vxf data.tar.xz
  install -D -m0644 "./etc/systemd/system/kubelet.service.d/10-kubeadm.conf" "${pkgdir}/etc/systemd/system/kubelet.service.d/10-kubeadm.conf"
  #install -D -m0755 "./usr/bin/kubeadm" "${pkgdir}/usr/bin/kubeadm"
  install -D -m0755 "./kubernetes/node/bin/kubeadm" "${pkgdir}/usr/bin/kubeadm"
}
