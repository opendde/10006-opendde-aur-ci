# Maintainer: Andrea Denisse Gómez-Martínez <aur at denisse dot dev>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=benthos-bin
_pkgname=${pkgname%-bin}
pkgdesc='Declarative stream processing for mundane tasks and data engineering.'
url='https://benthos.dev'
_url='https://github.com/Jeffail/benthos'
_branch='master'
pkgver=3.44.0
pkgrel=1
arch=(aarch64 armv6h x86_64)
license=("MIT")
provides=($_pkgname)
conflicts=($_pkgname)
source=("${_url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${_url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.tar.gz")
source_armv6h=("${_url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_armv6.tar.gz")
sha256sums=('049efcfc3e933c07a8f7064908dc8b8a21c865cfab2f35f3e53d3d5841bdd979')
sha256sums_aarch64=('d67f8f4fbd22f9cfb67d1feab148204c55ec65a795ac7296f34deaa7a503bf47')
sha256sums_armv6h=('cd114d0c0edddb21d0cb3274fe5b2af16e0c3c4ea39213dacd18f8067548e7ad')
sha512sums=('1ed84a0434c8f6f5bfd97c2d2d70154642adc4ab2f06b7abbc5b3aba4ef517fb8350f8d9f0f5e219f0f010e274a227c27c1b31a7e79eed81c011d520d2d73cca')
sha512sums_aarch64=('ac08ac64fbbd05ecf56f1d5e67387c64cb6af1ac466bb438921b918413478b660d55f118c048140071aa81a46e2252dd365ba7105889f16c1f02b32c1fd3ae0f')
sha512sums_armv6h=('6b99424cfccf3de17bf6dcfaaec53ca325cd3a71e1c3bf9454b41b0ddfb75e26edcb14ea5efe65555ecb50474eeb81def96ea400ee849920cd16fa4a4878d026')
b2sums=('4be2a568c287d4b7b39cd7c1e49aa307780b64d26bbe4f2fab187f34f3152ee5cee9c68f83e2bbbb6e278dd54a4b839c22ac3434f70e425017374d5302f6aab4')
b2sums_aarch64=('4eb4effd33db4b64a8d7ddd931ea782f94b2284bbf03435bab31409d9447280ff24b446fe0986d26aa1ff1832cc4b730a5c0d519e9ac20cfcc71f1c05fd98e20')
b2sums_armv6h=('5e76fa380e356f59bd8b36a25389a47c2f1a5eb1a8c4d295bd57257d4d31108b44c5af6bdd0ae2d4b1359a15e06bf0d5a6d31aaba7fdb8157592c29cb7696de1')

package() {
  install -Dm755 $_pkgname "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -Dm644 *.md -t "${pkgdir}/usr/share/doc/${_pkgname}/"
}
