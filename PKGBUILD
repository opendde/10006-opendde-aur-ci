# Mantainer: Bruno Galeotti <bgaleotti at gmail dot com>
# Contributor: Stefan Auditor <stefan.auditor@erdfisch.de>

pkgname=php-cs-fixer
_pkgname=PHP-CS-Fixer
pkgver=1.11
pkgrel=1
pkgdesc="Analyzes some PHP source code and tries to fix coding standards issues (PSR-1 and PSR-2 compatible)."
url="http://cs.sensiolabs.org/"
license="MIT"
arch=("any")
depends=("php>=5.3.6")
makedepends=("php-box" "php-composer")
source=("https://github.com/FriendsOfPHP/${_pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('337eeb18b9d6ab41fda772bb3372467a6093a153f336f804b2d2ca1b4631e1ea99fdc2ac690780003e911da4a24942052fd00d1daa0129abe10d459f93b9c1d4')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  php -d extension=phar.so -d open_basedir=~:/usr/:`pwd` /usr/bin/composer install --prefer-dist --no-dev
  sed -i '/git-commit/d' box.json
  php -d extension=phar.so -d phar.readonly=Off -d display_errors=Off /usr/bin/php-box build
}

check() {
  STATUS=0

  if ! php -i | grep 'PHP Archive support => enabled' >/dev/null 2>&1; then
      echo -e "Warning: phar.so must be loaded in your php.ini to install and use ${pkgname}"
      STATUS=1
  fi
  if ! php -i | grep -E '(:/usr/$|:/usr/:)' >/dev/null 2>&1; then
      echo -e "Warning: You must add ':/usr/' to 'open_basedir' setting in your php.ini to use ${pkgname}"
      STATUS=1
  fi

  if [ ${STATUS} != 0 ]; then
     exit ${STATUS}
  fi
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m755 "${pkgname}.phar" "${pkgdir}/usr/share/webapps/bin/${pkgname}.phar"
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/webapps/bin/${pkgname}.phar" "${pkgdir}/usr/bin/${pkgname}"
}
