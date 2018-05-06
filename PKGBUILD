# Maintainer: Anatol Pomozov <anatol dot pomozov at gmail>

pkgname=hdctools-git
pkgver=r947.a9e3afaf
pkgrel=1
pkgdesc='Chrome OS Hardware Debug & Control Tools'
url='http://sites.google.com/a/google.com/chromeos-partner/hardware-control-and-debug'
arch=(i686 x86_64)
depends=(python2 python2-pyusb python2-pyserial python2-pexpect libftdi python2-numpy ec-devutil-git)
makedepends=(tidy python2-setuptools)
license=(BSD)
source=(git+https://chromium.googlesource.com/chromiumos/third_party/hdctools
        remove-duplicated-check.patch)
sha1sums=('SKIP'
          'd28db1b931b8d5b5755d9c58405af8ecd6cf1610')

#TODO:
# - figure out compile problem with CPPFLAG
# - add udev/systemd rule that automacially starts a daemon if the device is connected

pkgver() {
  cd hdctools
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd hdctools
  patch -p1 < ../remove-duplicated-check.patch
}

build() {
  cd hdctools

  # build does not like flags provided by Arch. figure out why.
  unset CPPFLAGS

  make all
}

check() {
  cd hdctools
  python2 setup.py test
}

package() {
  cd hdctools
  python2 setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  rm "$pkgdir"/usr/lib/python2.7/site-packages/*.{d,o}

  # ctypes cannot load shared libs from /usr/lib/python2.7/site-packages/
  # move the libs to standard location
  mv "$pkgdir"/usr/lib/python2.7/site-packages/lib*.so "$pkgdir"/usr/lib
}
