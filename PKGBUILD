# Maintainer: sukanka <su975853527 [AT] gmail.com>
pkgname=fbreader-bin
_pkgname=fbreader
pkgver=2.0beta13
_snap_ver=19
pkgrel=1
pkgdesc="An e-book reader for Linux"
arch=('x86_64')
url="http://www.fbreader.org/"
license=('unknown')
depends=('qt6-5compat' 'hicolor-icon-theme')
makedepends=('squashfs-tools')
provides=('fbreader')
conflicts=('fbreader')
source=("${_pkgname}-${pkgver}.snap::https://api.snapcraft.io/api/v1/snaps/download/ePTZ3tz7FWi8tBNQ2Ii0dHw8U5Vmv8Ib_${_snap_ver}.snap")

# download url
# curl -H 'X-Ubuntu-Series: 16' https://api.snapcraft.io/api/v1/snaps/details/fbreader | jq '.download_url' -r
sha256sums=('b15b463291427de64ebbc2bd3108c19a4d48e6188da4ad3b758c941b121cfa11')

prepare() {
  cd $srcdir
  unsquashfs -f ${_pkgname}-${pkgver}.snap /bin/FBReader \
              /meta/gui/fbreader.desktop  /meta/gui/*.png \
              /usr/lib/libunibreak.so.1.0.1 \
              /usr/lib/$CARCH-linux-gnu/{libicui18n.so.66.1,libicuuc.so.66.1,libicudata.so.66.1}
  sed 's|${SNAP}/meta/gui/fbreader.png|fbreader|g' -i squashfs-root/meta/gui/fbreader.desktop
}


package() {
  cd "$srcdir"/squashfs-root
  install -Dm755 bin/FBReader ${pkgdir}/usr/bin/fbreader
  install -Dm644 meta/gui/${_pkgname}.desktop -t ${pkgdir}/usr/share/applications
  install -Dm644 meta/gui/icon.png  \
    ${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_pkgname}.png
  cd usr/lib
  install -Dm755 libunibreak.so.1.0.1 ${pkgdir}/usr/lib/libunibreak.so.1
  cd $CARCH-linux-gnu
  install -Dm755 libicui18n.so.66.1 ${pkgdir}/usr/lib/libicui18n.so.66
  install -Dm755 libicuuc.so.66.1 ${pkgdir}/usr/lib/libicuuc.so.66
  install -Dm755 libicudata.so.66.1 ${pkgdir}/usr/lib/libicudata.so.66
}
