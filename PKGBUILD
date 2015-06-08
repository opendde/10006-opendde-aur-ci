# Maintainer: GordonGR <ntheo1979@gmail.com>

pkgname=singularityviewer
pkgver=1.8.6.6157
pkgrel=1
pkgdesc="An exciting client for Second Life (secondlife) and OpenSim (opensimulator), which combines the look and feel of Viewer 1.23 with the latest and greatest of available technology."
url="http://www.singularityviewer.org/"
license=('custom')
arch=('i686' 'x86_64')
depends=('apr-util' 'gtk2' 'libgl' 'libidn' 'libjpeg-turbo' 'mesa' 'nss' 'sdl' 'glu' 'pangox-compat')
optdepends=('libpulse: for PulseAudio support' 'alsa-lib: for ALSA support' 'nvidia-utils: for NVIDIA support' 'flashplugin: for inworld Flash support' 'gstreamer0.10: for video support, may need good, bad and ugly plugins' 'lib32-freealut: for OpenAL support')
source=(	"https://bitbucket.org/SingularityViewer/singularityviewer/downloads/Singularity-$CARCH-$pkgver.tar.bz2"
		"singularityviewer.desktop"
		"singularityviewer.launcher")

if [ "$CARCH" = "i686" ]; then
md5sums=('d2ef47e3a52b92afa0a979dfbe2d9966'
         '21b1e68507a1dd851da8ef7d766afe58'
         'eb596f5cf7b6f2d0c55c0082fb99a905')
elif [ "$CARCH" = "x86_64" ]; then
md5sums=('5fec78052e9f1a99c0d192658137ee8c'
         '21b1e68507a1dd851da8ef7d766afe58'
         'eb596f5cf7b6f2d0c55c0082fb99a905')
fi

package() {
cd $srcdir
  
# Rename Data Directory
mv Singularity-$CARCH-${pkgver} singularityviewer
  
# Install Desktop File
install -D -m644 $srcdir/singularityviewer.desktop \
    $pkgdir/usr/share/applications/singularityviewer.desktop
  
# Install Icon File
install -D -m644 $srcdir/singularityviewer/singularity_icon.png \
    $pkgdir/usr/share/pixmaps/singularityviewer.png
  
# Install Launcher
install -D -m755 $srcdir/singularityviewer.launcher \
    $pkgdir/usr/bin/singularityviewer

# Install License file
install -D -m755 $srcdir/singularityviewer/licenses.txt \
    $pkgdir/usr/share/licenses/$pkgname/LICENSE
    
# Move Data to Destination Directory
install -d $pkgdir/opt
mv singularityviewer $pkgdir/opt/
  
# Change Permissions of files to root:games
chown -R root:games $pkgdir/opt/singularityviewer
chmod -R g+rw $pkgdir/opt/singularityviewer

# Make Binary Group-Executable
chmod g+x $pkgdir/opt/singularityviewer/singularity
 
# Do not re-register the application with the desktop system at every launch, saves from locally installed desktop files.
sed -i 's|./refresh_desktop_app_entry.sh|#./refresh_desktop_app_entry.sh|' $pkgdir/opt/singularityviewer/singularity
rm $pkgdir/opt/singularityviewer/refresh_desktop_app_entry.sh
    
}
