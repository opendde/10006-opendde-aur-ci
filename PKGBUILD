# Maintainer: Alexis Polti <ArchSegger at gmail dot com>
# Maintainer: pzl <alsoelp at gmail dot com>

pkgname=ozone
pkgver=2.22
pkgrel=1
epoch=2
pkgdesc="Segger Ozone JLink debugger for Linux"
arch=('i686' 'x86_64')
license=('custom')
groups=('jlink')
replaces=('jlink-debugger')
conflicts=('jlink-debugger')
provides=('jlink-debugger')
depends=('qt4' 'jlink-software-and-documentation>=5.10n')
source_x86_64=("Ozone_Linux_V${pkgver/./}_x86_64.tgz::https://www.segger.com/downloads/jlink/Ozone_Linux_V${pkgver/./}_x86_64.tgz")
source_i686=("Ozone_Linux_V${pkgver/./}_i686.tgz::https://www.segger.com/downloads/jlink/Ozone_Linux_V${pkgver/./}_i386.tgz")
md5sums_i686=('c15cba708e7c4c7e314eeed2afc22dcd')
md5sums_x86_64=('f0cb10c38c4432111de465b5d8efb00e')
url="https://www.segger.com/jlink-software.html"


package(){
    if [ ${CARCH} = "i686" ]; then
        mv Ozone_Linux_V${pkgver/./}_i386 Ozone
    else
        mv Ozone_Linux_V${pkgver/./}_x86_64 Ozone
    fi

    # Match package placement from their .deb, in /opt
    install -dm755 "${pkgdir}/opt/SEGGER/Ozone" \
            "${pkgdir}/usr/share/licenses/${pkgname}" \
            "${pkgdir}/usr/lib/" \
            "${pkgdir}/usr/bin/" \
            "${pkgdir}/usr/share/doc/${pkgname}/"

    cd ${srcdir}/Ozone*

    # Make permissions right
    find . -type d | xargs chmod a+rx
    find . -type f | xargs chmod a+r

    # Remove un-needed files
    find . -name ".svn" | xargs rm -rf

    # Bulk copy everything
    cp --preserve=mode -r Ozone Plugins Doc Config Lib Ozone.png "${pkgdir}/opt/SEGGER/Ozone"

    # Create links where needed
    ln -s /opt/SEGGER/Ozone/Doc/License.txt "${pkgdir}/usr/share/licenses/${pkgname}/"
    ln -s /opt/SEGGER/Ozone/Ozone "${pkgdir}/usr/bin"

    for f in Doc/*; do
        ln -s /opt/SEGGER/Ozone/"$f" "${pkgdir}/usr/share/doc/${pkgname}"
    done
}
