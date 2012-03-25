# Maintainer: Keshav P R <(the.ridikulus.rat) (aatt) (gemmaeiil) (ddoott) (ccoomm)>

# _GNU_EFI_LIB_DIR="/usr/lib"

_actualname="refind"
_pkgname="${_actualname}-x86_64"
pkgname="${_pkgname}"

pkgver="0.2.2"
pkgrel="1"
pkgdesc="Rod Smith's fork of rEFIt (U)EFI Boot Manager"
url="http://www.rodsbooks.com/refind/index.html"
arch=('any')
license=('GPL3' 'custom')

makedepends=('gnu-efi')
depends=('dosfstools' 'efibootmgr')
optdepends=('mactel-boot: For bless command in Apple Mac systems')

backup=('boot/efi/efi/arch_refind/refind.conf'
        'boot/efi/efi/arch_refind/linux.conf')

options=('!strip' 'docs')

source=("http://downloads.sourceforge.net/refind/refind-src-${pkgver}.zip"
        'linux.conf')

sha256sums=('45071370d083f3eb46add92c45463d42e444d07d85e320bb675bae04d1ccb0e6'
            '7ca14bd8cca670201ce3f5e9bb5d1a8610a9d8f05c2260eb29aaad08e652e5c8')

build() {
	
	if [[ "${CARCH}" != "x86_64" ]]; then
		echo "${pkgname} package can be built only in a x86_64 system. Exiting."
		exit 1
	fi
	
	cd "${srcdir}/refind-${pkgver}/"
	
	make
	
}

package() {
	
	cd "${srcdir}/refind-${pkgver}/"
	
	## install the rEFInd x86_64 UEFI app
	install -d "${pkgdir}/boot/efi/efi/arch_refind/"
	install -D -m0644 "${srcdir}/refind-${pkgver}/refind/refind.efi" "${pkgdir}/boot/efi/efi/arch_refind/refindx64.efi"
	
	## install the rEFInd config file
	install -D -m0644 "${srcdir}/refind-${pkgver}/refind.conf-sample" "${pkgdir}/boot/efi/efi/arch_refind/refind.conf"
	install -D -m0644 "${srcdir}/linux.conf" "${pkgdir}/boot/efi/efi/arch_refind/linux.conf"
	
	## install the rEFInd icons
	install -d "${pkgdir}/boot/efi/efi/arch_refind/icons/"
	install -D -m0644 "${srcdir}/refind-${pkgver}/icons"/* "${pkgdir}/boot/efi/efi/arch_refind/icons/"
	
	## install the rEFInd docs
	install -d "${pkgdir}/usr/share/refind/docs/html/"
	install -d "${pkgdir}/usr/share/refind/docs/Styles/"
	install -D -m0644 "${srcdir}/refind-${pkgver}/docs/refind"/* "${pkgdir}/usr/share/refind/docs/html/"
	install -D -m0644 "${srcdir}/refind-${pkgver}/docs/Styles"/* "${pkgdir}/usr/share/refind/docs/Styles/"
	install -D -m0644 "${srcdir}/refind-${pkgver}/README.txt" "${pkgdir}/usr/share/refind/docs/README.txt"
	rm -f "${pkgdir}/usr/share/refind/docs/html/.DS_Store" || true
	
	## install the rEFIt license file, since rEFInd is a fork of rEFIt
	install -d "${pkgdir}/usr/share/licenses/refind-x86_64/"
	install -D -m0644 "${srcdir}/refind-${pkgver}/LICENSE.txt" "${pkgdir}/usr/share/licenses/refind-x86_64/LICENSE"
	
}
