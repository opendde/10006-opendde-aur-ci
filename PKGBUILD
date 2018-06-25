# Contributor: Lucky <archlinux@builds.lucky.li>
## Based on libtorrent [community]
# Maintainer: aksr <aksr at t-com dot me>
pkgname=libtorrent-git
pkgver=0.13.7.r1.g7b29b6bd
pkgrel=1
pkgdesc="A BitTorrent library written in C++."
url="https://github.com/rakshasa/libtorrent/"
license=("GPL")
arch=("i686" "x86_64")
depends=("libsigc++" "openssl" "cppunit")
makedepends=("git")
conflicts=('libtorrent')
provides=('libtorrent')
options=("!libtool")
source=("$pkgname::git+https://github.com/rakshasa/libtorrent.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long | sed -r "s/([^-]*-g)/r\1/;s/-/./g;s/^v//"
}

prepare() {
  cd "$srcdir/$pkgname"
  sed '/AM_PATH_CPPUNIT/d' -i configure.ac
}

build() {
  cd "$srcdir/$pkgname"
  ./autogen.sh
  export CXXFLAGS="${CXXFLAGS} -fno-strict-aliasing"
  ./configure --prefix=/usr --disable-debug
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir" install
}

