# Maintainer: Henrik Hodne <henrik@hodne.io>
# Contributor: Duncan K. <duncank@fastmail.fm>

pkgname=terraform-bin
pkgver=0.6.1
pkgrel=1
pkgdesc="Tool for building, changing, and versioning infrastructure safely and efficiently"
url='http://www.terraform.io/'
arch=('i686' 'x86_64')
license=('MPL')
conflicts=('terraform')

# http://dl.bintray.com/mitchellh/terraform/terraform_0.6.1_SHA256SUMS
source_i686=("https://dl.bintray.com/mitchellh/terraform/terraform_${pkgver}_linux_386.zip")
source_x86_64=("https://dl.bintray.com/mitchellh/terraform/terraform_${pkgver}_linux_amd64.zip")
sha256sums_i686=('f569250d7e5aca6efe5763b9a1564d6ee816e8148bad99a9c38a89490470a7f4')
sha256sums_x86_64=('3f7e135cb106c331f71667e188b602623d98fa37b10eb93c5330c4a63ebee244')

package() {
    install -d ${pkgdir}/usr/bin
    install -Dm755 ${srcdir}/terraform ${srcdir}/terraform-* ${pkgdir}/usr/bin
}
