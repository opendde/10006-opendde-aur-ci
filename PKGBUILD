# Contributor: Oleg Plakhotniuk <olegus EIGHT AT gmail DOT com>
# Maintainer: Simon Legner <Simon.Legner@gmail.com>

pkgname=validatornu
pkgver=18.8.29
pkgrel=1
pkgdesc="The Nu Html Checker, a command line tool for HTML5 markup validation"
arch=('any')
url="https://validator.github.io/validator/"
license=('custom')
depends=('java-environment')
makedepends=('unzip')
source=('validatornu'
        "https://github.com/validator/validator/releases/download/${pkgver}/vnu.jar_${pkgver}.zip")

package() {
  cd "$srcdir/dist"
  install -D "$srcdir/validatornu" "$pkgdir/usr/bin/validatornu"
  install -D -m644 vnu.jar "$pkgdir/usr/share/java/$pkgname/vnu.jar"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -D -m644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -D -m644 index.html "$pkgdir/usr/share/doc/$pkgname/index.html"
}

# vim:set ts=2 sw=2 et:
sha256sums=('96cd47b569b8c79a60f3bea22159444919b418ef20d8beb4b223a6389aabbf25'
            'd3a93efe04b7695c831ba72f06401f371d48f444e95152dbfa75e8c91797531a')
