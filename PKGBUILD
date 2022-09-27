# Maintainer: Benjamin Denhartog <ben@sudoforge.com>
# Contributor: Greg Darke <darke+arch@google.com>

# For ISSUES, REQUESTS, and QUESTIONS:
# https://github.com/sudoforge/pkgbuilds

pkgname=google-cloud-sdk-datastore-emulator
pkgver=403.0.0
pkgrel=1
pkgdesc="A google-cloud-sdk component that provides local emulation of a Datastore environment."
url="https://cloud.google.com/sdk/"
license=("Apache")
arch=('x86_64')
options=('!strip')
depends=(
  "google-cloud-sdk"
  "java-runtime"
)
source=(
  "https://dl.google.com/dl/cloudsdk/release/downloads/for_packagers/linux/${pkgname}_${pkgver}.orig.tar.gz"
)
sha256sums=('f471377c002e251d5b4bb4daf9b3257773ecaddcc47a27e8b95ebb50c3760fee')

package() {
  mkdir "${pkgdir}/opt"
  cp -r "${srcdir}/google-cloud-sdk" "${pkgdir}/opt"

  # Remove unneeded files
  rm "${pkgdir}/opt/google-cloud-sdk/platform/cloud-datastore-emulator/cloud_datastore_emulator.cmd"
  rmdir "${pkgdir}/opt/google-cloud-sdk/.install/.download"
}
