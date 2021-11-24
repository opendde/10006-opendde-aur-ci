# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
pkgname=oneshot-bin
pkgver=1.5.1
pkgrel=1
pkgdesc="First-come-first-serve single-fire HTTP/HTTPS server"
url="https://github.com/raphaelreyna/${pkgname/-bin/}"
arch=('x86_64' 'armv7h' 'aarch64')
license=(MIT)
conflicts=("${pkgname/-bin/}")
provides=("${pkgname/-bin/}")
source_x86_64=("${pkgname/-bin/}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${pkgname/-bin/}_${pkgver}.linux-x86_64.tar.gz")
source_armv7h=("${pkgname/-bin/}-${pkgver}-armv7h.tar.gz::${url}/releases/download/v${pkgver}/${pkgname/-bin/}_${pkgver}.linux-arm.tar.gz")
source_aarch64=("${pkgname/-bin/}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${pkgname/-bin/}_${pkgver}.linux-arm64.tar.gz")

sha512sums_x86_64=('f4f3c1f00574fd3eff685b3cd756aaff8466a1f0b6b5d3ed6aee08fc1aa690b63909114c654db4f17c5f379ec9255f189d3dd06d700ed8b3aecb1b69332d295b')
sha512sums_armv7h=('c0f9fb5f2a27a14918675c64ab61fd255228ed08854a61f4a5497bc6f80c8ec6435dbbb2ef6e9b1a267ed3263a7cbbe6c6d7eebb30b24ea5494ec97163fe1319')
sha512sums_aarch64=('2772ff22ad4ec2ddef06c7d433f68e0f31db6c05eda532f98404bc54e1ae0573465ff5009f56b997f5df945a70d85d6fe169c5cb5ed6affb121d6722164b907b')

package() {
  cd "${srcdir}/"

  install -Dvm755 "${pkgname/-bin/}" -t "${pkgdir}/usr/bin"

  install -Dvm644 "${pkgname/-bin/}.1" -t "${pkgdir}/usr/share/man/man1"

  install -Dvm644 icon/icon.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname/-bin/}.svg"

  install -Dvm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname/-bin/}"
  install -Dvm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname/-bin/}"
}
