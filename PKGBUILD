# Maintainer: Natalia Portillo <claunia@claunia.com>
packager='Natalia Portillo <claunia@claunia.com>'
_netcoretarget='netcoreapp3.1'
_aarubase='Aaru'
pkgname='aaru'
pkgver=5.2.0.3330
pkgrel=1
pkgdesc='Disc image management and creation tool for disks, tapes, optical and solid state media'
arch=('x86_64' 'armv7h' 'aarch64')
url='http://www.aaru.app'
license=('GPL')
source=('https://github.com/aaru-dps/Aaru/releases/download/v5.2.0.3330/aaru-src-5.2.0.3330.tar.xz'
        'https://github.com/aaru-dps/Aaru/releases/download/v5.2.0.3330/aaru-src-5.2.0.3330.tar.xz.asc')
sha256sums=('f76c9efff49ab893b68a08e3ec32407a88335b6bd9448dda30b026f722f40aaa'
            'SKIP')
validpgpkeys=('236F1E21B540FC0D40F7AD1751D20488C724CA9F')
makedepends=('dotnet-sdk>=3.1.0')
options=('staticlibs')
provides=('aaru')
conflicts=('aaru')
depends=('icu' 'krb5' 'libcurl.so' 'libunwind' 'openssl-1.0' 'zlib')

if [ $arch == 'aarch64' ]; then
    dotnet_rid=linux-arm64
elif [ $arch == 'armv7h' ]; then
    dotnet_rid=linux-arm
else
    dotnet_rid=linux-x64
fi

build() {
    cd "${srcdir}"/"${_aarubase}"
    dotnet publish -f ${_netcoretarget} -c Release --self-contained -r ${dotnet_rid}
}

package() {
    # Install MIME database file
    cd "${srcdir}"/"${_aarubase}"
    install -d -m0755 -g 0 "${pkgdir}"/usr/share/mime/packages
    install -m0755 -g 0 -t "${pkgdir}"/usr/share/mime/packages aaruformat.xml

    cd "${srcdir}"/"${_aarubase}"/bin/Release/${_netcoretarget}/${dotnet_rid}/publish

    # Create destination directory
    install -d -m0755 -g 0 "${pkgdir}"/opt/Aaru

    # Copy Linux binary
    install -m0755 -g 0 -t "${pkgdir}"/opt/Aaru aaru

    # Copy Linux dependencies
    install -m0755 -g 0 -t "${pkgdir}"/opt/Aaru *.so
    install -m0755 -g 0 -t "${pkgdir}"/opt/Aaru *.a
    install -m0755 -g 0 -t "${pkgdir}"/opt/Aaru createdump

    # Copy .NET dependencies
    install -m0755 -g 0 -t "${pkgdir}"/opt/Aaru *.dll

    # Copy .NET configuration files
    install -m0644 -g 0 -t "${pkgdir}"/opt/Aaru *.json

    # Copy documentation files
    install -m0644 -g 0 -t "${pkgdir}"/opt/Aaru *.md
    install -m0644 -g 0 -t "${pkgdir}"/opt/Aaru LICENSE*

    # Link executable
    install -d -m0755 -g 0 "${pkgdir}"/usr/bin
    ln -sf /opt/Aaru/aaru "${pkgdir}"/usr/bin/aaru
}

post_install() {
  xdg-icon-resource forceupdate --theme hicolor &>/dev/null
  update-mime-database usr/share/mime &>/dev/null
  update-desktop-database -q
}

post_upgrade() {
  post_install "$1"
}

post_remove() {
  post_install "$1"
}
