# Maintainer: Carson Mullins <SeptemAUR@pm.me>
pkgname=nordpass-bin
pkgver=4.28.7
pkgrel=1
pkgdesc="Secure and intuitive password manager (snap release)"
arch=('x86_64')
url="https://nordpass.com/"
license=('custom')
depends=('gtk3' 'libsecret' 'alsa-lib' 'nss')
makedepends=('squashfs-tools')
options=('!strip')
provides=('nordpass')
_snapid="00CQ2MvSr0Ex7zwdGhCYTa0ZLMw3H6hf"
_snaprev=140
source=('LICENSE'
        "https://api.snapcraft.io/api/v1/snaps/download/${_snapid}_${_snaprev}.snap")
sha256sums=('5df1f0e6fceda22263443143e96311f626e6edff1b2db346b843dfc523ec2ef9'
            'bf1b1120bb75a38108ffb680ccd6f351a139e0bd9b739ba4f888d7e939933cbf')

prepare() {
  echo "Extracting snap file..."
  unsquashfs -q -f -d "${srcdir}/${pkgname}" "${_snapid}_${_snaprev}.snap"
}

package() {
  # Install files
  install -d "${pkgdir}/opt/${pkgname}"
  cp -r "${srcdir}/${pkgname}/." "${pkgdir}/opt/${pkgname}"

  # Desktop Entry
  sed -i 's|${SNAP}/meta/gui/icon.png|nordpass|g' \
	  "${pkgdir}/opt/${pkgname}/meta/gui/nordpass.desktop"
  install -Dm644 "${pkgdir}/opt/${pkgname}/meta/gui/nordpass.desktop" \
	  -t "${pkgdir}/usr/share/applications"
  install -Dm644 "${pkgdir}/opt/${pkgname}/meta/gui/icon.png" \
	  "${pkgdir}/usr/share/pixmaps/nordpass.png"

  # Clean up unnecessary files
  rm -rf "${pkgdir}/opt/${pkgname}"/{data-dir,gnome-platform,lib,meta,scripts,usr,*.sh}

  # Symlink binary to /usr/bin
  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/nordpass" "${pkgdir}/usr/bin"

  # Install license
  # https://my.nordaccount.com/legal/terms-of-service/
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
