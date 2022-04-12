# Maintainer: fridtjof <fridtjof@das-labor.org>
_pkgname=ABswitchStereo
pkgname=abswitchstereo-lv2-git
pkgver=gc38891e
pkgrel=1
epoch=1
pkgdesc="Stereo source comparison tool"
arch=('x86_64') #todo
url="https://github.com/sonejostudios/ABswitchStereo"
license=('GPL2')
groups=()
depends=()
makedepends=(
    'git'
    'faust'
    'qt5-tools' # faust2lv2
)
source=('git+https://github.com/sonejostudios/ABswitchStereo.git')
sha256sums=('SKIP')

build() {
	cd "$srcdir/$_pkgname"
	faust2lv2 ABswitchStereo.dsp
}

package() {
	cd "$srcdir/$_pkgname"
        install -D ABswitchStereo.lv2/* -t "$pkgdir/usr/lib/lv2/ABswitchStereo.lv2"
}
