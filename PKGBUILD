# Contributor: Henrik Hodne <henrik@hodne.io>
# Maintainer: Dennis Schubert <mail@dennis-schubert.de>

pkgname=ruby-install
pkgver=0.8.2
pkgrel=1
pkgdesc="Installs Ruby, JRuby, Rubinius, MRuby or TruffleRuby."
arch=(any)
url="https://github.com/postmodern/ruby-install"
license=('MIT')
depends=('bash')
optdepends=('zsh')
makedepends=('gnupg')
source=("https://github.com/postmodern/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('72a998b76f787c32a1575f10494594ec2d963f5ad5748004292841b33f8013e7')

prepare() {
  if gpg --fingerprint 0xB9515E77 >/dev/null 2>&1; then
    # Download key
    msg "Downloading package signature"
    curl -L -o ${pkgname}-${pkgver}.tar.gz.asc https://raw.github.com/postmodern/${pkgname}/master/pkg/${pkgname}-${pkgver}.tar.gz.asc -s

    # Check key
    if gpg --verify ${pkgname}-${pkgver}.tar.gz.asc ${srcdir}/v${pkgver}.tar.gz; then
      msg "Verification of package was successful."
    else
      msg "Verification of package failed. Please check yourself with:"
      echo "gpg --verify ${pkgname}-${pkgver}.tar.gz.asc ${srcdir}/v${pkgver}.tar.gz"
    fi
  else
    printf "\n\n"
    msg "Please import the gpg key of the ruby-install author, to check package integrity:"
    msg "https://postmodern.github.io/contact.html#pgp"
    printf "\n\n"
  fi
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX="${pkgdir}/usr" install
}
