# Maintainer: Niklas <dev@n1klas.net>

pkgname='homegear-homematicbidcos'
_gitname='Homegear-HomeMaticBidCoS'
pkgdesc='HomeMatic BidCoS module for Homegear'
pkgver=0.7.15
pkgrel=1
arch=('x86_64' 'i686' 'armv6h' 'armv7h' 'aarch64')
license=('GPL3')
url="https://homegear.eu"
depends=('homegear')
source=("https://github.com/Homegear/${_gitname}/archive/${pkgver}.tar.gz")
sha512sums=('b2b57e216f8820abba45dd715ed3e1fc13297a42ecb14f5a1df4742a1214ba49da7eedd717a5a9661374be1233df5b975ae3a748fc7d5fb3d8de371ee14eb7f1')
install=homegear-homematicbidcos.install
backup=('etc/homegear/families/homematicbidcos.conf')

prepare() {
    cd "${srcdir}/${_gitname}-${pkgver}"

    # Use the our version number instead of the script which would have fetched it from Github
    sed -i -e "s#m4_esyscmd_s(\[./getVersion.sh\])#${pkgver}#" configure.ac
    # Put the modules in /usr/lib instead of /var/lib because that is where they belong
    sed -i -e 's#libdir = $(localstatedir)/lib/homegear/modules#libdir = $(prefix)/lib/homegear/modules#' src/Makefile.am
    # Always put the downloaded firmware where they belong no matter where the script is
    sed -i -e 's#$( cd "$(dirname $0)" && pwd )#/var/lib/homegear/firmware#g' misc/Data\ Directory/firmware/GetFirmwareUpdatesHomeMaticBidCoS.sh
}

build() {
    cd "${srcdir}/${_gitname}-${pkgver}"

    ./bootstrap
    ./configure --prefix=/usr --localstatedir=/var --sysconfdir=/etc --libdir=/usr/lib
	make
}

package() {
    cd "${srcdir}/${_gitname}-${pkgver}"

    make DESTDIR="${pkgdir}" install

    install -Dm644 misc/Config\ Directory/homematicbidcos.conf "${pkgdir}"/etc/homegear/families/homematicbidcos.conf
    install -dm755 "${pkgdir}"/etc/homegear/devices/0
    cp -r misc/Device\ Description\ Files/* "${pkgdir}"/etc/homegear/devices/0
    chmod 644 "${pkgdir}"/etc/homegear/devices/0/*

    install -Dm755 misc/Data\ Directory/firmware/GetFirmwareUpdatesHomeMaticBidCoS.sh "${pkgdir}"/usr/bin/homegear-homematicbidcos-update-firmware

    cd "${pkgdir}"/etc/homegear/devices/0
    for filename in *.xml
    do
        backup+=("etc/homegear/devices/0/${filename}")
    done
}
