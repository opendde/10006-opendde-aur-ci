# Maintainer: zaps166 <spaz16@wp.pl>

pkgname=qmplay2
pkgver=15.07.13
pkgrel=1
pkgdesc='QMPlay2 is a video and audio player which can play most formats and codecs'
arch=('i686' 'x86_64' 'armv7' 'armv6' 'armv5')
url='http://qt-apps.org/content/show.php/QMPlay2?content=153339'
license=('LGPL')
depends=('qt4' 'ffmpeg' 'libass' 'libgl' 'libva' 'libxv' 'alsa-lib' 'libcdio' 'taglib' 'libcddb')
optdepends=('pulseaudio' 'youtube-dl')
makedepends=('make' 'gcc')
# source="http://downloads.sourceforge.net/project/zaps166/QMPlay2/QMPlay2-src-${pkgver}.tar.bz2"
# sha256sums=(2a770260a6d32a531533fedb0034d0b66ed1211186722a188ecb756a4fa8c72f)
source="https://github.com/zaps166/QMPlay2/archive/${pkgver}.tar.gz"
sha256sums=(21423610aff39e0a69735504e1ac3abc8384e2549fa635f5faac5b389a3108e6)

build()
{
    cd $srcdir/QMPlay2-*
    NOTERM=1 SYSTEM_BUILD=1 ./compile_unix 0
}

package()
{
    mv $srcdir/QMPlay2-*/app $pkgdir/usr
}
