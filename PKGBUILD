# Maintainer: Logan Fron <loganfron@gmail.com>

_pkgname=fflogs-uploader
pkgname=${_pkgname}-appimage
pkgver=5.8.9
pkgrel=1
pkgdesc="FFLogs Uploader appimage"
arch=('x86_64')
url="https://github.com/RPGLogs/Uploaders-fflogs/"
license=('unknown')
depends=('zlib' 'hicolor-icon-theme')
options=(!strip)
_appimage="ff-logs-uploader-${pkgver}.AppImage"
source_x86_64=("${_appimage}::${url}releases/download/v${pkgver}/FF-Logs-Uploader-${pkgver}.AppImage"
		"${_pkgname}.desktop")
noextract=("${_appimage}")
sha256sums_x86_64=('b1652297a0d6ab490fca266ad1b534d7838d490855d0ee3b976a24a48297c988'
                   '72fa6c3d71521f04ea45fc35b5f353d54ac0c547514d31d9b4c178b90cb05194')

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
	}

build() {
	# fix permissions; .AppImage permissions are 700 for all directories
	chmod -R a-x+rX squashfs-root/usr
	#appending version to desktop file
	echo -e "\nX-AppImage-Version=${pkgver}" >> "${_pkgname}.desktop"
}

package() {
    # AppImage
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"

    # install .desktop and append version
    install -Dm644 "${srcdir}/${_pkgname}.desktop"\
            "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    # install icons
    install -dm755 "${pkgdir}/usr/share/"
    cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"

    # symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"
}
