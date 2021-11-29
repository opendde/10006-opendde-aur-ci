# Maintainer: ipochto <ipochto@gmail.com>
# Contributor: Thaodan <theodorstormgrade@gmail.com>
 
pkgname=wargus-git
pkgver=3.1.3.r2697.6079ff28_20211129
pkgrel=1
pkgdesc="Warcraft2 Mod that allows you to play Warcraft2 with the Stratagus engine (dev version)"
arch=("i686" "x86_64")
url="https://github.com/WARGUS/WARGUS"
license=('GPL')
depends=('stratagus-git' 'ffmpeg2theora' 'cdparanoia' 'timidity++')
makedepends=('git' 'cmake')
source=("${pkgname}::git://github.com/Wargus/wargus.git")
md5sums=('SKIP')
provides=(${pkgname}
	  'wargus')
conflicts=('wargus')

pkgver() {
	cd "$srcdir/${pkgname}"
	dev_cycle=3.1.3
	printf "%s.r%s.%s_%s" "${dev_cycle}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" "$(date +%Y%m%d)"
}

build() {
  cd ${srcdir}

  cmake ${pkgname} -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DGAMEDIR=/usr/bin -Bbuild

  make -C build
}

package()  {
  cd $srcdir/build
  make  DESTDIR=${pkgdir} install
}
