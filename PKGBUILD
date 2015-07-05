
# Contributor: Adrian Holfter <aholfter at googlemail dot com>

pkgname=tragtor
pkgver=0.9.1
pkgrel=1
pkgdesc="A graphical user interface for ffmpeg" 
arch=('i686' 'x86_64')
url="http://mein-neues-blog.de/tragtor-gui-for-FFmpeg/" 
license=('GPL')
depends=('python2' 'pygtk>=2.6' 'python2-dbus' 'id3v2' 'ffmpeg')

source=(http://repository.mein-neues-blog.de:9000/archive/${pkgname}-${pkgver}_all.tar.gz)

md5sums=('f68196bc06be5150a2aa5a6105773b49')

package() {
	# Patch: Force traGtor to use python2 instead of the new python3
	sed -i "s/python\ /python2\ /" $srcdir/usr/bin/tragtor || return 1

	# Set English as the default language
	sed -i "s/\"language\":\"de\"/\"language\":\"en\"/" $srcdir/usr/share/tragtor/tragtor.py || return 1
        
	# Copy files
	cp -R $srcdir/usr $pkgdir/usr || return 1
}
