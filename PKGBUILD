# Maintainer: taotieren <admin@taotieren.com>

_pkgname=SerialTest
pkgname=serialtest
pkgver=0.1.3
pkgrel=1
pkgdesc="A cross-platform serial port test tool."
arch=('any')
url="https://github.com/wh201906/SerialTest"
license=('GPL2.1')
provides=(${_pkgname})
conflicts=(${pkgname}-git)
#replaces=(${pkgname})
depends=('qcustomplot' 'qt6-serialport')
makedepends=('qt6-tools')
backup=()
options=('!strip')
install=${pkgname}.install
source=("${_pkgname}-${pkgver}.tar.gz::https://ghproxy.com/${url}/archive/refs/tags/V${pkgver}.tar.gz"
        "${pkgname}.install")
sha256sums=('e2583ebe87411bedc30450fa51b31cd2d65c45845476b86b2be2a5077565ecdf'
            '303f34246c0d341e1093d6e486e2cbfdbbb0d122d751de649f562ebac37777b4')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}/src/"
    qmake
    make
}

package() {
    install -Dm0755 "${srcdir}/${_pkgname}-${pkgver}/src/${_pkgname}"  "${pkgdir}/usr/bin/${pkgname}"

    install -Dm0644 /dev/stdin "${pkgdir}/usr/share/metainfo/io.github.wh201906.serialtest.metainfo.xml" << EOF
<?xml version="1.0" encoding="UTF-8"?>
<component type="desktop-application">
  <id>io.github.wh201906.serialtest</id>

  <name>SerialTest</name>
  <summary>SerialTest</summary>

  <metadata_license>MIT</metadata_license>
  <project_license>GPL-2.0-or-later</project_license>

  <description>
    <p>
      A cross-platform serial port test tool.
    </p>
  </description>

  <launchable type="desktop-id">io.github.wh201906.serialtest.desktop</launchable>
</component>
EOF

    install -Dm0644 /dev/stdin "${pkgdir}/usr/share/applications/io.github.wh201906.serialtest.desktop" << EOF
[Desktop Entry]
Version=1.0
Type=Application

Name=SerialTest
Comment=SerialTest
Categories=Development;Electronics;

Icon=serialtest
Exec=serialtest
Terminal=false
EOF

    install -Dm0644 "${srcdir}/${_pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
#    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/${_pkgname}/pkg/20-usb-serial.rules" "${pkgdir}/etc/udev/rules.d/20-usb-serial.rules"
}
