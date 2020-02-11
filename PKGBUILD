# Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)
# Contributor: Timothée Ravier <tim@siosm.fr>
# Contributor: Nicky726 (Nicky726 <at> gmail <dot> com)
# Contributor: Sergej Pupykin (pupykin <dot> s+arch <at> gmail <dot> com)
# Contributor: Zezadas
# Contributor: Pellegrino Prevete <cGVsbGVncmlub3ByZXZldGVAZ21haWwuY29tCg== | base -d>
#
# This PKGBUILD is maintained on https://github.com/archlinuxhardened/selinux.
# If you want to help keep it up to date, please open a Pull Request there.

pkgname=libselinux-python2
pkgver=3.0
pkgrel=1
pkgdesc="SELinux library and simple utilities (python 2.x bindings"
arch=('i686' 'x86_64' 'armv6h')
url='http://userspace.selinuxproject.org'
license=('custom')
groups=('selinux')
makedepends=('python' 'python2' 'ruby' 'xz' 'swig')
depends=('libsepol>=3.0' 'pcre')
optdepends=('python: python bindings'
	    'python2: python 2.X bindings'
            'ruby: ruby bindings')
conflicts=()
provides=()
replaces=()
source=("https://github.com/SELinuxProject/selinux/releases/download/20191204/libselinux-${pkgver}.tar.gz"
        "libselinux.tmpfiles.d")
sha256sums=('2ea2b30f671dae9d6b1391cbe8fb2ce5d36a3ee4fb1cd3c32f0d933c31b82433'
            'afe23890fb2e12e6756e5d81bad3c3da33f38a95d072731c0422fbeb0b1fa1fc')

build() {
  cd "libselinux-${pkgver}"

  # Do not build deprecated rpm_execcon() interface. It is useless on Arch Linux anyway.
  export DISABLE_RPM=y

  make swigify
  make all
  make PYTHON=/usr/bin/python2 pywrap
  make PYTHON=/usr/bin/python pywrap
  make RUBY=/usr/bin/ruby rubywrap
}

package() {
  cd "libselinux-${pkgver}"

  export DISABLE_RPM=y

  make DESTDIR="${pkgdir}" PYTHON=/usr/bin/python2 SBINDIR=/usr/bin SHLIBDIR=/usr/lib install-pywrap
  /usr/bin/python2 -m compileall "${pkgdir}/$(/usr/bin/python2 -c 'from distutils.sysconfig import *; print(get_python_lib(plat_specific=1))')"
  /usr/bin/python2 -O -m compileall "${pkgdir}/$(/usr/bin/python2 -c 'from distutils.sysconfig import *; print(get_python_lib(plat_specific=1))')"

}
