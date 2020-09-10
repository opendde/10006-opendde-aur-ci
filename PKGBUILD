# Maintainer: Jamie Magee <jamie dot magee at gmail dot com>
_name=bicep
pkgname=$_name-bin
pkgver=0.1.1
pkgrel=2
pkgdesc="Bicep is a Domain Specific Language (DSL) for deploying Azure resources declaratively."
arch=('x86_64')
url="https://github.com/Azure/$_name"
license=('MIT')
provides=($_name)
conflicts=($_name)
options=('!strip')
source=("${pkgname}-${pkgver}::https://github.com/Azure/${_name}/releases/download/v${pkgver}-alpha/${_name}-linux-x64"
  "https://raw.githubusercontent.com/Azure/${_name}/v${pkgver}-alpha/LICENSE")
b2sums=('ff4e892f306034dd09bcb7dadeaac141297e82ac59ca97fb72b115c1eb24c9537d4d128b88a92d09c803e6ef17e98dcf7cb7fdb9d2b987002fda480b3d0f53ff'
  '1e0a143630bdf1d10e34a180d83b967ca132c6c976b5a7c93c1452b6747d3f05ed0aab8c7ef7436af61971ebab7b9fc6aa7378784e3776d8913c6825a6cb3e74')

package() {
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 "${pkgname}-${pkgver}" "${pkgdir}/usr/bin/${_name}"
}
