# Maintainer: Det <nimetonmaili g-mail>

pkgname=jdk-devel-docs
_major=11
_build=19 
pkgver=${_major}b${_build}
pkgrel=1
pkgdesc="Documentation for Oracle Java $_major Development Kit Snapshot"
arch=('any')
url="http://jdk.java.net/$_major/"
license=('custom:Oracle')
depends=("java-environment>=$_major")
options=('!strip')
source=("https://download.java.net/java/early_access/jdk${_major}/${_build}/BCL/jdk-${_major}-ea+${_build}_doc-all.zip"
        'LICENSE-Early-Adopter-Development-Agreement.txt')
sha256sums=('0c2faba70f76b108720b1b6c48e158a4ae7d451bb575b5d9d01266d732ee84d9'
            '36d48f14c16f0dcc98a8ce2301fd2a111701e6f59a7da08b0e51fdb3e2f9ca89')

package() {
  # Install
  install -d "$pkgdir"/usr/share/doc/java$_major/
  mv docs/* "$pkgdir"/usr/share/doc/java$_major/

  # License
  install -Dm644 LICENSE-Early-Adopter-Development-Agreement.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
