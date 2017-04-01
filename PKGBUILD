# Maintainer: Joshua Ellis <josh@jpellis.me>
# Contributor: Anish Tondwalkar <anish@tjhsst.edu>
# Contributor: Ghost91 <m_graeb11@cs.uni-kl.de>
# Contributor: Michael Pusterhofer <pusterhofer at student dot tugraz dot at>
# Contributor: Raphael Scholer <rscholer@gmx.de>
# Contributor: kjslag <kjslag at gmail dot com>
# Contributor: teratomata <teratomat@gmail.com>

pkgname=mathematica
pkgver=11.1.0
pkgrel=1
pkgdesc="A computational software program used in scientific, engineering, and mathematical fields and other areas of technical computing."
arch=('i686' 'x86_64')
url="http://www.wolfram.com/mathematica/"
license=('proprietary')
depends=('libxml2')
optdepends=('mesa-demos: for "fully optimized graphics capabilities"'
            'alsa-lib: for sound support')
source=("local://Mathematica_${pkgver}_LINUX.sh")
sha256sums=('3a866cc1b49dc06ec11f7d7288051916b7aa1959ae2f32f96dd1780ad228ca4d')
options=("!strip")

## To build this package you need to place the mathematica-installer into your
## startdir If you don't own the installer you can download a trial version at
## http://www.wolfram.com/mathematica/trial

## The documentation takes up the majority of the disk space.  If you do not wish
## to keep it, uncomment the relevant lines at the bottom of this PKGBUILD.

## The final package can be very large (especially if documentation is kept) and
## compression can be quite slow.  In most cases, the package is installed
## straight away and the package need not be kept, so compression is disabled.
PKGEXT='.pkg.tar'

prepare() {
    if df "${srcdir}" | grep -q tmpfs; then
        warning "Building Mathematica takes more than 8GB of space."
        warning "Building in a tmpfs (e.g. /tmp when mounted into RAM) may not work."
    fi

    if [ $(echo "${srcdir}" | wc -w) -ne 1 ]; then
        msg2 "ERROR: The Mathematica installer doesn't support directory names with spaces."
        msg2 "Try building from a directory without spaces."
        msg2 "Current build directory: ${srcdir}"
        false
    fi

    chmod +x ${srcdir}/Mathematica_${pkgver}_LINUX.sh
}

package() {
    msg2 "Running Mathematica installer"
    # https://reference.wolfram.com/language/tutorial/InstallingMathematica.html#650929293
    ${srcdir}/Mathematica_${pkgver}_LINUX.sh -- \
             -execdir=${pkgdir}/usr/bin \
             -targetdir=${pkgdir}/opt/Mathematica \
             -auto

    msg2 "Fixing symbolic links"
    cd ${pkgdir}/usr/bin
    rm *
    ln -s /opt/Mathematica/Executables/math
    ln -s /opt/Mathematica/Executables/mathematica
    ln -s /opt/Mathematica/Executables/Mathematica
    ln -s /opt/Mathematica/Executables/MathKernel
    ln -s /opt/Mathematica/Executables/mcc
    ln -s /opt/Mathematica/Executables/wolfram
    ln -s /opt/Mathematica/Executables/WolframKernel
    if [ "${CARCH}" = "x86_64" ]; then
        ln -s /opt/Mathematica/SystemFiles/Kernel/Binaries/Linux-x86-64/ELProver
        ln -s /opt/Mathematica/SystemFiles/Kernel/Binaries/Linux-x86-64/wolframscript
    else
        ln -s /opt/Mathematica/SystemFiles/Kernel/Binaries/Linux/ELProver
        ln -s /opt/Mathematica/SystemFiles/Kernel/Binaries/Linux/wolframscript
    fi

    msg2 "Copying menu and mimetype information"
    mkdir -p \
          ${pkgdir}/usr/share/applications \
          ${pkgdir}/usr/share/desktop-directories \
          ${pkgdir}/usr/share/mime/packages
    cd ${pkgdir}/opt/Mathematica/SystemFiles/Installation
    desktopFile='wolfram-mathematica11.desktop'
    sed -Ei 's|^(\s*TryExec=).*|\1/usr/bin/Mathematica|g' $desktopFile
    sed -Ei 's|^(\s*Exec=).*|\1/usr/bin/Mathematica %F|g' $desktopFile
    printf 'Categories=Science;Math;NumericalAnalysis;DataVisualization;' >> $desktopFile
    cp $desktopFile ${pkgdir}/usr/share/applications/
    cp wolfram-all.directory ${pkgdir}/usr/share/desktop-directories/
    cp *.xml ${pkgdir}/usr/share/mime/packages/

    msg2 "Copying icons"
    mkdir -p ${pkgdir}/usr/share/icons/hicolor/{32x32,64x64,128x128}/{apps,mimetypes}
    cd ${pkgdir}/opt/Mathematica/SystemFiles/FrontEnd/SystemResources/X
    for i in 32 64 128; do
        cp App-${i}.png ${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/wolfram-mathematica.png
        for mimetype in $(ls vnd.* | cut -d '-' -f1 | uniq); do
            cp ${mimetype}-${i}.png ${pkgdir}/usr/share/icons/hicolor/${i}x${i}/mimetypes/application-${mimetype}.png
        done
    done

    msg2 "Copying man pages"
    mkdir -p ${pkgdir}/usr/share/man/man1
    cd ${pkgdir}/opt/Mathematica/SystemFiles/SystemDocumentation/Unix
    cp *.1 ${pkgdir}/usr/share/man/man1

    msg2 "Fixing file permissions"
    chmod go-w -R ${pkgdir}/*

    if [ "${CARCH}" = "x86_64" ]; then
        msg2 "Removing files for i686"
        rm -rf \
           "${pkgdir}/opt/Mathematica/AddOns/Applications/DocumentationSearch/LibraryResources/Linux" \
           "${pkgdir}/opt/Mathematica/AddOns/Applications/StandardOceanData/LibraryResources/Linux" \
           "${pkgdir}/opt/Mathematica/SystemFiles/Activation/Linux" \
           "${pkgdir}/opt/Mathematica/SystemFiles/Autoload/PacletManager/LibraryResources/Linux" \
           "${pkgdir}/opt/Mathematica/SystemFiles/Components/HTTPHandling/Resources/Binaries/Linux" \
           "${pkgdir}/opt/Mathematica/SystemFiles/Components/MXNetLink/LibraryResources/Linux" \
           "${pkgdir}/opt/Mathematica/SystemFiles/Components/MachineLearning/Resources/Binaries/Linux" \
           "${pkgdir}/opt/Mathematica/SystemFiles/Components/NumericArrayUtilities/LibraryResources/Linux" \
           "${pkgdir}/opt/Mathematica/SystemFiles/Components/PredictiveInterface/Kernel/Predictions.mx/Linux" \
           "${pkgdir}/opt/Mathematica/SystemFiles/Components/PredictiveInterface/Kernel/PredictiveInterfaceCode.mx/Linux" \
           "${pkgdir}/opt/Mathematica/SystemFiles/Components/SemanticImport/Binaries/Linux" \
           "${pkgdir}/opt/Mathematica/SystemFiles/Components/SpellCorrect/LibraryResources/Linux" \
           "${pkgdir}/opt/Mathematica/SystemFiles/Components/TextSearch/Binaries/Linux" \
           "${pkgdir}/opt/Mathematica/SystemFiles/Converters/Binaries/Linux" \
           "${pkgdir}/opt/Mathematica/SystemFiles/FrontEnd/Binaries/Linux" \
           "${pkgdir}/opt/Mathematica/SystemFiles/Graphics/Binaries/Linux" \
           "${pkgdir}/opt/Mathematica/SystemFiles/Java/Linux" \
           "${pkgdir}/opt/Mathematica/SystemFiles/Kernel/Binaries/Linux" \
           "${pkgdir}/opt/Mathematica/SystemFiles/Kernel/SystemResources/Linux" \
           "${pkgdir}/opt/Mathematica/SystemFiles/Libraries/Linux" \
           "${pkgdir}/opt/Mathematica/SystemFiles/Links/AudioFileStreamTools/LibraryResources/Linux" \
           "${pkgdir}/opt/Mathematica/SystemFiles/Links/AudioTools/LibraryResources/Linux" \
           "${pkgdir}/opt/Mathematica/SystemFiles/Links/CURLLink/LibraryResources/Linux" \
           "${pkgdir}/opt/Mathematica/SystemFiles/Links/CalendarTools/LibraryResources/Linux" \
           "${pkgdir}/opt/Mathematica/SystemFiles/Links/CloudObject/LibraryResources/Linux" \
           "${pkgdir}/opt/Mathematica/SystemFiles/Links/DTWTools/LibraryResources/Linux" \
           "${pkgdir}/opt/Mathematica/SystemFiles/Links/FDLLink/LibraryResources/Linux" \
           "${pkgdir}/opt/Mathematica/SystemFiles/Links/GIFTools/LibraryResources/Linux" \
           "${pkgdir}/opt/Mathematica/SystemFiles/Links/GeometryTools/LibraryResources/Linux" \
           "${pkgdir}/opt/Mathematica/SystemFiles/Links/HDF5Tools/LibraryResources/Linux" \
           "${pkgdir}/opt/Mathematica/SystemFiles/Links/IPOPTLink/LibraryResources/Linux" \
           "${pkgdir}/opt/Mathematica/SystemFiles/Links/JLink/Kernel/SystemResources/Linux" \
           "${pkgdir}/opt/Mathematica/SystemFiles/Links/JLink/SystemFiles/Libraries/Linux" \
           "${pkgdir}/opt/Mathematica/SystemFiles/Links/JSONTools/LibraryResources/Linux" \
           "${pkgdir}/opt/Mathematica/SystemFiles/Links/LibraryLink/LibraryResources/Linux" \
           "${pkgdir}/opt/Mathematica/SystemFiles/Links/MIDITools/LibraryResources/Linux" \
           "${pkgdir}/opt/Mathematica/SystemFiles/Links/MIMETools/LibraryResources/Linux" \
           "${pkgdir}/opt/Mathematica/SystemFiles/Links/MP3Tools/LibraryResources/Linux" \
           "${pkgdir}/opt/Mathematica/SystemFiles/Links/MQTTLink/LibraryResources/Linux" \
           "${pkgdir}/opt/Mathematica/SystemFiles/Links/MQTTLink/Resources/Binaries/Linux" \
           "${pkgdir}/opt/Mathematica/SystemFiles/Links/MathLink/DeveloperKit/Linux" \
           "${pkgdir}/opt/Mathematica/SystemFiles/Links/MongoLink/LibraryResources/Linux" \
           "${pkgdir}/opt/Mathematica/SystemFiles/Links/OGGTools/LibraryResources/Linux" \
           "${pkgdir}/opt/Mathematica/SystemFiles/Links/OpenCVLink/LibraryResources/Linux" \
           "${pkgdir}/opt/Mathematica/SystemFiles/Links/OpenSURF/LibraryResources/Linux" \
           "${pkgdir}/opt/Mathematica/SystemFiles/Links/ProcessLink/LibraryResources/Linux" \
           "${pkgdir}/opt/Mathematica/SystemFiles/Links/RAWTools/LibraryResources/Linux" \
           "${pkgdir}/opt/Mathematica/SystemFiles/Links/RLink/SystemFiles/Libraries/Linux" \
           "${pkgdir}/opt/Mathematica/SystemFiles/Links/SerialLink/LibraryResources/Linux" \
           "${pkgdir}/opt/Mathematica/SystemFiles/Links/SocketLink/LibraryResources/Linux" \
           "${pkgdir}/opt/Mathematica/SystemFiles/Links/SoundFileTools/LibraryResources/Linux" \
           "${pkgdir}/opt/Mathematica/SystemFiles/Links/StreamLink/LibraryResources/Linux" \
           "${pkgdir}/opt/Mathematica/SystemFiles/Links/TesseractTools/LibraryResources/Linux" \
           "${pkgdir}/opt/Mathematica/SystemFiles/Links/TetGenLink/LibraryResources/Linux" \
           "${pkgdir}/opt/Mathematica/SystemFiles/Links/TinkerForgeWeatherStationTools/Binaries/Linux" \
           "${pkgdir}/opt/Mathematica/SystemFiles/Links/TriangleLink/LibraryResources/Linux" \
           "${pkgdir}/opt/Mathematica/SystemFiles/Links/UUID/LibraryResources/Linux" \
           "${pkgdir}/opt/Mathematica/SystemFiles/Links/VernierLink/LibraryResources/Linux" \
           "${pkgdir}/opt/Mathematica/SystemFiles/Links/WSTP/DeveloperKit/Linux" \
           "${pkgdir}/opt/Mathematica/SystemFiles/Links/WebpTools/LibraryResources/Linux" \
           "${pkgdir}/opt/Mathematica/SystemFiles/Links/XMPTools/LibraryResources/Linux"
    else
        msg2 "Removing files for x86_64"
        rm -rf \
           "${pkgdir}/opt/Mathematica/AddOns/Applications/DocumentationSearch/LibraryResources/Linux-x86-64" \
           "${pkgdir}/opt/Mathematica/AddOns/Applications/StandardOceanData/LibraryResources/Linux-x86-64" \
           "${pkgdir}/opt/Mathematica/SystemFiles/Activation/Linux-x86-64" \
           "${pkgdir}/opt/Mathematica/SystemFiles/Autoload/PacletManager/LibraryResources/Linux-x86-64" \
           "${pkgdir}/opt/Mathematica/SystemFiles/Components/HTTPHandling/Resources/Binaries/Linux-x86-64" \
           "${pkgdir}/opt/Mathematica/SystemFiles/Components/MXNetLink/LibraryResources/Linux-x86-64" \
           "${pkgdir}/opt/Mathematica/SystemFiles/Components/MachineLearning/Resources/Binaries/Linux-x86-64" \
           "${pkgdir}/opt/Mathematica/SystemFiles/Components/NumericArrayUtilities/LibraryResources/Linux-x86-64" \
           "${pkgdir}/opt/Mathematica/SystemFiles/Components/PredictiveInterface/Kernel/Predictions.mx/Linux-x86-64" \
           "${pkgdir}/opt/Mathematica/SystemFiles/Components/PredictiveInterface/Kernel/PredictiveInterfaceCode.mx/Linux-x86-64" \
           "${pkgdir}/opt/Mathematica/SystemFiles/Components/SemanticImport/Binaries/Linux-x86-64" \
           "${pkgdir}/opt/Mathematica/SystemFiles/Components/SpellCorrect/LibraryResources/Linux-x86-64" \
           "${pkgdir}/opt/Mathematica/SystemFiles/Components/TextSearch/Binaries/Linux-x86-64" \
           "${pkgdir}/opt/Mathematica/SystemFiles/Converters/Binaries/Linux-x86-64" \
           "${pkgdir}/opt/Mathematica/SystemFiles/FrontEnd/Binaries/Linux-x86-64" \
           "${pkgdir}/opt/Mathematica/SystemFiles/Graphics/Binaries/Linux-x86-64" \
           "${pkgdir}/opt/Mathematica/SystemFiles/Java/Linux-x86-64" \
           "${pkgdir}/opt/Mathematica/SystemFiles/Kernel/Binaries/Linux-x86-64" \
           "${pkgdir}/opt/Mathematica/SystemFiles/Kernel/SystemResources/Linux-x86-64" \
           "${pkgdir}/opt/Mathematica/SystemFiles/Libraries/Linux-x86-64" \
           "${pkgdir}/opt/Mathematica/SystemFiles/Links/AudioFileStreamTools/LibraryResources/Linux-x86-64" \
           "${pkgdir}/opt/Mathematica/SystemFiles/Links/AudioTools/LibraryResources/Linux-x86-64" \
           "${pkgdir}/opt/Mathematica/SystemFiles/Links/CURLLink/LibraryResources/Linux-x86-64" \
           "${pkgdir}/opt/Mathematica/SystemFiles/Links/CalendarTools/LibraryResources/Linux-x86-64" \
           "${pkgdir}/opt/Mathematica/SystemFiles/Links/CloudObject/LibraryResources/Linux-x86-64" \
           "${pkgdir}/opt/Mathematica/SystemFiles/Links/DTWTools/LibraryResources/Linux-x86-64" \
           "${pkgdir}/opt/Mathematica/SystemFiles/Links/FDLLink/LibraryResources/Linux-x86-64" \
           "${pkgdir}/opt/Mathematica/SystemFiles/Links/GIFTools/LibraryResources/Linux-x86-64" \
           "${pkgdir}/opt/Mathematica/SystemFiles/Links/GeometryTools/LibraryResources/Linux-x86-64" \
           "${pkgdir}/opt/Mathematica/SystemFiles/Links/HDF5Tools/LibraryResources/Linux-x86-64" \
           "${pkgdir}/opt/Mathematica/SystemFiles/Links/IPOPTLink/LibraryResources/Linux-x86-64" \
           "${pkgdir}/opt/Mathematica/SystemFiles/Links/JLink/Kernel/SystemResources/Linux-x86-64" \
           "${pkgdir}/opt/Mathematica/SystemFiles/Links/JLink/SystemFiles/Libraries/Linux-x86-64" \
           "${pkgdir}/opt/Mathematica/SystemFiles/Links/JSONTools/LibraryResources/Linux-x86-64" \
           "${pkgdir}/opt/Mathematica/SystemFiles/Links/LibraryLink/LibraryResources/Linux-x86-64" \
           "${pkgdir}/opt/Mathematica/SystemFiles/Links/MIDITools/LibraryResources/Linux-x86-64" \
           "${pkgdir}/opt/Mathematica/SystemFiles/Links/MIMETools/LibraryResources/Linux-x86-64" \
           "${pkgdir}/opt/Mathematica/SystemFiles/Links/MP3Tools/LibraryResources/Linux-x86-64" \
           "${pkgdir}/opt/Mathematica/SystemFiles/Links/MQTTLink/LibraryResources/Linux-x86-64" \
           "${pkgdir}/opt/Mathematica/SystemFiles/Links/MQTTLink/Resources/Binaries/Linux-x86-64" \
           "${pkgdir}/opt/Mathematica/SystemFiles/Links/MathLink/DeveloperKit/Linux-x86-64" \
           "${pkgdir}/opt/Mathematica/SystemFiles/Links/MongoLink/LibraryResources/Linux-x86-64" \
           "${pkgdir}/opt/Mathematica/SystemFiles/Links/OGGTools/LibraryResources/Linux-x86-64" \
           "${pkgdir}/opt/Mathematica/SystemFiles/Links/OpenCLLink/LibraryResources/Linux-x86-64" \
           "${pkgdir}/opt/Mathematica/SystemFiles/Links/OpenCVLink/LibraryResources/Linux-x86-64" \
           "${pkgdir}/opt/Mathematica/SystemFiles/Links/OpenSURF/LibraryResources/Linux-x86-64" \
           "${pkgdir}/opt/Mathematica/SystemFiles/Links/ProcessLink/LibraryResources/Linux-x86-64" \
           "${pkgdir}/opt/Mathematica/SystemFiles/Links/RAWTools/LibraryResources/Linux-x86-64" \
           "${pkgdir}/opt/Mathematica/SystemFiles/Links/RLink/SystemFiles/Libraries/Linux-x86-64" \
           "${pkgdir}/opt/Mathematica/SystemFiles/Links/SerialLink/LibraryResources/Linux-x86-64" \
           "${pkgdir}/opt/Mathematica/SystemFiles/Links/SocketLink/LibraryResources/Linux-x86-64" \
           "${pkgdir}/opt/Mathematica/SystemFiles/Links/SoundFileTools/LibraryResources/Linux-x86-64" \
           "${pkgdir}/opt/Mathematica/SystemFiles/Links/StreamLink/LibraryResources/Linux-x86-64" \
           "${pkgdir}/opt/Mathematica/SystemFiles/Links/TesseractTools/LibraryResources/Linux-x86-64" \
           "${pkgdir}/opt/Mathematica/SystemFiles/Links/TetGenLink/LibraryResources/Linux-x86-64" \
           "${pkgdir}/opt/Mathematica/SystemFiles/Links/TinkerForgeWeatherStationTools/Binaries/Linux-x86-64" \
           "${pkgdir}/opt/Mathematica/SystemFiles/Links/TriangleLink/LibraryResources/Linux-x86-64" \
           "${pkgdir}/opt/Mathematica/SystemFiles/Links/UUID/LibraryResources/Linux-x86-64" \
           "${pkgdir}/opt/Mathematica/SystemFiles/Links/VernierLink/LibraryResources/Linux-x86-64" \
           "${pkgdir}/opt/Mathematica/SystemFiles/Links/WSTP/DeveloperKit/Linux-x86-64" \
           "${pkgdir}/opt/Mathematica/SystemFiles/Links/WebpTools/LibraryResources/Linux-x86-64" \
           "${pkgdir}/opt/Mathematica/SystemFiles/Links/XMPTools/LibraryResources/Linux-x86-64"
    fi

    ## The documentation takes up the majority of the disk space (4.7G+).  If you
    ## do not wish to have the documentation installed, uncomment the following
    ## lines.
    # msg2 "Removing documentation"
    # rm -rf "${pkgdir}/opt/Mathematica/Documentation"
}

# Local Variables:
# mode: sh
# End:
