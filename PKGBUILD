# Maintainer: Stefan Auditor <stefan.auditor@erdfisch.de>
# Please report issues at https://github.com/sanduhrs/arch-aur-drupalconsole

_pkgname=drupalconsole
pkgname=${_pkgname}
pkgver=1.2.0
pkgrel=1
pkgdesc="The Drupal Console is a suite of tools that you run on a command line interface (CLI) to generate boilerplate code and interact with a Drupal 8 installation."
arch=('any')
url="http://drupalconsole.com/"
license=('GPL')
depends=('php')
makedepends=("php-box" "php-composer" "git")
install="${_pkgname}.install"
source=("${_pkgname}-${pkgver//_/-}"::"https://github.com/hechoendrupal/drupal-console-launcher/archive/${pkgver//_/-}.tar.gz")
sha512sums=('a4a6ee4bd675f0abac5064ac851b2b9e108630423fadd1b5f7444ece196a83221e4ff740b48f645a3a915097917b3fd0b2ee9f75701abc6ce43733a23b803034')

build() {
  cd "${srcdir}/drupal-console-launcher-${pkgver//_/-}"
  php /usr/bin/composer install --no-dev
  ulimit -Sn 2048
  php -d phar.readonly=Off /usr/bin/php-box build
}

package() {
  cd "${srcdir}/drupal-console-launcher-${pkgver//_/-}"
  install -D -m755 "drupal.phar" "${pkgdir}/usr/bin/drupal"
}
