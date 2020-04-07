# Maintainer: German Lashevich <german.lashevich@gmail.com>

pkgname=kubectl-gke-regular-bin
pkgver=v1.15.11
pkgrel=1
pkgdesc='Kubernetes.io client binary, compatible with the GKE version from the regular channel'
provides=("kubectl=v1.15.11")
conflicts=(kubectl kubectl-bin)
arch=(i686 x86_64 armv5 armv6h armv7h aarch64 )
url="https://github.com/kubernetes/kubectl"
license=('Apache-2.0')

package() {
  install -Dm755 "$srcdir/kubectl-v1.15.11" "$pkgdir/usr/bin/kubectl"
}

source_i686=('kubectl-v1.15.11::https://storage.googleapis.com/kubernetes-release/release/v1.15.11/bin/linux/386/kubectl')
sha256sums_i686=('c64ae627eaa69a4a9d63e8bfe096e789e5d1fa466c658648c33bb8dfae3981ab')
source_x86_64=('kubectl-v1.15.11::https://storage.googleapis.com/kubernetes-release/release/v1.15.11/bin/linux/amd64/kubectl')
sha256sums_x86_64=('4b9053d6ffd34c68a16af1d99855e68d27b7578f75382f19648d425f29f0fbc5')
source_armv5=('kubectl-v1.15.11::https://storage.googleapis.com/kubernetes-release/release/v1.15.11/bin/linux/arm/kubectl')
sha256sums_armv5=('c341c4bbdc9f468a8e1614cec090f0714c305bf245503145a2ba23de29fdf785')
source_armv6h=('kubectl-v1.15.11::https://storage.googleapis.com/kubernetes-release/release/v1.15.11/bin/linux/arm/kubectl')
sha256sums_armv6h=('c341c4bbdc9f468a8e1614cec090f0714c305bf245503145a2ba23de29fdf785')
source_armv7h=('kubectl-v1.15.11::https://storage.googleapis.com/kubernetes-release/release/v1.15.11/bin/linux/arm/kubectl')
sha256sums_armv7h=('c341c4bbdc9f468a8e1614cec090f0714c305bf245503145a2ba23de29fdf785')
source_aarch64=('kubectl-v1.15.11::https://storage.googleapis.com/kubernetes-release/release/v1.15.11/bin/linux/arm64/kubectl')
sha256sums_aarch64=('f0d871bf705f756df5fb01ce68847517d396f3ec2593b9f9b537379eb5f96532')
