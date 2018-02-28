# $Id$
# Maintainer: Mingye Wang <arthur2e5@aosc.io>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=fontconfig-srb
pkgver=2.12.93
pkgrel=1
pkgdesc="A library for configuring and customizing font access (michalsrb performance patch, AOSC variant)"
arch=(x86_64)
url="https://github.com/AOSC-Dev/fontconfig"
license=(custom)
depends=(expat freetype2)
makedepends=(git autoconf-archive gperf python-lxml python-six docbook-utils docbook-sgml
             perl-sgmls 'texlive-formatsextra>=2017' lynx)
provides=(fontconfig)
conflicts=(fontconfig)
install=fontconfig.install
_commit=a4e6fc6ae509da8194b79006e747467bf672c1ed # 2.12.93+srb, latest fixes
source=("git+https://github.com/AOSC-Dev/fontconfig#commit=$_commit"
        fontconfig.hook)
sha256sums=('SKIP'
            '672f6a1c5e164671955ce807e670306194142a1794ce88df653aa717a972e274')

# a nice page to test font matching:
# http://zipcon.net/~swhite/docs/computers/browsers/fonttest.html
# http://getemoji.com/

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $pkgname
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd $pkgname
  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --with-templatedir=/etc/fonts/conf.avail \
    --with-xmldir=/etc/fonts \
    --localstatedir=/var \
    --disable-static \
    --with-default-fonts=/usr/share/fonts \
    --with-add-fonts=/usr/local/share/fonts
  make
}

check() {
  cd $pkgname
  make -k check
}

_install_conf() {
  install -m644 "$1" "$pkgdir/etc/fonts/conf.avail"
  ln -s "../conf.avail/${1##*/}" "$pkgdir/etc/fonts/conf.d"
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  install -Dm644 ../fontconfig.hook "$pkgdir/usr/share/libalpm/hooks/fontconfig.hook"
}
