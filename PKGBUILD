# Maintainer: Sotirios M. Roussis aka. xtonousou <xtonousou@gmail.com>

pkgname=ship
pkgver=2.6
pkgrel=1
pkgdesc='Simple, handy network addressing multitool with plenty of utilities'
source=('git+https://github.com/xtonousou/shIP.git')
url='https://github.com/xtonousou/shIP.git'
provides=('ship')
conflicts=('ship')
replaces=('ship')
md5sums=('SKIP')
sha256sums=('SKIP')
arch=('any')
license=('GPL3')
depends=('bash>=3.2'
				 'coreutils'
				 'gawk'
				 'grep'
				 'iproute2'
				 'iputils'
				 'mtr'
				 'sed'
				 'traceroute'
				 'wget')
makedepends=('binutils'
						 'coreutils'
					   'git')

prepare() {
  if [ -d "${srcdir}/${pkgname}" ]; then
    rm -rf "${srcdir}/${pkgname}"
  fi

  echo
	echo "   ▄▄▄▄▄    ▄  █ ▄█ █ ▄▄"
	echo "  █     ▀▄ █   █ ██ █   █"
	echo "▄  ▀▀▀▀▄   ██▀▀█ ██ █▀▀▀"
	echo " ▀▄▄▄▄▀    █   █ ▐█ █"
	echo "              █   ▐  █"
	echo "             ▀        ▀"
	echo

  mkdir -p "${srcdir}/${pkgname}"
  cd "${srcdir}/${pkgname}"
}

pkgver() {
  cd "${srcdir}/${pkgname}"
  
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${pkgname}"

  install -d "${pkgdir}/usr/bin"
  install -Dm755 ship.sh "${pkgdir}/usr/bin/ship"
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/$pkgname/LICENSE.md"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/$pkgname/README.md"
  install -Dm644 CHANGELOG.md "${pkgdir}/usr/share/doc/$pkgname/CHANGELOG.md"
}

# vim: ts=2 sw=2 et:
