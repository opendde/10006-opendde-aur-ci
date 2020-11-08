# Maintainer: Alexander Nicholi <me@nicholatian.com>
pkgname=slick
pkgver=1.2.2
pkgrel=1
epoch=
pkgdesc='Slick makefiles'
arch=('any')
url="https://github.com/aquefir/$pkgname"
license=('BSD')
depends=()
provides=("$pkgname")
conflicts=("$pkgname")
source=("https://github.com/aquefir/$pkgname/archive/mk-v$pkgver.tar.gz" 'aquefir.sh')
sha1sums=('77cbb7a5dbab147ef46253eb244d77b2b76099f5' 'SKIP')

build() {
  cd "$srcdir/$pkgname-mk-v$pkgver"
}

package() {
  cd "$srcdir/$pkgname-mk-v$pkgver"

  if [ "$(uname -s)" = 'Darwin' ]; then
    _install='ginstall'
  else
    _install='install'
  fi

  mkdir -p "${pkgdir}/opt/aq/lib/slick"
  if [ "$(uname -s)" != 'Darwin' ]; then
    mkdir -p "${pkgdir}/etc/profile.d"
  fi
  mkdir -p build
  env python3 util/generate.py > build/base.mk
  $_install -m644 -T "build/base.mk" "${pkgdir}/opt/aq/lib/slick/base.mk"
  $_install -m644 -T "src/targets.mk" "${pkgdir}/opt/aq/lib/slick/targets.mk"
  if [ "$(uname -s)" != 'Darwin' ]; then
    $_install -m755 -T "../aquefir.sh" "${pkgdir}/etc/profile.d/aquefir.sh"
  fi
}
