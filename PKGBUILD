# Maintainer: Brian Bidulock <bidulock@openss7.org>
_kvv="$(pacman -Si linux-lts44|awk '/^Version/{print$3}')" || \
_kvv="$(pacman -Qi linux-lts44|awk '/^Version/{print$3}')"
_kvv="${_kvv:-4.4.202-1}"
_kvr="${_kvv:+${_kvv}-lts44}"
_kvx="$(echo $_kvr|sed -e 's,\.[0-9][0-9]*-.*,,')"
pkgname=openss7-modules-lts44-git
_pkgname=openss7-modules-lts44
pkgver=1.1.8.421.g6bc14a626
pkgrel=3
pkgdesc="OpenSS7 Fast-STREAMS and protocol Suites (${_kvx:-LTS 4.4} Kernel Modules)"
arch=('x86_64' 'i686')
url="http://www.openss7.org"
license=('AGPL3')
depends=("linux-lts44${_kvv:+=$_kvv}")
#depends=("openss7-git" "linux-lts44${_kvv:+=$_kvv}")
makedepends=('git' 'doxygen' 'gcc6-gcj' 'gcc-libs' 'ghostscript' 'gjdoc' 'glibc'
	     'gnupg' 'gnuplot' 'imagemagick' 'latex2html'
             'linux-lts44' 'linux-lts44-headers'
             'lsof' 'net-snmp' 'openssl' 'swig' 'systemd' 'tcl' 'texlive-bin'
	     'texlive-core' 'transfig' 'gawk' 'classpath'
             'popt')
conflicts=($_pkgname)
provides=("$_pkgname=$pkgver")
options=('!emptydirs' '!strip')
install="$pkgname.install"
source=("$pkgname::git+https://github.com/openss7/openss7.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long --tags|sed -e 's,^openss7-,,;s,\.2[0-9]*-,-,;s,[-_],.,g'
}

prepare() {
  cd $pkgname
  echo "$pkgver"|awk 'BEGIN{FS="."}{print$4"."$5}'>.pkgpatchlevel
  [ -x configure ] || autoreconf -fi
}

build() {
  cd $pkgname

  _csite_file=../$CARCH-config.site
  _mpost_file=../$CARCH-$_kvr-modpost.cache
  _cache_file=../$CARCH-$_kvr-config.cache

  ./configure \
      KCC="gcc" \
      GCJ="gcj" \
      CXX="g++-6" \
      CPPFLAGS="$CPPFLAGS" \
      CFLAGS="$CFLAGS" \
      CXXFLAGS="$CXXFLAGS" \
      LDFLAGS="$LDFLAGS" \
      DEBUG_CFLAGS="$DEBUG_CFLAGS" \
      DEBUG_CXXFLAGS="$DEBUG_CXXFLAGS" \
      syslibdir=/usr/lib \
      sysbindir=/usr/bin \
      syssbindir=/usr/bin \
      CONFIG_SITE=${_csite_file} \
      MODPOST_CACHE=${_mpost_file} \
      --cache-file=${_cache_file} \
      --libdir=/usr/lib \
      --bindir=/usr/bin \
      --sbindir=/usr/bin \
      --libexecdir=/usr/lib \
      --docdir=/usr/share/doc/$_pkgname \
      --disable-maintainer-mode \
      --disable-static \
      --disable-sysvinit \
      --disable-k-abi-support \
      --disable-k-weak-symbols \
      --enable-k-weak-modules \
      --disable-specfs-lock \
      --with-k-release=$_kvr \
      --with-k-subdir=extramodules/openss7 \
      --with-k-optimize=speed \
      --with-optimize=speed \
      --with-gnu-ld \
      --disable-docs \
      --disable-tools
  make -j1
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install-strip
  rm -fr "$pkgdir/usr/bin"
  rm -fr "$pkgdir/usr/lib/openss7"
  rm -fr "$pkgdir/usr/share/doc"
  d="$pkgdir/usr/lib/modules/${_kvr}/build/openss7"
  install -d "$d"
  install -m644 ../$CARCH-config.site            "$d"
  install -m644 ../$CARCH-$_kvr-modpost.cache    "$d"
  install -m644 ../$CARCH-$_kvr-config.cache     "$d"
  install -m644 Module.mkvars                    "$d"
  install -m644 System.symvers                   "$d"
  install -m644 Module.symvers                   "$d"
  install -m644 config.h                         "$d"
  cat System.symvers Module.symvers | gzip -9 -c >symvers-${_kvr}.gz
  install -m644 symvers-${_kvr}.gz               "$d"
  cat Module.symvers|awk '{print$4"\t"$3"\t"$1"\t"$2}' >abi-${_kvr}
  install -m644 abi-${_kvr}                      "$d"
  install -m644 symsets-${_kvr}.tar.gz           "$d"
  install -d "$pkgdir"/usr/lib/modules/extramodules-${_kvx}-lts44
  mv -f "$pkgdir"/usr/lib/modules/${_kvr}/extramodules/openss7 \
        "$pkgdir"/usr/lib/modules/extramodules-${_kvx}-lts44
  install -d "$pkgdir/usr/src/$_pkgname-$pkgver-$pkgrel"
  ln -s ../../lib/modules/${_kvr}/build/openss7 \
        "$pkgdir/usr/src/${_pkgname}-$pkgver-$pkgrel/$_kvr"
}

# vim: sw=2 et
