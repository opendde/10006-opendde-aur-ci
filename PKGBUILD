pkgname=mailru-cloud
pkgver=15.06.0108
pkgrel=1
pkgdesc="Client for Mail.ru Cloud service"
arch=('x86_64' 'i686')
url="https://cloud.mail.ru/"
license=("custom")
depends=("qt5-base" "qt5-x11extras")
makedepends=("rpmextract")

majver=15.06
minver=0108
fullname=mail.ru-cloud

if [[ ${CARCH} == "i686" ]]; then
	arch='i386'
    source=("https://linuxdesktopcloud.mail.ru/rpm/default/${fullname}-fedora-${majver}-${minver}.${arch}.rpm")
    sha256sums=("9d749702e729968c942819f474ae06fb1bf4662085e78b3f8f72515cfbe3b4c6")
elif [[ ${CARCH} == "x86_64" ]]; then
	arch=${CARCH}
    source=("https://linuxdesktopcloud.mail.ru/rpm/default/${fullname}-fedora-${majver}-${minver}.${arch}.rpm")
    sha256sums=("c5393f01931d9e80882c32f927f3fb4151c8ea99b3ff268346b0a8c0b40ba348")
fi

build() {
	cd "${srcdir}"
	if [[ ${CARCH} == "i686" ]]; then
		arch='i386'
	elif [[ ${CARCH} == "x86_64" ]]; then
		arch=${CARCH}
	fi
	rpmextract.sh ${fullname}-fedora-${majver}-${minver}.${arch}.rpm
}

package() {
	cd "${srcdir}"
	sed -i 's/Internet/Internet;Network/g' usr/share/applications/mail.ru-cloud.desktop
	sed -i 's/=cloud/=mailru-cloud/g' usr/share/applications/mail.ru-cloud.desktop
	cp -r usr "${pkgdir}"
	cd "${pkgdir}"
	mv usr/bin/cloud usr/bin/mailru-cloud
}

